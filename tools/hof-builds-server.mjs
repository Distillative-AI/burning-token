#!/usr/bin/env node
// hof-builds-server.mjs
//
// Localhost UI for tracking, per city, the latest builds (planning/city-council
// agenda items) alongside policy actions (adopted ordinances / zoning changes /
// ballot measures) — sourced live from the /cfd HOF chronology under
// HOF/**/*.af.scm. No LLM, no build step, no npm deps: plain Node http server,
// re-reads the chronology on every request.
//
// Two citizen schemas power this, both defined under HOF/2026/09/05/12/:
//
//   (af:city-agenda-item city body meeting-date agenda-item source-url)
//   (af:adopted-ordinance city ordinance-number title adopted-date effective-date source-url)
//
// Pilot city: San Mateo (default view; other ingested cities are selectable).
//
// Usage: node tools/hof-builds-server.mjs [port]

import http from "node:http";
import { readFile, readdir } from "node:fs/promises";
import path from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const REPO_ROOT = path.resolve(__dirname, "..");
const HOF_ROOT = path.join(REPO_ROOT, "HOF");
const PORT = Number(process.argv[2]) || 4173;
const PILOT_CITY = "san-mateo";
// Fundamental framing for this tool (per user direction): the load-bearing problem
// is incumbents using procedural/regulatory leverage to push housing prices higher
// by blocking or delaying supply. "Upcoming" committee meetings are surfaced
// separately and first, because that's the actual point of intervention — a public
// body meeting is where an activist can still show up and speak before an outcome
// is locked in; a past meeting is a record only.
const TODAY = new Date().toISOString().slice(0, 10);

// Where to send written public comment, per city — landing pages only, sourced
// from HOF/sources/<city>/SOURCES.md. Deliberately does NOT name individual
// council/commission members or email addresses: rosters turn over and
// fabricating a name/email here would be worse than not having one — a live
// research pass (/fundamental-ingestion pulling the current roster + clerk
// contact) is required before this can list a specific recipient.
const WRITE_LETTER_ROUTES = {
  "san-mateo": {
    url: "https://www.cityofsanmateo.org/100/Planning-Commission",
    note: "Planning Commission landing page — current roster/clerk contact not yet researched.",
  },
  "menlo-park": {
    url: "https://www.menlopark.gov/Agendas-and-minutes",
    note: "Agendas & minutes hub — each meeting packet lists the clerk email for written comment.",
  },
  "millbrae": {
    url: "https://www.ci.millbrae.ca.us/AgendaCenter/Planning-Commission-8/",
    note: "AgendaCenter portal — check the specific meeting packet for the comment-submission address.",
  },
};

