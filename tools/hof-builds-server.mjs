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

// A citizen's own text sometimes explicitly says it is NOT a housing item —
// usually because it's being recorded as a deliberate contrast case (e.g.
// the South San Francisco gRED Center R&D building, ingested specifically
// to compare CEQA-streamlining treatment of commercial vs. residential
// development). The plain HOUSING_SIGNAL regex still matches text like that
// because it explains itself using the word "housing" — so check for an
// explicit self-declared exclusion FIRST and let it override every other
// signal. This is a real bug fix, not a style choice: without it, an item
// whose own description says "NOT a housing project" still showed up
// badged "Housing" in the UI.
const NOT_HOUSING_OVERRIDE = /\bnot\b[^.;]{0,20}\bhousing\b|non-housing/i;

// A packet-level stub that hasn't had its line items extracted yet
// ("Agenda packet published; line items not yet extracted") is honestly
// unconfirmed, speculative content — flagging it "Housing" from a passing
// mention like "candidate housing linkage" would show it in the residential
// feed as if it were an actual proposal, when the item itself says its real
// content isn't known yet.
const UNEXTRACTED_STUB = /line items not yet extracted/i;
// Requires an unambiguous residential-unit marker, not just the word
// "housing" — used for meeting bodies (like a transportation/infrastructure
// commission) where "housing" is more likely to show up as adjacent context
// than as the item's actual subject.
const STRONG_RESIDENTIAL_SIGNAL =
  /\b(dwelling units?|multi-family|apartments?|condominiums?|\badu\b|accessory dwelling|sb\s?9\b|density bonus|builder'?s remedy)/i;

function isHousingSignal(text, body) {
  if (NOT_HOUSING_OVERRIDE.test(text)) return false;
  if (UNEXTRACTED_STUB.test(text)) return STRONG_RESIDENTIAL_SIGNAL.test(text);
  if (body && body !== "planning-commission" && body !== "city-council") {
    return STRONG_RESIDENTIAL_SIGNAL.test(text);
  }
  return HOUSING_SIGNAL.test(text);
}

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
// The text fields (agenda-item, title) can legitimately contain an embedded,
// backslash-escaped double quote (Scheme's own string-escape convention,
// e.g. \"adequately covered by a prior EIR\" inside a longer description) —
// a naive "[^"]*" capture stops dead at that first escaped quote and silently
// drops the whole record (this happened for real: the South San Francisco
// gRED Center item vanished from the feed entirely until this was fixed).
// This pattern instead matches "any char that isn't a bare backslash or
// quote, OR a backslash followed by any char" — the standard escaped-string
// regex — so embedded \" sequences stay inside the captured group.
const AGENDA_RE =
  /af:city-agenda-item\s+"([^"]+)"\s+'([a-zA-Z-]+)\s+"([^"]+)"\s+"((?:[^"\\]|\\.)*)"\s+"([^"]+)"\s*\)/g;

// (af:adopted-ordinance "city" <#f|"num"> "title" <#f|"date"> <#f|"date"> "url")
const ORD_RE =
  /af:adopted-ordinance\s+"([^"]+)"\s+(#f|"[^"]*")\s+"((?:[^"\\]|\\.)*)"\s+(#f|"[^"]*")\s+(#f|"[^"]*")\s+"([^"]+)"\s*\)/g;

function unwrapMaybeString(tok) {
  if (tok === "#f") return null;
  return tok.slice(1, -1);
}

// Un-escapes a captured Scheme string body back to display text: \" -> ",
// \\ -> \. Applied to any field captured with the escaped-quote-tolerant
// pattern above.
function unescapeSchemeString(s) {
  return (s || "").replace(/\\(.)/g, "$1");
}

// ---------------------------------------------------------------------------
// Antibodies tab: the "who opposes housing" chronology. This does NOT invent
// a new data model — it reads the project's existing housing.shenanigans
// structural-capture citizens (HOF/2026/09/05/21/af-shenanigan-instance.af.scm
// and its seeded instances), which already record exactly this: a mechanism
// (HOW), one or more beneficiary classes (WHO/"antibody" actor type), a
// price-supply effect (SO WHAT), and provenance. Rather than hand-roll a
// regex for this richer, nested s-expression shape, this is a small generic
// Scheme-literal tokenizer/parser — robust to the (list ...) sub-forms and
// #f placeholders that a flat regex can't cleanly express.
// ---------------------------------------------------------------------------
function tokenizeSexpr(text) {
  const tokens = [];
  let i = 0;
  while (i < text.length) {
    const c = text[i];
    if (/\s/.test(c)) { i++; continue; }
    if (c === ";") { while (i < text.length && text[i] !== "\n") i++; continue; }
    if (c === "(") { tokens.push("("); i++; continue; }
    if (c === ")") { tokens.push(")"); i++; continue; }
    if (c === '"') {
      let j = i + 1, s = "";
      while (j < text.length && text[j] !== '"') {
        if (text[j] === "\\") { s += text[j + 1]; j += 2; } else { s += text[j]; j++; }
      }
      tokens.push({ type: "string", value: s });
      i = j + 1;
      continue;
    }
    if (c === "'") {
      let j = i + 1, s = "";
      while (j < text.length && /[A-Za-z0-9\-?!]/.test(text[j])) { s += text[j]; j++; }
      tokens.push({ type: "symbol", value: s });
      i = j;
      continue;
    }
    // bare atom (identifier like af:shenanigan-instance, list, or #f)
    let j = i, s = "";
    while (j < text.length && !/[\s()]/.test(text[j])) { s += text[j]; j++; }
    tokens.push({ type: "atom", value: s });
    i = j;
  }
  let pos = 0;
  function parseExpr() {
    const tok = tokens[pos];
    if (tok === "(") {
      pos++;
      const items = [];
      while (tokens[pos] !== ")") items.push(parseExpr());
      pos++;
      return items;
    }
    pos++;
    if (tok.type === "atom" && tok.value === "#f") return null;
    if (tok.type === "atom") return tok; // e.g. leading "list" atom inside a (list ...) form
    return tok.value;
  }
  const out = [];
  while (pos < tokens.length) out.push(parseExpr());
  return out;
}

// Extracts the balanced "(af:shenanigan-instance ...)" call text from a file,
// tracking paren depth so nested (list ...) sub-forms don't truncate it.
function extractBalancedCall(src, marker) {
  const start = src.indexOf(marker);
  if (start === -1) return null;
  let depth = 0, i = start;
  for (; i < src.length; i++) {
    if (src[i] === "(") depth++;
    else if (src[i] === ")") { depth--; if (depth === 0) { i++; break; } }
  }
  return src.slice(start, i);
}

// A parsed (list 'a 'b) or (list "a" "b") form arrives as [{atom:"list"}, val, val, ...]
// — drop the leading "list" marker atom and unwrap plain values.
function unwrapListForm(parsed) {
  if (!Array.isArray(parsed)) return [];
  return parsed.slice(1);
}

async function loadShenanigans() {
  const SHENANIGAN_ROOT = path.join(HOF_ROOT, "2026", "09", "05", "21");
  const instances = [];
  let files;
  try {
    files = await readdir(SHENANIGAN_ROOT);
  } catch {
    return instances;
  }
  for (const name of files) {
    if (!name.endsWith(".af.scm")) continue;
    if (!name.startsWith("af-shenanigan-") || name.includes("mechanism-type") || name.includes("beneficiary-class") || name.includes("instance.af.scm")) continue;
    const full = path.join(SHENANIGAN_ROOT, name);
    const src = await readFile(full, "utf8");
    if (!src.includes("af:shenanigan-instance")) continue;
    const call = extractBalancedCall(src, "(af:shenanigan-instance");
    if (!call) continue;
    let parsed;
    try {
      parsed = tokenizeSexpr(call)[0];
    } catch {
      continue;
    }
    // parsed = ["af:shenanigan-instance", jurisdiction, mechanism, beneficiary-classes-list, ...]
    const [, jurisdiction, mechanism, beneficiaryClassesRaw, priceSupplyEffect, targetProject, date, outcome, sourceUrlsRaw, confidence] = parsed;
    instances.push({
      jurisdiction,
      mechanism,
      beneficiaryClasses: unwrapListForm(beneficiaryClassesRaw),
      priceSupplyEffect,
      targetProject: targetProject || null,
      date: date || null,
      outcome,
      sourceUrls: unwrapListForm(sourceUrlsRaw),
      confidence,
      citizen: path.relative(REPO_ROOT, full),
    });
  }
  instances.sort((a, b) => String(b.date || "0000").localeCompare(String(a.date || "0000")));
  return instances;
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
        const [, city, body, meetingDate, agendaItemRaw, sourceUrl] = m;
        const agendaItem = unescapeSchemeString(agendaItemRaw);
        const isCancelled = /^cancell?ed\b/i.test(agendaItem) || /notice of cancellation/i.test(agendaItem);
        agendaItems.push({
          kind: "build",
          city,
          body,
          date: meetingDate,
          text: agendaItem,
          sourceUrl,
          housingSignal: isHousingSignal(agendaItem, body),
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
        const [, city, ordNum, titleRaw, adoptedDate, effectiveDate, sourceUrl] = m;
        const title = unescapeSchemeString(titleRaw);
        ordinances.push({
          kind: "policy",
          city,
          ordinanceNumber: unwrapMaybeString(ordNum),
          title,
          date: unwrapMaybeString(adoptedDate) || unwrapMaybeString(effectiveDate),
          adoptedDate: unwrapMaybeString(adoptedDate),
          effectiveDate: unwrapMaybeString(effectiveDate),
          sourceUrl,
          housingSignal: isHousingSignal(title),
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
<title>Housing Tracker</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<style>
  /* Palette matched to distillative.ai: near-black oklch base, Raleway
     wordmark, and its per-topic hue-tinted card system (each category gets
     its own hue at the same fixed lightness/chroma the source site uses —
     0.15/0.025 for card backgrounds, ~0.8/0.11 for the matching title/badge
     color) rather than one single accent color for everything. */
  :root {
    color-scheme: dark;
    --bg: oklch(0.12 0.005 240);
    --panel: oklch(0.16 0.005 240);
    --header-bg: oklch(0.145 0.008 240 / 0.96);
    --border: oklch(0.22 0.008 240);
    --text: oklch(0.88 0.01 240);
    --text-strong: oklch(0.92 0.01 240);
    --muted: oklch(0.7 0.008 240);
    --muted-dim: oklch(0.58 0.006 240);
    /* Primary accent deliberately uses the site's teal hue (178), not its
       orange one (42) — orange reads as Claude's brand color in this
       context, so it's kept out of the global UI chrome entirely and only
       survives, recolored to red (20), on the one badge where it's
       semantically apt (CEQA litigation = alarm). */
    --accent: oklch(0.78 0.11 178);
    --accent-title: oklch(0.82 0.11 178);
    --housing: oklch(0.82 0.11 125);
    --housing-bg: oklch(0.15 0.025 125);
    --other: var(--muted-dim);
    --policy: oklch(0.82 0.11 258);
    --policy-bg: oklch(0.15 0.025 258);
    /* mechanism hues, cycling the site's own topic palette (orange/42
       excluded — see note above) */
    --hue-ceqa: 20;      --hue-ceqa-bg: oklch(0.15 0.025 20);      --hue-ceqa-title: oklch(0.78 0.13 20);
    --hue-ballot: 258;   --hue-ballot-bg: oklch(0.15 0.025 258);   --hue-ballot-title: oklch(0.82 0.11 258);
    --hue-discretion: 95; --hue-discretion-bg: oklch(0.15 0.025 95); --hue-discretion-title: oklch(0.78 0.12 95);
    --hue-subjective: 149; --hue-subjective-bg: oklch(0.15 0.025 149); --hue-subjective-title: oklch(0.82 0.11 149);
    --hue-pla: 220;      --hue-pla-bg: oklch(0.15 0.025 220);      --hue-pla-title: oklch(0.82 0.11 220);
    --hue-lotsize: 125;  --hue-lotsize-bg: oklch(0.15 0.025 125);  --hue-lotsize-title: oklch(0.82 0.11 125);
    --hue-fiscal: 240;   --hue-fiscal-bg: oklch(0.16 0.005 240);   --hue-fiscal-title: oklch(0.86 0.055 220);
  }
  * { box-sizing: border-box; }
  body { margin: 0; background: var(--bg); color: var(--text); font-family: Raleway, -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, sans-serif; }
  header {
    padding: 20px 32px 0; background: var(--header-bg);
    border-bottom: 1px solid var(--border);
  }
  h1 { margin: 0 0 4px; font-size: 22px; font-weight: 800; letter-spacing: -0.01em; color: var(--text-strong); }
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
  .badge.mechanism.hue-ceqa { background: color-mix(in srgb, var(--hue-ceqa-title) 18%, transparent); color: var(--hue-ceqa-title); }
  .badge.mechanism.hue-ballot { background: color-mix(in srgb, var(--hue-ballot-title) 18%, transparent); color: var(--hue-ballot-title); }
  .badge.mechanism.hue-discretion { background: color-mix(in srgb, var(--hue-discretion-title) 18%, transparent); color: var(--hue-discretion-title); }
  .badge.mechanism.hue-subjective { background: color-mix(in srgb, var(--hue-subjective-title) 18%, transparent); color: var(--hue-subjective-title); }
  .badge.mechanism.hue-pla { background: color-mix(in srgb, var(--hue-pla-title) 18%, transparent); color: var(--hue-pla-title); }
  .badge.mechanism.hue-lotsize { background: color-mix(in srgb, var(--hue-lotsize-title) 18%, transparent); color: var(--hue-lotsize-title); }
  .badge.mechanism.hue-fiscal { background: color-mix(in srgb, var(--hue-fiscal-title) 18%, transparent); color: var(--hue-fiscal-title); }
  .badge.upcoming { background: color-mix(in srgb, var(--housing) 25%, transparent); color: var(--housing); }
  .badge.risk-confirmed { background: color-mix(in srgb, var(--hue-ceqa-title) 20%, transparent); color: var(--hue-ceqa-title); }
  .badge.risk-possible { background: color-mix(in srgb, var(--hue-discretion-title) 20%, transparent); color: var(--hue-discretion-title); }
  .badge.risk-not-evidenced { background: color-mix(in srgb, var(--muted-dim) 18%, transparent); color: var(--muted-dim); }
  .participate-card { border-left: 3px solid var(--housing); }
  .mechanism-group { margin-bottom: 22px; padding-left: 12px; border-left: 3px solid var(--border); }
  .mechanism-group h3 { font-size: 13px; text-transform: uppercase; letter-spacing: 0.03em; color: var(--muted); margin: 0 0 10px; }
  .mechanism-group.hue-ceqa { border-left-color: var(--hue-ceqa-title); }
  .mechanism-group.hue-ballot { border-left-color: var(--hue-ballot-title); }
  .mechanism-group.hue-discretion { border-left-color: var(--hue-discretion-title); }
  .mechanism-group.hue-subjective { border-left-color: var(--hue-subjective-title); }
  .mechanism-group.hue-pla { border-left-color: var(--hue-pla-title); }
  .mechanism-group.hue-lotsize { border-left-color: var(--hue-lotsize-title); }
  .mechanism-group.hue-fiscal { border-left-color: var(--hue-fiscal-title); }
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
  .tl-summary { margin: 10px 0; padding: 10px 12px; background: var(--bg); border: 1px solid var(--border); border-radius: 8px; }
  .tl-summary-row { font-size: 13px; line-height: 1.5; margin-bottom: 8px; }
  .tl-summary-row:last-child { margin-bottom: 0; }
  .tl-summary-row .tt-label { display: block; font-size: 10px; font-weight: 700; text-transform: uppercase; letter-spacing: 0.03em; color: var(--accent); margin-bottom: 2px; }
  .btn-action {
    display: inline-block; margin-top: 8px; margin-right: 8px; padding: 9px 16px;
    border-radius: 8px; font-size: 13px; font-weight: 700; cursor: pointer;
    background: var(--accent); color: #0b0d0f; border: none; text-decoration: none;
  }
  .btn-action.btn-go { background: var(--housing); }
  .btn-action.btn-secondary { background: transparent; color: var(--muted); border: 1px solid var(--border); }
  .sample-letter { display: none; margin-top: 12px; padding-top: 12px; border-top: 1px solid var(--border); }
  .sample-letter.show { display: block; }
  .sample-letter textarea {
    width: 100%; background: var(--bg); color: var(--text); border: 1px solid var(--border);
    border-radius: 8px; padding: 12px; font-family: ui-monospace, monospace; font-size: 12px;
    line-height: 1.5; resize: vertical; margin-bottom: 8px;
  }
  .tl-explain { font-size: 12.5px; line-height: 1.5; color: var(--muted); margin-top: 8px; }
  .tl-explain .tt-label { display: block; font-size: 10px; font-weight: 700; text-transform: uppercase; letter-spacing: 0.03em; color: var(--accent-title); margin-bottom: 2px; }
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
  .jargon {
    border-bottom: 1px dotted var(--accent); cursor: help; position: relative;
    outline: none;
  }
  .jargon .tooltip {
    display: none; position: absolute; left: 0; top: calc(100% + 8px);
    width: 280px; max-width: 80vw; background: var(--panel); color: var(--text);
    border: 1px solid var(--border); border-radius: 10px; padding: 12px 14px;
    font-size: 12px; line-height: 1.5; box-shadow: 0 10px 30px rgba(0,0,0,0.3);
    z-index: 60; white-space: normal; cursor: auto; text-align: left;
  }
  .jargon:hover .tooltip, .jargon:focus .tooltip, .jargon.show .tooltip { display: block; }
  .jargon .tooltip strong { display: block; color: var(--accent); font-size: 13px; margin-bottom: 6px; }
  .jargon .tooltip .tt-label { color: var(--muted); font-weight: 700; font-size: 10px; text-transform: uppercase; letter-spacing: 0.03em; margin-top: 8px; }
  .empty { color: var(--muted); padding: 40px; text-align: center; }
  .checklist { margin-top: 12px; border: 1px solid var(--border); border-radius: 8px; background: var(--bg); }
  .checklist summary { cursor: pointer; padding: 8px 12px; font-size: 12px; font-weight: 700; color: var(--muted); list-style: none; display: flex; align-items: center; gap: 6px; }
  .checklist summary::-webkit-details-marker { display: none; }
  .checklist summary::before { content: "▸"; color: var(--accent); font-weight: 700; }
  .checklist[open] summary::before { content: "▾"; }
  .checklist-body { padding: 4px 12px 12px; }
  .checklist-row { display: flex; gap: 8px; align-items: flex-start; padding: 8px 0; border-top: 1px solid var(--border); }
  .checklist-row:first-child { border-top: none; }
  .checklist-row .badge { flex-shrink: 0; margin-top: 1px; }
  .checklist-row-text { font-size: 12.5px; line-height: 1.5; color: var(--text); }
  .checklist-row-text .mech-label { font-weight: 700; color: var(--text-strong); }
  .checklist-row-cite { font-size: 11px; color: var(--muted-dim); margin-top: 2px; }
  .xref-related { margin: 8px 0 0 0; padding: 10px 14px; border-left: 3px solid var(--policy); background: color-mix(in srgb, var(--policy) 8%, transparent); border-radius: 0 8px 8px 0; }
  .xref-related .rel-title { font-size: 12px; font-weight: 700; color: var(--policy); margin-bottom: 6px; }
  .xref-related .rel-item { font-size: 13px; margin-bottom: 4px; }
  .xref-related .rel-item .relevance { font-size: 11px; color: var(--muted); }
</style>
</head>
<body>
<header>
  <h1>🏗️ Housing Tracker</h1>
  <div class="sub">Real, sourced records of city meeting agendas and adopted laws — pilot city: <strong>San Mateo</strong></div>

  <details class="about" open>
    <summary>What is this? <span class="about-hint">(explained simply)</span></summary>
    <div class="about-body">
      <p><strong>The big problem:</strong> if you work a normal job here — retail, a restaurant,
      a caregiver, a teacher's aide — your paycheck is supposed to cover a place to live. In San
      Mateo County it often doesn't. When there are way more people who need a home than there
      are homes for them, landlords can charge more and still fill every unit — that's not
      greed, that's just what happens when something's scarce. The actual fix is simple: build
      more homes. But building new homes here is hard, on purpose — some people who already own
      a home want it to stay that way, so they use tricky rules and slow-downs (hover any
      underlined word, like CEQA, to see how) to stop or delay new homes from being built. This
      page is a companion to the county's
      <em>Builder's Remedy Checker</em> project: that app answers "can I build here?" — this one
      answers "what's happening right now, and what can I actually do about it?"</p>
      <p><strong>Where does this info come from?</strong> Every item on this page is real —
      pulled straight from each city's own public meeting website. Nothing here is made up by AI.
      This page just re-reads those saved records every time you open it, so you always see
      exactly what's been collected — no more, no less. Hover or tap any underlined word for a
      simple explanation.</p>
      <p><strong>The five tabs:</strong> <em>Participate</em> shows what you can DO right now —
      letters to write and meetings to attend. <em>Upcoming Proposals</em> is every residential
      project with a decision still ahead. <em>Policy Actions</em> groups city laws by which
      sneaky tactic they match, if any. <em>Cross-Reference</em> connects each housing project
      to the laws that might affect it. <em>Adversaries</em> tracks who regularly benefits from
      blocking or delaying housing, and how.</p>
      <p><strong>How much do we have so far?</strong> All 21 San Mateo County cities and the
      unincorporated county now have at least one real record — this keeps growing as more
      meetings and laws get added.</p>
    </div>
  </details>

  <div class="tabs">
    <div class="tab active" data-tab="participate">Participate</div>
    <div class="tab" data-tab="builds">Upcoming Proposals</div>
    <div class="tab" data-tab="policy">Policy Actions</div>
    <div class="tab" data-tab="xref">Cross-Reference</div>
    <div class="tab" data-tab="adversaries">Adversaries</div>
  </div>
</header>
<div class="controls">
  <select id="citySelect"></select>
  <label class="chk"><input type="checkbox" id="housingOnly" checked /> residential only (uncheck to see everything, including non-housing items like commercial/office projects)</label>
  <button class="primary" id="refresh">Refresh</button>
  <span class="stat" id="stat"></span>
</div>
<main>
  <div class="panel active" id="panel-participate"></div>
  <div class="panel" id="panel-builds"></div>
  <div class="panel" id="panel-policy"></div>
  <div class="panel" id="panel-xref"></div>
  <div class="panel" id="panel-adversaries"></div>
</main>
<script src="/jargon.js"></script>
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

const MECHANISM_LABELS = {
  "ceqa-litigation": "CEQA litigation",
  "ballot-box-supermajority": "Ballot-box supermajority",
  "discretionary-design-review": "Discretionary design review",
  "subjective-design-standard": "Subjective design standard",
  "pla-linked-appeal": "PLA-linked appeal",
  "minimum-lot-size-setback": "Min. lot size / setback / height cap",
  "fiscal-zoning-prop13": "Fiscal zoning (Prop 13)",
};
// Each mechanism gets its own hue (matching the site's per-topic card system)
// instead of one flat accent color for all seven — makes them scannable at a
// glance the same way the reference site's topic cards are.
const MECHANISM_HUE_CLASS = {
  "ceqa-litigation": "hue-ceqa",
  "ballot-box-supermajority": "hue-ballot",
  "discretionary-design-review": "hue-discretion",
  "subjective-design-standard": "hue-subjective",
  "pla-linked-appeal": "hue-pla",
  "minimum-lot-size-setback": "hue-lotsize",
  "fiscal-zoning-prop13": "hue-fiscal",
};

function mechanismBadge(mechanism) {
  if (!mechanism) return "";
  const hueClass = MECHANISM_HUE_CLASS[mechanism] || "hue-fiscal";
  return \`<span class="badge mechanism \${hueClass}">\${MECHANISM_LABELS[mechanism] || mechanism}</span>\`;
}

const RISK_LABELS = { confirmed: "Confirmed risk", possible: "Possible risk", "not-evidenced": "Not evidenced" };

function challengeChecklistHtml(build) {
  const rows = buildChallengeChecklist(build, DATA.ordinances);
  const confirmedCount = rows.filter((r) => r.risk === "confirmed").length;
  const possibleCount = rows.filter((r) => r.risk === "possible").length;
  return \`
    <details class="checklist">
      <summary>⚠️ Things that could get in the way — \${confirmedCount} confirmed, \${possibleCount} possible</summary>
      <div class="checklist-body">
        \${rows.map((r) => \`
          <div class="checklist-row">
            <span class="badge risk-\${r.risk}">\${RISK_LABELS[r.risk]}</span>
            <div class="checklist-row-text">
              <span class="mech-label">\${MECHANISM_LABELS[r.mechanism]}:</span> \${escapeHtml(r.rationale)}
              \${r.citation ? \`<div class="checklist-row-cite">Evidence: \${escapeHtml(r.citation)}</div>\` : ""}
            </div>
          </div>\`).join("")}
      </div>
    </details>\`;
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
      <div class="citizen">Source record: \${i.citizen}</div>
      \${challengeChecklistHtml(i)}
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
      <div class="citizen">Source record: \${o.citizen}</div>
    </div>\`;
}

// ---------------------------------------------------------------------------
// Adversaries tab — "who regularly opposes affordable housing," read from
// this project's existing housing.shenanigans structural-capture chronology
// (HOF/2026/09/05/21/). Each instance already names WHO benefits (the
// "adversary" actor class), HOW (the mechanism), and the outcome — this tab
// just groups that existing data by beneficiary class instead of inventing
// a new tracking model.
// ---------------------------------------------------------------------------
const BENEFICIARY_LABELS = {
  "incumbent-homeowners": "Incumbent homeowners",
  "institutional-landlords": "Institutional landlords",
  "construction-trade-unions": "Construction trade unions",
  "large-landowners": "Large landowners",
  "fiscally-constrained-cities": "Fiscally-constrained cities",
};
const BENEFICIARY_HUE_CLASS = {
  "incumbent-homeowners": "hue-ceqa",
  "institutional-landlords": "hue-ballot",
  "construction-trade-unions": "hue-pla",
  "large-landowners": "hue-lotsize",
  "fiscally-constrained-cities": "hue-fiscal",
};
const OUTCOME_LABELS = {
  "capture-succeeded": "Blocked/won",
  "capture-defeated": "Overturned/lost",
  "capture-contested": "Still contested",
};
const OUTCOME_RISK_CLASS = {
  "capture-succeeded": "risk-confirmed",
  "capture-defeated": "risk-not-evidenced",
  "capture-contested": "risk-possible",
};

function adversaryCard(s) {
  const cityName = s.jurisdiction.replace(/-/g, " ");
  return \`
    <div class="card">
      <div class="card-head">
        <span class="date">\${s.date || "undated"}</span>
        <span>
          <span class="badge \${OUTCOME_RISK_CLASS[s.outcome] || "risk-possible"}">\${OUTCOME_LABELS[s.outcome] || s.outcome}</span>
          \${mechanismBadge(s.mechanism)}
        </span>
      </div>
      <div class="body-tag">\${cityName}\${s.targetProject ? " · " + escapeHtml(s.targetProject) : ""}</div>
      <div class="item-text">
        \${s.beneficiaryClasses.map(bc => \`<span class="badge \${BENEFICIARY_HUE_CLASS[bc] || ""}">\${BENEFICIARY_LABELS[bc] || bc}</span>\`).join(" ")}
      </div>
      <div class="body-tag">Confidence: \${s.confidence} · Effect: \${(s.priceSupplyEffect || "").replace(/-/g, " ")}</div>
      \${s.sourceUrls.map((u, idx) => \`<a href="\${u}" target="_blank" rel="noopener">Source \${s.sourceUrls.length > 1 ? idx + 1 : ""} ↗</a>\`).join(" · ")}
      <div class="citizen">Source record: \${s.citizen}</div>
    </div>\`;
}

function renderAdversaries(city) {
  const aPanel = document.getElementById("panel-adversaries");
  if (!aPanel) return;
  const all = (DATA.shenanigans || []);
  const items = all.filter(s => cityMatches(s.jurisdiction, city));
  if (!items.length) {
    aPanel.innerHTML =
      '<div class="intro">Tracks who regularly benefits from blocking or delaying housing, and how — read from this project\\'s structural-capture chronology, not a new list.</div>' +
      '<div class="empty">No tracked capture instances on record yet for this city.</div>';
    return;
  }
  const groups = new Map();
  for (const s of items) {
    for (const bc of s.beneficiaryClasses.length ? s.beneficiaryClasses : ["uncategorized"]) {
      if (!groups.has(bc)) groups.set(bc, []);
      groups.get(bc).push(s);
    }
  }
  const order = [...Object.keys(BENEFICIARY_LABELS), "uncategorized"];
  aPanel.innerHTML =
    '<div class="intro">Who regularly benefits from blocking or delaying housing, and how they do it — grouped by who gains. Hover any underlined word for a plain explanation.</div>' +
    order.filter(k => groups.has(k)).map(k => \`
      <div class="mechanism-group \${BENEFICIARY_HUE_CLASS[k] || ""}">
        <h3>\${BENEFICIARY_LABELS[k] || "Uncategorized"} (\${groups.get(k).length})</h3>
        \${groups.get(k).map(adversaryCard).join("")}
      </div>\`).join("");
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

  // Upcoming Proposals shows every residential item on record for this city
  // — regardless of the checkbox above (which still controls Policy
  // Actions/Cross-Reference) — so a commercial R&D building or a
  // self-storage facility never shows up here no matter how the toggle is
  // set. IMPORTANT: this does NOT hard-filter to future-dated meetings only
  // — most ingested records are historical (a meeting already held), and a
  // filter that hid everything but not-yet-held meetings emptied this tab
  // down to almost nothing (a real regression caught in testing: only one
  // item in the whole chronology still had a future date). Items with a
  // meeting still ahead sort first and carry the "Can participate" badge;
  // everything else is the housing record for this city.
  const residentialItems = DATA.agendaItems.filter(i => cityMatches(i.city, city) && i.housingSignal);
  const bPanel = document.getElementById("panel-builds");
  bPanel.innerHTML =
    '<div class="intro">Every residential proposal on record for this city — items with a meeting still ahead (not yet approved, denied, or decided) are marked "Can participate" and sorted first.</div>' +
    (residentialItems.length ? residentialItems.map(buildCard).join("") : '<div class="empty">No residential proposals on record yet for this city.</div>');

  const pPanel = document.getElementById("panel-policy");
  if (!policies.length) {
    pPanel.innerHTML = '<div class="empty">No adopted city laws on record yet for this city.</div>';
  } else {
    const groups = new Map();
    for (const o of policies) {
      const key = o.mechanism || "uncategorized";
      if (!groups.has(key)) groups.set(key, []);
      groups.get(key).push(o);
    }
    const order = [...Object.keys(MECHANISM_LABELS), "uncategorized"];
    pPanel.innerHTML =
      '<div class="intro">City laws sorted by which sneaky tactic they match — hover any underlined word to learn what it means. Laws marked "Uncategorized" don\\'t match any tactic — usually because they actually HELP build more homes (like SB9 or ADU rules) instead of blocking them.</div>' +
      order.filter(k => groups.has(k)).map(k => \`
        <div class="mechanism-group \${MECHANISM_HUE_CLASS[k] || ""}">
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
        : \`<div class="xref-related"><div class="rel-title">Related policy actions</div><div class="rel-item">No adopted laws collected yet for \${b.city} — this will fill in as more records are added for this city.</div></div>\`);
    }).join("");
  }

  renderAdversaries(city);

  annotateJargon(document.querySelector("main"));
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
      '<div class="intro">If you work a normal job here, your paycheck is supposed to cover rent — but when there aren\\'t enough homes for everyone who needs one, prices go up no matter how hard you work. Some people try to slow down or stop new homes using tricky rules (hover an underlined word to see how). This page tracks that.</div>' +
      '<div class="empty">No upcoming (not-yet-held) meetings on record right now' + (city === ALL_CITIES ? "" : " for " + city) + ' — check back as new meeting agendas are added.</div>';
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
    '<div class="intro">If you work a normal job here, your paycheck is supposed to cover rent — but when there aren\\'t enough homes for everyone who needs one, prices go up no matter how hard you work. Some people try to slow down or stop new homes using tricky rules (hover an underlined word to see how). Two things you can actually do: <strong>write a letter</strong> now, before the meeting, and <strong>show up to speak</strong> on the day of the meeting.</div>' +
    '<div class="timeline">' + entries.map(timelineEntry).join("") + '</div>';
}

function daysUntilLabel(dateStr) {
  const n = daysUntil(dateStr);
  if (n === 0) return "today";
  if (n === 1) return "tomorrow";
  return "in " + n + " days";
}

let sampleLetterCounter = 0;

function timelineEntry(e) {
  const b = e.build;
  if (e.type === "letter") {
    const route = e.route;
    const ex = ACTION_EXPLAINERS.letter;
    const letterId = "letter-" + (sampleLetterCounter++);
    const letterText = generateSampleLetter(b, route);
    return \`
      <div class="tl-row">
        <div class="tl-date">\${e.dueLabel}</div>
        <div class="tl-card tl-letter">
          <div class="tl-head"><span class="badge letter">✉️ Write a letter</span><span class="tl-city">\${e.city}</span></div>
          <div class="item-text">About: \${escapeHtml(b.text.slice(0, 100))}\${b.text.length > 100 ? "…" : ""}</div>
          <button class="btn-action" onclick="document.getElementById('\${letterId}').classList.toggle('show')">Write this letter (click for a sample) ▾</button>
          <div class="sample-letter" id="\${letterId}">
            <textarea readonly rows="10">\${escapeHtml(letterText)}</textarea>
            \${route
              ? \`<div class="tl-action">Send it here: <a href="\${route.url}" target="_blank" rel="noopener">\${route.url} ↗</a></div>\`
              : \`<div class="tl-action body-tag">No contact address found yet for \${e.city} — use the city's public meeting page for now.</div>\`}
            <div class="tl-explain"><span class="tt-label">Why this works</span>\${escapeHtml(ex.why)}</div>
            <div class="tl-explain"><span class="tt-label">How it gets to them</span>\${escapeHtml(ex.how)}</div>
          </div>
        </div>
      </div>\`;
  }
  const ex = ACTION_EXPLAINERS.meeting;
  const meetingId = "meeting-" + (sampleLetterCounter++);
  return \`
    <div class="tl-row">
      <div class="tl-date">\${e.dueLabel}</div>
      <div class="tl-card tl-meeting">
        <div class="tl-head"><span class="badge upcoming">📍 Attend &amp; speak</span><span class="tl-city">\${e.city}</span>\${mechanismBadge(b.mechanism)}</div>
        <div class="item-text">\${escapeHtml(b.text.slice(0, 100))}\${b.text.length > 100 ? "…" : ""}</div>
        <a class="btn-action btn-go" href="\${b.sourceUrl}" target="_blank" rel="noopener">Go here →</a>
        <button class="btn-action btn-secondary" onclick="document.getElementById('\${meetingId}').classList.toggle('show')">More detail ▾</button>
        <div class="sample-letter" id="\${meetingId}">
          <div class="item-text">\${escapeHtml(b.text)}</div>
          <div class="tl-explain"><span class="tt-label">Why this works</span>\${escapeHtml(ex.why)}</div>
          <div class="tl-explain"><span class="tt-label">How it gets to them</span>\${escapeHtml(ex.how)}</div>
          <div class="citizen">Source record: \${b.citizen}</div>
        </div>
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
annotateJargon(document.querySelector(".about-body"));
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
      const shenanigans = await loadShenanigans();
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ pilotCity: PILOT_CITY, agendaItems, ordinances, shenanigans, writeLetterRoutes: WRITE_LETTER_ROUTES }));
    } catch (err) {
      res.writeHead(500, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ error: String(err) }));
    }
    return;
  }
  if (url.pathname === "/jargon.js") {
    try {
      const src = await readFile(path.join(__dirname, "jargon.js"), "utf8");
      res.writeHead(200, { "Content-Type": "application/javascript; charset=utf-8" });
      res.end(src);
    } catch (err) {
      res.writeHead(500, { "Content-Type": "text/plain" });
      res.end(String(err));
    }
    return;
  }
  res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
  res.end(html());
});

server.listen(PORT, () => {
  console.log(`Latest Builds & Policy Actions UI — http://localhost:${PORT}  (pilot city: ${PILOT_CITY})`);
});