// Housing-relevant keyword sniff — flags which agenda items / ordinances are
// actual housing-production matter vs. incidental docket items (officer
// elections, unrelated commercial permits, cancellations, parking-only, etc).
const HOUSING_SIGNAL =
  /\b(dwelling units?|residential|multi-family|housing|adu\b|density bonus|builder'?s remedy|apartments?|condominiums?|units?\b|rhna|sb\s?9|sb\s?35|sb\s?79|sb\s?10|zoning|upzon|rezon)/i;

// The mechanism taxonomy is not invented here — it's the project's own closed
// "fundamentals" enum from HOF/2026/09/05/21/af-shenanigan-mechanism-type.af.scm
// (the HOW axis of the housing.shenanigans structural-capture model). Policy
// actions are classified against it by keyword heuristic so the categorization
// stays traceable to that citizen rather than an ad hoc label set invented here.
const MECHANISM_FUNDAMENTALS = [
  {
    key: "ceqa-litigation",
    label: "CEQA litigation",
    // A CEQA *exemption* (e.g. "CEQA-exempt under PRC § 21080.66") is the
    // opposite of CEQA being wielded as a capture mechanism — it means the
    // review step was bypassed, not weaponized — so exemption language must
    // NOT match here even though it mentions "CEQA".
    pattern: /ceqa (?:lawsuit|litigation|appeal|challenge|suit|complaint)|sue(?:d|s)? (?:the )?city|environmental impact report requirement disputed/i,
  },
  {
    key: "ballot-box-supermajority",
    label: "Ballot-box supermajority",
    pattern: /\bmeasure\s+[a-z]\b|\bballot\b|voter approval|citizen-sponsored initiative|\binitiative\b/i,
  },
  {
    key: "discretionary-design-review",
    label: "Discretionary design review",
    pattern: /discretionary|design review|use permit|conditional use/i,
  },
  {
    key: "subjective-design-standard",
    label: "Subjective design standard",
    pattern: /objective design standards?/i,
  },
  {
    key: "pla-linked-appeal",
    label: "PLA-linked appeal",
    pattern: /project labor agreement|\bpla\b/i,
  },
  {
    key: "minimum-lot-size-setback",
    label: "Min. lot size / setback / height cap",
    pattern: /setback|lot size|floor area ratio|\bfar\b cap|height cap|height limit/i,
  },
  {
    key: "fiscal-zoning-prop13",
    label: "Fiscal zoning (Prop 13)",
    pattern: /prop(?:osition)?\s?13|fiscal(?:ization)?|sales[- ]tax|commercial zoning/i,
  },
];

function classifyMechanism(text) {
  for (const m of MECHANISM_FUNDAMENTALS) {
    if (m.pattern.test(text)) return m.key;
  }
  return null; // no fundamental matched — likely an enabling/upzoning ordinance, not a capture mechanism
}

async function* walk(dir) {
  let entries;
  try {
    entries = await readdir(dir, { withFileTypes: true });
  } catch {
    return;
  }
  for (const e of entries) {
    const p = path.join(dir, e.name);
    if (e.isDirectory()) yield* walk(p);
    else if (e.isFile() && e.name.endsWith(".af.scm")) yield p;
  }
}

// (af:city-agenda-item "city" 'body "date" "text" "url")
const AGENDA_RE =
  /af:city-agenda-item\s+"([^"]+)"\s+'([a-zA-Z-]+)\s+"([^"]+)"\s+"((?:[^"])*)"\s+"([^"]+)"\s*\)/g;

// (af:adopted-ordinance "city" <#f|"num"> "title" <#f|"date"> <#f|"date"> "url")
const ORD_RE =
  /af:adopted-ordinance\s+"([^"]+)"\s+(#f|"[^"]*")\s+"((?:[^"])*)"\s+(#f|"[^"]*")\s+(#f|"[^"]*")\s+"([^"]+)"\s*\)/g;

function unwrapMaybeString(tok) {
  if (tok === "#f") return null;
  return tok.slice(1, -1);
}

async function loadChronology() {
  const agendaItems = [];
  const ordinances = [];
  for await (const file of walk(HOF_ROOT)) {
    const base = path.basename(file);
    const rel = path.relative(REPO_ROOT, file);

    if (
      src_includes_agenda(base) &&
      base !== "af-city-agenda-item.af.scm" &&
      base !== "af-city-agenda-item-example.af.scm"
    ) {
      const src = await readFile(file, "utf8");
      const bodyOnly = src.replace(/\(define \(af:city-agenda-item[\s\S]*?\n\n/, "");
      let m;
      while ((m = AGENDA_RE.exec(bodyOnly))) {
        const [, city, body, meetingDate, agendaItem, sourceUrl] = m;
        const isCancelled = /^cancell?ed\b/i.test(agendaItem) || /notice of cancellation/i.test(agendaItem);
        agendaItems.push({
          kind: "build",
          city,
          body,
          date: meetingDate,
          text: agendaItem,
          sourceUrl,
          housingSignal: HOUSING_SIGNAL.test(agendaItem),
          mechanism: classifyMechanism(agendaItem),
          isUpcoming: !isCancelled && meetingDate >= TODAY,
          canParticipate: !isCancelled && meetingDate >= TODAY, // public body meeting, not yet held
          citizen: rel,
        });
      }
    }

    if (
      src_includes_ordinance(base) &&
      base !== "af-adopted-ordinance.af.scm" &&
      base !== "af-adopted-ordinance-example.af.scm"
    ) {
      const src = await readFile(file, "utf8");
      const bodyOnly = src.replace(/\(define \(af:adopted-ordinance[\s\S]*?\n\n/, "");
      let m;
      while ((m = ORD_RE.exec(bodyOnly))) {
        const [, city, ordNum, title, adoptedDate, effectiveDate, sourceUrl] = m;
        ordinances.push({
          kind: "policy",
          city,
          ordinanceNumber: unwrapMaybeString(ordNum),
          title,
          date: unwrapMaybeString(adoptedDate) || unwrapMaybeString(effectiveDate),
          adoptedDate: unwrapMaybeString(adoptedDate),
          effectiveDate: unwrapMaybeString(effectiveDate),
          sourceUrl,
          housingSignal: HOUSING_SIGNAL.test(title),
          mechanism: classifyMechanism(title),
          citizen: rel,
        });
      }
    }
  }
  // Upcoming meetings first (soonest first — that's the actual participation
  // window), then past meetings most-recent-first as a record.
  agendaItems.sort((a, b) => {
    if (a.isUpcoming !== b.isUpcoming) return a.isUpcoming ? -1 : 1;
    return a.isUpcoming ? (a.date > b.date ? 1 : -1) : (a.date < b.date ? 1 : -1);
  });
  ordinances.sort((a, b) => (String(a.date) < String(b.date) ? 1 : -1));
  return { agendaItems, ordinances };
}

function src_includes_agenda(base) {
  return base.startsWith("af-agenda-") || base.includes("city-agenda-item");
}
function src_includes_ordinance(base) {
  return base.startsWith("af-ord-") || base.includes("adopted-ordinance");
}

// Cross-reference: for a given city, pair each build with ordinances from the
// same city whose housing-signal text plausibly bears on it (same city is the
// only hard link the data gives us today; a shared housing-signal keyword is
// used as a soft relevance bump so the strongest matches surface first).
function crossReference(city, agendaItems, ordinances) {
  const builds = agendaItems.filter((a) => a.city === city);
  const policies = ordinances.filter((o) => o.city === city);
  const pairs = builds
    .filter((b) => b.housingSignal)
    .map((b) => {
      const related = policies
        .filter((p) => p.housingSignal)
        .map((p) => ({ ...p, _relevance: sharedTermScore(b.text, p.title) }))
        .sort((x, y) => y._relevance - x._relevance);
      return { build: b, relatedPolicies: related };
    });
  return { builds, policies, pairs };
}

function sharedTermScore(a, b) {
  const wordsA = new Set(a.toLowerCase().match(/[a-z]{4,}/g) || []);
  const wordsB = (b.toLowerCase().match(/[a-z]{4,}/g) || []);
  let score = 0;
  for (const w of wordsB) if (wordsA.has(w)) score++;
  return score;
}

function html() {
  return `<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Latest Builds &amp; Policy Actions</title>
<style>
  :root {
    color-scheme: light dark;
    --bg: #0b0d10; --panel: #14171c; --border: #262b33;
    --text: #e8ebef; --muted: #8b93a1;
    --accent: #ff7a45; --housing: #3ddc84; --other: #4a5568; --policy: #5b8dee;
  }
  @media (prefers-color-scheme: light) {
    :root {
      --bg: #f6f7f9; --panel: #ffffff; --border: #e2e5ea;
      --text: #1a1d21; --muted: #5f6774;
      --accent: #d9531e; --housing: #1a9b57; --other: #9aa3af; --policy: #2a5ed6;
    }
  }
  * { box-sizing: border-box; }
  body { margin: 0; background: var(--bg); color: var(--text); font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif; }
  header { padding: 28px 32px 0; border-bottom: 1px solid var(--border); }
  h1 { margin: 0 0 4px; font-size: 22px; letter-spacing: -0.01em; }
  .sub { color: var(--muted); font-size: 13px; margin-bottom: 18px; }
  .sub code { background: var(--panel); border: 1px solid var(--border); border-radius: 4px; padding: 1px 5px; }
  .about {
    margin: 16px 0 4px; padding: 12px 16px; background: var(--panel);
    border: 1px solid var(--border); border-radius: 10px; font-size: 13px;
  }
  .about summary { cursor: pointer; font-weight: 700; color: var(--text); list-style: none; }
  .about summary::-webkit-details-marker { display: none; }
  .about summary::before { content: "▸ "; color: var(--accent); }
  .about[open] summary::before { content: "▾ "; }
  .about-hint { font-weight: 400; color: var(--muted); font-size: 12px; }
  .about-body { margin-top: 10px; color: var(--muted); line-height: 1.6; }
  .about-body p { margin: 0 0 10px; }
  .about-body p:last-child { margin-bottom: 0; }
  .about-body code { background: var(--bg); border: 1px solid var(--border); border-radius: 4px; padding: 1px 5px; font-size: 12px; }
  .about-body em { color: var(--text); font-style: normal; font-weight: 600; }
  .tabs { display: flex; gap: 4px; }
  .tab {
    padding: 10px 16px; font-size: 13px; font-weight: 600; cursor: pointer;
    color: var(--muted); border-bottom: 2px solid transparent; user-select: none;
  }
  .tab.active { color: var(--text); border-bottom-color: var(--accent); }
  .controls {
    display: flex; gap: 10px; align-items: center;
    padding: 16px 32px; border-bottom: 1px solid var(--border); flex-wrap: wrap;
  }
  select, button { background: var(--panel); color: var(--text); border: 1px solid var(--border); border-radius: 6px; padding: 7px 12px; font-size: 13px; cursor: pointer; }
  button.primary { background: var(--accent); border-color: var(--accent); color: #fff; font-weight: 600; }
  label.chk { font-size: 13px; color: var(--muted); display: flex; align-items: center; gap: 6px; }
  .stat { font-size: 13px; color: var(--muted); margin-left: auto; }
  main { padding: 24px 32px 60px; max-width: 940px; margin: 0 auto; }
  .panel { display: none; }
  .panel.active { display: block; }
  .card { background: var(--panel); border: 1px solid var(--border); border-radius: 10px; padding: 16px 18px; margin-bottom: 12px; }
  .card-head { display: flex; justify-content: space-between; align-items: baseline; gap: 12px; margin-bottom: 6px; }
  .date { font-variant-numeric: tabular-nums; font-weight: 600; font-size: 13px; color: var(--muted); }
  .badge { display: inline-block; font-size: 11px; font-weight: 700; letter-spacing: 0.02em; padding: 2px 8px; border-radius: 999px; text-transform: uppercase; }
  .badge.housing { background: color-mix(in srgb, var(--housing) 20%, transparent); color: var(--housing); }
  .badge.other { background: color-mix(in srgb, var(--other) 20%, transparent); color: var(--muted); }
  .badge.policy { background: color-mix(in srgb, var(--policy) 20%, transparent); color: var(--policy); }
  .badge.mechanism { background: color-mix(in srgb, var(--accent) 18%, transparent); color: var(--accent); }
  .badge.upcoming { background: color-mix(in srgb, var(--housing) 25%, transparent); color: var(--housing); }
  .participate-card { border-left: 3px solid var(--housing); }
  .mechanism-group { margin-bottom: 22px; }
  .mechanism-group h3 { font-size: 13px; text-transform: uppercase; letter-spacing: 0.03em; color: var(--muted); margin: 0 0 10px; }
  .intro { font-size: 13px; color: var(--muted); line-height: 1.6; margin-bottom: 18px; padding: 12px 14px; background: var(--panel); border: 1px solid var(--border); border-radius: 8px; }
  .badge.letter { background: color-mix(in srgb, var(--accent) 20%, transparent); color: var(--accent); }
  .timeline { position: relative; padding-left: 110px; }
  .tl-row { position: relative; margin-bottom: 16px; }
  .tl-date { position: absolute; left: -110px; top: 14px; width: 90px; text-align: right; font-size: 12px; font-weight: 700; color: var(--muted); }
  .tl-row::before { content: ""; position: absolute; left: -22px; top: 18px; width: 8px; height: 8px; border-radius: 50%; background: var(--accent); }
  .tl-row::after { content: ""; position: absolute; left: -18.5px; top: 26px; bottom: -16px; width: 1px; background: var(--border); }
  .tl-row:last-child::after { display: none; }
  .tl-card { background: var(--panel); border: 1px solid var(--border); border-radius: 10px; padding: 14px 16px; }
  .tl-card.tl-letter { border-left: 3px solid var(--accent); }
  .tl-card.tl-meeting { border-left: 3px solid var(--housing); }
  .tl-head { display: flex; align-items: center; gap: 8px; margin-bottom: 6px; }
  .tl-city { font-size: 12px; color: var(--muted); font-weight: 600; }
  .tl-action { margin-top: 8px; font-size: 13px; }
  @media (max-width: 640px) {
    .timeline { padding-left: 16px; }
    .tl-date { position: static; text-align: left; width: auto; display: block; margin-bottom: 6px; }
    .tl-row::before, .tl-row::after { display: none; }
  }
  .body-tag { font-size: 12px; color: var(--muted); }
  .item-text { font-size: 14px; line-height: 1.5; margin: 6px 0 10px; }
  .card a { color: var(--accent); text-decoration: none; font-size: 12px; }
  .card a:hover { text-decoration: underline; }
  .citizen { font-size: 11px; color: var(--muted); font-family: ui-monospace, monospace; margin-top: 6px; opacity: 0.7; }
  .empty { color: var(--muted); padding: 40px; text-align: center; }
  .xref-related { margin: 8px 0 0 0; padding: 10px 14px; border-left: 3px solid var(--policy); background: color-mix(in srgb, var(--policy) 8%, transparent); border-radius: 0 8px 8px 0; }
  .xref-related .rel-title { font-size: 12px; font-weight: 700; color: var(--policy); margin-bottom: 6px; }
  .xref-related .rel-item { font-size: 13px; margin-bottom: 4px; }
  .xref-related .rel-item .relevance { font-size: 11px; color: var(--muted); }
</style>
</head>
<body>
<header>
  <h1>🏗️ Latest Builds &amp; Policy Actions</h1>
  <div class="sub">Live from the <code>/cfd</code> HOF chronology (<code>HOF/**/*.af.scm</code>) — pilot city: <strong>San Mateo</strong></div>

  <details class="about" open>
    <summary>What is this? <span class="about-hint">(for anyone new to the project)</span></summary>
    <div class="about-body">
      <p><strong>The problem:</strong> San Mateo County has the Bay Area's highest rate of
      cities without a state-certified Housing Element — which is exactly the condition under
      which incumbent homeowners and NIMBY groups can use procedural tools (discretionary design
      review, CEQA threats, ballot-box supermajority requirements) to block or delay new housing,
      pushing prices up. This tool is a companion to the county's <em>Builder's Remedy Checker</em>
      project: where that app answers "can I build here," this one answers
      "what's happening right now, and what can an ordinary person actually do about it."</p>
      <p><strong>Where the data comes from:</strong> every item below is a real, sourced record —
      a planning-commission agenda item or an adopted ordinance — pulled from primary city sources
      (PrimeGov/Legistar/municipal-code portals) and stored as a small typed "citizen" file in this
      project's <code>/cfd</code> (chronology-first development) HOF store, e.g.
      <code>(af:city-agenda-item "san-mateo" 'planning-commission "2026-07-28" "…222 dwelling units…" "https://…")</code>.
      Nothing here is LLM-generated at request time — this page is a plain Node.js server that
      re-reads those files from disk on every load, so what you see is exactly what's been
      ingested, no more and no less.</p>
      <p><strong>The four tabs:</strong> <em>Participate</em> is the action-first view — a
      chronological timeline of write-a-letter and attend-a-meeting actions tied to real,
      not-yet-held meetings. <em>Latest Builds</em> is the full raw feed of agenda items.
      <em>Policy Actions</em> groups adopted ordinances by the project's own capture-mechanism
      taxonomy (CEQA litigation, ballot-box supermajority, discretionary design review, etc. —
      see <code>af-shenanigan-mechanism-type.af.scm</code>). <em>Cross-Reference</em> pairs each
      housing-relevant build with the policy actions plausibly shaping its outcome.</p>
      <p><strong>Coverage today:</strong> a handful of cities across San Mateo County (San Mateo
      is the pilot) with items ingested so far — this is an early, actively-growing slice of the
      county's full agenda/ordinance history, not a complete record yet.</p>
    </div>
  </details>

  <div class="tabs">
    <div class="tab active" data-tab="participate">Participate</div>
    <div class="tab" data-tab="builds">Latest Builds</div>
    <div class="tab" data-tab="policy">Policy Actions</div>
    <div class="tab" data-tab="xref">Cross-Reference</div>
  </div>
</header>
<div class="controls">
  <select id="citySelect"></select>
  <label class="chk"><input type="checkbox" id="housingOnly" /> housing-signal only</label>
  <button class="primary" id="refresh">Refresh</button>
  <span class="stat" id="stat"></span>
</div>
<main>
  <div class="panel active" id="panel-participate"></div>
  <div class="panel" id="panel-builds"></div>
  <div class="panel" id="panel-policy"></div>
  <div class="panel" id="panel-xref"></div>
</main>
<script>
let DATA = { agendaItems: [], ordinances: [], pilotCity: "san-mateo" };
const TODAY_ISO = new Date().toISOString().slice(0, 10);

const ALL_CITIES = "__all__";

async function load() {
  const res = await fetch("/api/chronology");
  DATA = await res.json();
  const cities = [...new Set([...DATA.agendaItems.map(i => i.city), ...DATA.ordinances.map(o => o.city)])].sort();
  const sel = document.getElementById("citySelect");
  // Default to "All cities" — the pilot city (San Mateo) alone has thin data
  // this early in ingestion; showing the full county-wide set by default is
  // what actually gets an activist to something actionable on first load.
  sel.innerHTML =
    \`<option value="\${ALL_CITIES}" selected>All ingested cities (San Mateo County)</option>\` +
    cities.map(c => \`<option value="\${c}">\${c}\${c === DATA.pilotCity ? " (pilot)" : ""}</option>\`).join("");
  render();
}

function escapeHtml(s) {
  return (s || "").replace(/[&<>]/g, c => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;" }[c]));
}

const MECHANISM_LABELS = {
  "ceqa-litigation": "CEQA litigation",
  "ballot-box-supermajority": "Ballot-box supermajority",
  "discretionary-design-review": "Discretionary design review",
  "subjective-design-standard": "Subjective design standard",
  "pla-linked-appeal": "PLA-linked appeal",
  "minimum-lot-size-setback": "Min. lot size / setback / height cap",
  "fiscal-zoning-prop13": "Fiscal zoning (Prop 13)",
};

function mechanismBadge(mechanism) {
  return mechanism ? \`<span class="badge mechanism">\${MECHANISM_LABELS[mechanism] || mechanism}</span>\` : "";
}

function buildCard(i) {
  return \`
    <div class="card \${i.canParticipate ? "participate-card" : ""}">
      <div class="card-head">
        <span class="date">\${i.date || "undated"}\${i.canParticipate ? " · upcoming" : ""}</span>
        <span>
          \${i.canParticipate ? '<span class="badge upcoming">Can participate</span>' : ""}
          <span class="badge \${i.housingSignal ? "housing" : "other"}">\${i.housingSignal ? "Housing" : "Other"}</span>
          \${mechanismBadge(i.mechanism)}
        </span>
      </div>
      <div class="body-tag">\${i.body.replace(/-/g, " ")} · \${i.city}</div>
      <div class="item-text">\${escapeHtml(i.text)}</div>
      <a href="\${i.sourceUrl}" target="_blank" rel="noopener">\${i.canParticipate ? "Agenda / how to comment ↗" : "Source ↗"}</a>
      <div class="citizen">\${i.citizen}</div>
    </div>\`;
}

function policyCard(o) {
  return \`
    <div class="card">
      <div class="card-head">
        <span class="date">\${o.date || "undated"}</span>
        <span>
          <span class="badge policy">Ordinance \${o.ordinanceNumber || "—"}</span>
          \${mechanismBadge(o.mechanism)}
        </span>
      </div>
      <div class="item-text">\${escapeHtml(o.title)}</div>
      <div class="body-tag">adopted: \${o.adoptedDate || "—"} · effective: \${o.effectiveDate || "—"}</div>
      <a href="\${o.sourceUrl}" target="_blank" rel="noopener">Source ↗</a>
      <div class="citizen">\${o.citizen}</div>
    </div>\`;
}

function cityMatches(itemCity, selected) {
  return selected === ALL_CITIES || itemCity === selected;
}

function daysUntil(dateStr) {
  const d = new Date(dateStr + "T00:00:00");
  const t = new Date(TODAY_ISO + "T00:00:00");
  return Math.round((d - t) / 86400000);
}

function render() {
  const city = document.getElementById("citySelect").value;
  const housingOnly = document.getElementById("housingOnly").checked;

  const builds = DATA.agendaItems.filter(i => cityMatches(i.city, city) && (!housingOnly || i.housingSignal));
  const policies = DATA.ordinances.filter(o => cityMatches(o.city, city) && (!housingOnly || o.housingSignal));

  document.getElementById("stat").textContent = builds.length + " build" + (builds.length === 1 ? "" : "s") + " · " + policies.length + " polic" + (policies.length === 1 ? "y" : "ies");

  renderParticipateTimeline(city, builds);

  const bPanel = document.getElementById("panel-builds");
  bPanel.innerHTML = builds.length ? builds.map(buildCard).join("") : '<div class="empty">No agenda items ingested yet for this city.</div>';

  const pPanel = document.getElementById("panel-policy");
  if (!policies.length) {
    pPanel.innerHTML = '<div class="empty">No ordinance citizens ingested yet for this city.</div>';
  } else {
    const groups = new Map();
    for (const o of policies) {
      const key = o.mechanism || "uncategorized";
      if (!groups.has(key)) groups.set(key, []);
      groups.get(key).push(o);
    }
    const order = [...Object.keys(MECHANISM_LABELS), "uncategorized"];
    pPanel.innerHTML =
      '<div class="intro">Policy actions grouped by the project\\'s own mechanism taxonomy (the "HOW" fundamentals from the housing.shenanigans capture model: CEQA litigation, ballot-box supermajority, discretionary design review, subjective design standards, PLA-linked appeals, minimum-lot-size/setback/height caps, and Prop 13 fiscal zoning). "Uncategorized" ordinances don\\'t match any capture fundamental — often because they\\'re enabling/upzoning ordinances (SB9, ADU) rather than exclusionary ones.</div>' +
      order.filter(k => groups.has(k)).map(k => \`
        <div class="mechanism-group">
          <h3>\${k === "uncategorized" ? "Uncategorized / enabling" : MECHANISM_LABELS[k]} (\${groups.get(k).length})</h3>
          \${groups.get(k).map(policyCard).join("")}
        </div>\`).join("");
  }

  const xPanel = document.getElementById("panel-xref");
  const housingBuilds = DATA.agendaItems.filter(i => cityMatches(i.city, city) && i.housingSignal);
  const housingPolicies = DATA.ordinances.filter(o => cityMatches(o.city, city) && o.housingSignal);
  if (!housingBuilds.length) {
    xPanel.innerHTML = '<div class="empty">No housing-signal build items for this city to cross-reference yet.</div>';
  } else {
    xPanel.innerHTML = housingBuilds.map(b => {
      const related = housingPolicies
        .filter(p => p.city === b.city)
        .map(p => ({ p, score: sharedTermScore(b.text, p.title) }))
        .sort((x, y) => y.score - x.score)
        .filter(r => r.score > 0);
      return buildCard(b) + (related.length
        ? \`<div class="xref-related"><div class="rel-title">Related policy actions</div>\` +
          related.map(r => \`<div class="rel-item">\${escapeHtml(r.p.title)} <span class="relevance">(ord. \${r.p.ordinanceNumber || "—"}, shared-term score \${r.score})</span></div>\`).join("") +
          \`</div>\`
        : \`<div class="xref-related"><div class="rel-title">Related policy actions</div><div class="rel-item">No matching ordinance citizens ingested yet for \${b.city} — cross-reference will populate as /fundamental-ingestion adds af:adopted-ordinance instances for this city.</div></div>\`);
    }).join("");
  }
}

// The Participate tab is a chronological action timeline, not a flat list:
// for every not-yet-held housing-signal meeting, an activist has exactly two
// concrete actions — write a letter (do it now, ahead of the meeting) and
// show up to speak (on the meeting date itself). Both are plotted as dated
// timeline entries so "what do I do, and by when" reads at a glance.
function renderParticipateTimeline(city, builds) {
  const partPanel = document.getElementById("panel-participate");
  const upcoming = builds.filter(b => b.canParticipate).sort((a, b) => (a.date < b.date ? -1 : 1));

  if (!upcoming.length) {
    partPanel.innerHTML =
      '<div class="intro">The fundamental problem this tracks: incumbents using procedural leverage (design-review denials, CEQA threats, ballot-box supermajority requirements) to block or delay housing supply, which pushes prices up.</div>' +
      '<div class="empty">No upcoming (not-yet-held) meetings currently ingested' + (city === ALL_CITIES ? "" : " for " + city) + ' — check back as /fundamental-ingestion pulls new agendas.</div>';
    return;
  }

  const entries = [];
  for (const b of upcoming) {
    const route = DATA.writeLetterRoutes && DATA.writeLetterRoutes[b.city];
    entries.push({
      sortDate: b.date,
      type: "letter",
      city: b.city,
      label: "Write a letter",
      dueLabel: "before " + b.date,
      build: b,
      route,
    });
    entries.push({
      sortDate: b.date,
      type: "meeting",
      city: b.city,
      label: "Attend & speak",
      dueLabel: b.date + " (" + daysUntilLabel(b.date) + ")",
      build: b,
    });
  }
  entries.sort((a, b) => (a.sortDate === b.sortDate ? (a.type === "letter" ? -1 : 1) : (a.sortDate < b.sortDate ? -1 : 1)));

  partPanel.innerHTML =
    '<div class="intro">The fundamental problem this tracks: incumbents using procedural leverage (design-review denials, CEQA threats, ballot-box supermajority requirements) to block or delay housing supply, which pushes prices up. Two concrete actions, plotted on a timeline: <strong>write a letter</strong> now, ahead of the meeting, and <strong>show up to speak</strong> on the meeting date.</div>' +
    '<div class="timeline">' + entries.map(timelineEntry).join("") + '</div>';
}

function daysUntilLabel(dateStr) {
  const n = daysUntil(dateStr);
  if (n === 0) return "today";
  if (n === 1) return "tomorrow";
  return "in " + n + " days";
}

function timelineEntry(e) {
  const b = e.build;
  if (e.type === "letter") {
    const route = e.route;
    return \`
      <div class="tl-row">
        <div class="tl-date">\${e.dueLabel}</div>
        <div class="tl-card tl-letter">
          <div class="tl-head"><span class="badge letter">Write a letter</span><span class="tl-city">\${e.city}</span></div>
          <div class="item-text">Re: \${escapeHtml(b.text.slice(0, 140))}\${b.text.length > 140 ? "…" : ""}</div>
          \${route
            ? \`<div class="tl-action">Send to: <a href="\${route.url}" target="_blank" rel="noopener">\${route.url} ↗</a><div class="body-tag">\${escapeHtml(route.note)}</div></div>\`
            : \`<div class="tl-action body-tag">No contact route researched yet for \${e.city} — needs a /fundamental-ingestion pass on HOF/sources/\${e.city}/SOURCES.md.</div>\`}
        </div>
      </div>\`;
  }
  return \`
    <div class="tl-row">
      <div class="tl-date">\${e.dueLabel}</div>
      <div class="tl-card tl-meeting">
        <div class="tl-head"><span class="badge upcoming">Attend &amp; speak</span><span class="tl-city">\${e.city}</span>\${mechanismBadge(b.mechanism)}</div>
        <div class="body-tag">\${b.body.replace(/-/g, " ")}</div>
        <div class="item-text">\${escapeHtml(b.text)}</div>
        <a href="\${b.sourceUrl}" target="_blank" rel="noopener">Agenda / how to comment ↗</a>
        <div class="citizen">\${b.citizen}</div>
      </div>
    </div>\`;
}

function sharedTermScore(a, b) {
  const wordsA = new Set((a || "").toLowerCase().match(/[a-z]{4,}/g) || []);
  const wordsB = (b || "").toLowerCase().match(/[a-z]{4,}/g) || [];
  let score = 0;
  for (const w of wordsB) if (wordsA.has(w)) score++;
  return score;
}

document.querySelectorAll(".tab").forEach(tab => {
  tab.addEventListener("click", () => {
    document.querySelectorAll(".tab").forEach(t => t.classList.remove("active"));
    document.querySelectorAll(".panel").forEach(p => p.classList.remove("active"));
    tab.classList.add("active");
    document.getElementById("panel-" + tab.dataset.tab).classList.add("active");
  });
});
document.getElementById("refresh").addEventListener("click", load);
document.addEventListener("change", (e) => {
  if (e.target.id === "citySelect" || e.target.id === "housingOnly") render();
});
load();
</script>
</body>
</html>`;
}

const server = http.createServer(async (req, res) => {
  const url = new URL(req.url, `http://localhost:${PORT}`);
  if (url.pathname === "/api/chronology") {
    try {
      const { agendaItems, ordinances } = await loadChronology();
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ pilotCity: PILOT_CITY, agendaItems, ordinances, writeLetterRoutes: WRITE_LETTER_ROUTES }));
    } catch (err) {
      res.writeHead(500, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ error: String(err) }));
    }
    return;
  }
  res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
  res.end(html());
});

server.listen(PORT, () => {
  console.log(`Latest Builds & Policy Actions UI — http://localhost:${PORT}  (pilot city: ${PILOT_CITY})`);
});
