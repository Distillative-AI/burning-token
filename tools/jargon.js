// jargon.js — context-sensitive tooltip glossary for the Latest Builds &
// Policy Actions UI. Served as a plain static script (NOT embedded in a JS
// template literal) so regex word-boundary escapes (\b) are never at risk of
// being consumed as template-literal escape sequences.
//
// Exposes two globals used by the inline script in hof-builds-server.mjs:
//   annotateJargon(rootElement) — walks text nodes under rootElement and
//     wraps recognized jargon terms in hoverable/tappable tooltip spans.
//   escapeHtml(str) — shared HTML-escaping helper (also used by card builders).

function escapeHtml(s) {
  return (s || "").replace(/[&<>]/g, c => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;" }[c]));
}

const GLOSSARY = [
  { key: "ceqa-litigation-mech", re: /\bCEQA litigation\b/gi, term: "CEQA litigation",
    def: "Using a CEQA environmental-review challenge (or the credible threat of one) to attack a project in court or on appeal.",
    why: "A CEQA suit can add years and hundreds of thousands of dollars to a housing project — often over a legal technicality, not a real environmental harm — which is enough to kill marginal projects outright.",
    action: "Support statutory CEQA exemptions for infill housing (like PRC §21080.66) and call out challenges that target only housing, not comparable non-housing projects." },
  { key: "ceqa", re: /\bCEQA\b/g, term: "CEQA",
    def: "California Environmental Quality Act (1970) — requires environmental review before most discretionary government approvals, including many housing projects.",
    why: "CEQA review (or a lawsuit under it) is one of the most common tools used to delay, shrink, or kill housing projects — reviews can take years even when a project's real environmental impact is minor.",
    action: "Push for CEQA streamlining/exemptions for qualifying infill housing, and flag CEQA challenges used as leverage rather than genuine environmental concern." },
  { key: "eir", re: /\bEIRs?\b/g, term: "EIR (Environmental Impact Report)",
    def: "The most extensive form of CEQA review — a full study of a project's environmental effects, required when a project can't be exempted or cleared with a lighter-weight negative declaration.",
    why: "An EIR can take 1–3+ years and cost six figures to prepare, and can be challenged in court on procedural grounds even after it's done — a major source of housing-project delay.",
    action: "Support state streamlining laws (SB35, SB79, AB2011, etc.) that let qualifying housing bypass EIR review entirely." },
  { key: "mnd", re: /\bMND\b|\bMitigated Negative Declarations?\b/gi, term: "Mitigated Negative Declaration (MND)",
    def: "A lighter-weight CEQA finding: the project would have some environmental impact, but it's been mitigated enough that a full EIR isn't required.",
    why: "Faster and cheaper than an EIR, but still an appealable discretionary step — opponents can challenge the MND itself to force a full EIR and restart the clock.",
    action: "Track how often MNDs get appealed in a given city — frequent appeals signal CEQA being used as a delay tactic, not a genuine environmental check." },
  { key: "sb9", re: /\bSB\s?9\b/gi, term: "SB 9 (2021)",
    def: "State law allowing by-right lot splits and up to two housing units per single-family parcel (up to 4 units total), without discretionary city approval.",
    why: "Single-family zoning covers most residential land in California and has historically excluded anything but one house per lot — SB9 forces a crack in that by right, no city vote needed.",
    action: "Check whether a city's SB9 implementing ordinance uses standard setbacks/parking rules or padded ones designed to make SB9 projects infeasible in practice." },
  { key: "sb35", re: /\bSB\s?35\b/gi, term: "SB 35 (2017)",
    def: "State law giving qualifying infill housing projects streamlined, ministerial approval — no discretionary hearing, no CEQA review — in cities behind on their housing targets.",
    why: "Removes the exact discretionary-review step (a public hearing a city can use to deny or downsize a project) that's otherwise the main chokepoint for new housing.",
    action: "Confirm a city's current SB35 affordability threshold (10% vs 50%, set by its RHNA progress) and flag projects wrongly denied a hearing despite qualifying." },
  { key: "sb79", re: /\bSB\s?79\b/gi, term: "SB 79 (2025)",
    def: "Mandatory statewide upzoning near transit (up to 9 stories immediately adjacent to a major transit stop) — unlike SB10, cities don't get to opt in or out.",
    why: "Removes local-council discretion entirely for the highest-value transit-adjacent land, which is normally where zoning fights are fiercest.",
    action: "Watch for a city trying to substitute its own weaker 'local alternative TOD plan' for SB79's default density tiers before the compliance deadline." },
  { key: "sb10", re: /\bSB\s?10\b/gi, term: "SB 10 (2021)",
    def: "A local-option law letting a city council (not voters) rezone for up to 10 units per parcel near transit or in urban infill areas, exempt from CEQA.",
    why: "Because it's opt-in, a city can simply never adopt it — which is exactly what happened almost everywhere before SB79 made transit-area upzoning mandatory instead.",
    action: "Ask why a transit-rich city hasn't adopted SB10 voluntarily, and whether SB79 now makes that question moot for its core transit geography." },
  { key: "rhna", re: /\bRHNA\b/g, term: "RHNA (Regional Housing Needs Allocation)",
    def: "The state-assigned number of new housing units, by income level, each city must plan to accommodate — and the benchmark its Housing Element is measured against.",
    why: "A city's RHNA progress determines things like its SB35 affordability threshold and whether it's on track to keep (or lose) HCD certification.",
    action: "Compare a city's actual permits issued against its RHNA allocation by income tier — a city far behind on low-income RHNA is a red flag for structural obstruction." },
  { key: "housing-element", re: /\bHousing Elements?\b/gi, term: "Housing Element",
    def: "The state-mandated chapter of a city's General Plan showing how and where it will accommodate its RHNA housing target — reviewed and certified (or rejected) by HCD.",
    why: "A city without a certified Housing Element loses its normal discretionary zoning power over qualifying projects — that's the trigger for Builder's Remedy.",
    action: "Track a city's certification status and site-inventory disputes — a challenged or padded site inventory is a common way cities fake compliance without real capacity." },
  { key: "hcd", re: /\bHCD\b/g, term: "HCD (CA Dept. of Housing & Community Development)",
    def: "The state agency that reviews and certifies whether a city's Housing Element actually complies with state law.",
    why: "HCD certification is the on/off switch for a city's normal zoning discretion — losing it (or never getting it) is what makes Builder's Remedy live in that city.",
    action: "Watch HCD's compliance determinations closely — a decertification or a stalled certification review is the highest-leverage moment to act." },
  { key: "builders-remedy", re: /\bBuilder'?s Remedy\b/gi, term: "Builder's Remedy",
    def: "A provision letting developers propose housing (with enough affordable units) that ignores a non-compliant city's zoning/density rules entirely, if that city lacks a certified Housing Element.",
    why: "It's the sharpest tool available against a city actively refusing to plan for housing — the city can't use its normal zoning code to deny or downsize the project.",
    action: "Identify cities currently without HCD certification — that's the exact, time-limited window in which a Builder's Remedy filing can be made." },
  { key: "adu", re: /\bADUs?\b|\bAccessory Dwelling Units?\b/gi, term: "ADU (Accessory Dwelling Unit)",
    def: "A secondary, smaller housing unit on a lot that already has a primary house — a granny flat, converted garage, or backyard cottage.",
    why: "State law has stripped cities of most discretion to block ADUs, making them one of the few housing types that reliably gets built even in restrictive cities.",
    action: "Watch for cities quietly re-adding friction (parking mandates, owner-occupancy requirements, fee spikes) that state law doesn't actually allow." },
  { key: "density-bonus", re: /\bdensity bonus(?:es)?\b/gi, term: "Density Bonus",
    def: "A state-law right to build more units than normally zoned, in exchange for setting aside a share of them as affordable.",
    why: "It directly trades a public benefit (affordable units) for the one thing that makes projects pencil out financially (more market-rate units) — a rare structurally win-win mechanism.",
    action: "Check whether a city is granting the full legally-required bonus or quietly discounting it through 'compatibility' or design conditions." },
  { key: "pla-linked-appeal-mech", re: /\bPLA-linked appeals?\b/gi, term: "PLA-linked appeal",
    def: "Filing (or threatening) a CEQA or discretionary appeal against a project specifically to pressure the developer into signing a Project Labor Agreement — independent of any real environmental or design concern.",
    why: "This is sometimes called the 'Jerry Brown hammer' — it uses a housing-blocking tool for a labor-negotiation goal, adding delay and cost regardless of the project's actual merits.",
    action: "Distinguish genuine environmental/design objections from appeals that drop the moment a PLA is signed — that pattern is the tell." },
  { key: "pla", re: /\bPLAs?\b|\bProject Labor Agreements?\b/gi, term: "PLA (Project Labor Agreement)",
    def: "A pre-hire agreement between a developer and construction unions setting wages, hiring, and dispute terms for a specific project.",
    why: "PLAs aren't inherently anti-housing, but they're sometimes extracted using a CEQA or discretionary appeal as leverage rather than negotiated on the merits — see PLA-linked appeal.",
    action: "Look at whether a PLA was reached through negotiation or through a filed/threatened appeal — the latter is a capture pattern, not a labor-standards win." },
  { key: "objective-design", re: /\bObjective Design Standards?\b/gi, term: "Objective Design Standards (ODS)",
    def: "Zoning design rules written in measurable, yes/no terms (setback in feet, window ratio, materials list) instead of subjective judgment calls — required for state housing-law streamlining to apply.",
    why: "The Housing Accountability Act requires objective standards precisely because subjective ones ('must be compatible with neighborhood character') can be used as an unlimited, unreviewable veto.",
    action: "Check whether a city's design standards are genuinely measurable or just subjective language relabeled as 'objective' — the CARLA v. San Mateo case is the textbook example of the latter getting struck down." },
  { key: "subjective-design-mech", re: /\bSubjective design standards?\b/gi, term: "Subjective design standard",
    def: "A design/compatibility standard vague enough to function as a de facto veto, despite state law requiring objective standards for streamlined projects.",
    why: "It lets a city deny or endlessly redesign a project without ever citing a measurable rule the applicant could actually satisfy.",
    action: "Push for (or litigate toward) genuinely objective standards, as happened in CARLA v. City of San Mateo." },
  { key: "discretionary-design-review-mech", re: /\bDiscretionary design reviews?\b/gi, term: "Discretionary design review",
    def: "A planning-commission review/approval step where the outcome depends on the commission's judgment call, not a fixed checklist.",
    why: "It's the single biggest chokepoint for blocking or downsizing a project — a commission can deny or attach costly conditions for almost any stated reason.",
    action: "Compare a commission's approval/denial/downsizing rate for housing vs. non-housing discretionary items — a lopsided rate is a capture signal." },
  { key: "discretionary-review", re: /\bdiscretionary review\b|\bdiscretionary approvals?\b/gi, term: "Discretionary review",
    def: "Any approval step where a public body has judgment-call authority over whether (and how) a project proceeds, as opposed to a ministerial, checklist-only approval.",
    why: "State streamlining laws (SB35, SB79, ODS-qualifying projects) work specifically by removing discretionary review — it's the mechanism being fought over.",
    action: "Track which project types in a city still require discretionary review despite qualifying for ministerial/by-right treatment under state law." },
  { key: "use-permit", re: /\bConditional Use Permits?\b|\bUse Permits?\b/gi, term: "(Conditional) Use Permit",
    def: "Discretionary permission required for a use the zoning code doesn't allow outright — the city can grant, deny, or attach conditions.",
    why: "Even a technically-allowed housing use can get slowed by a use-permit process layered on top, adding a hearing (and appeal window) that a by-right project wouldn't face.",
    action: "Check whether a use permit is being required for something state law says must be ministerial." },
  { key: "ballot-box-mech", re: /\bBallot-box supermajority\b/gi, term: "Ballot-box supermajority",
    def: "A voter-approval or supermajority-council requirement placed on upzoning, density increases, height limits, or selling/repurposing city-owned land for housing.",
    why: "It converts a normal legislative housing decision into an expensive, slow, uncertain election — a powerful blocking tool even when a council majority actually supports the project.",
    action: "Watch for citizen-sponsored ballot initiatives timed to block a specific pending housing decision (e.g. sale of city land for affordable housing)." },
  { key: "ballot-measure", re: /\bballot measures?\b|\bballot initiatives?\b/gi, term: "Ballot measure / initiative",
    def: "A law or charter amendment put directly to voters, often requiring a supermajority — can be used to lock in (or override) zoning and land-use decisions.",
    why: "Because it bypasses the normal council process, a ballot measure can override or entrench a housing decision no elected body actually chose.",
    action: "Read the fine print — many housing-adjacent ballot measures target city-owned land disposition, which is where affordable-housing projects often get sited." },
  { key: "fiscal-zoning-mech", re: /\bFiscal zoning\b/gi, term: "Fiscal zoning",
    def: "A city favoring commercial/sales-tax-generating land uses over housing because, under California's property-tax structure, housing is a net cost to the city budget while retail/office is a net gain.",
    why: "This creates a structural, ongoing incentive for cities to zone out housing even absent any homeowner-driven NIMBYism — it's a budget problem disguised as a land-use choice.",
    action: "Look at a city's zoning map next to its sales-tax revenue sources — a mismatch between zoned capacity and RHNA need is a fiscal-zoning tell." },
  { key: "prop13", re: /\bProp(?:osition)?\s?13\b/gi, term: "Proposition 13 (1978)",
    def: "Caps property tax reassessment, freezing most properties' taxable value near their purchase price until sold — famously limits annual property-tax growth to 2%.",
    why: "By capping the property-tax upside of new housing, Prop 13 is the root cause of fiscal zoning — it makes sales-tax-generating commercial development look far more attractive to a city's budget than housing.",
    action: "This is a state-constitutional root cause, not a local ordinance — the actionable lever is usually state-level reform or offsetting revenue-sharing agreements, not city advocacy alone." },
  { key: "vesting-map", re: /\bVesting Tentative (?:Parcel )?Maps?\b/gi, term: "Vesting Tentative (Parcel) Map",
    def: "A map application that locks in ('vests') the zoning/development rules in effect at approval, protecting a project from later rule changes during construction.",
    why: "Vesting matters a lot when Builder's Remedy or a state-streamlining exemption is in play — without it, a city could change the rules after approval to kill or shrink the project anyway.",
    action: "Check whether a project has actually secured a vesting map, not just a site plan approval — vesting is what makes an approval durable." },
  { key: "site-dev-app", re: /\bSite Development Planning Applications?\b|\bSite Plan and Architectural Reviews?\b/gi, term: "Site plan / architectural review",
    def: "A planning-department review of a project's physical layout and appearance, typically bundled with other approvals on the same agenda item.",
    why: "Often the same review step where discretionary design conditions get attached — worth checking whether it was ministerial or hearing-based.",
    action: "Read the specific agenda item to see whether this review was ministerial (fast, by-right) or set for a discretionary hearing." },
  { key: "apn", re: /\bAPN\b/g, term: "APN (Assessor's Parcel Number)",
    def: "The unique ID county assessors use to identify a specific parcel of land — the housing-data equivalent of a street address for tax/zoning records.",
    why: "Useful for looking up a specific project's parcel directly in county records rather than relying on a street address alone.",
    action: "Use the APN to pull the parcel's own zoning history and prior entitlement record." },
  { key: "zoning", re: /\bupzon(?:e|ed|ing)\b|\brezon(?:e|ed|ing)\b/gi, term: "Upzoning / rezoning",
    def: "Changing a parcel's or area's zoning to allow more housing (more units, more height, less parking, etc.) than previously permitted.",
    why: "This is the single biggest lever for adding legal housing capacity in a city — zoning, not lack of land, is usually the binding constraint on supply.",
    action: "Track city general-plan/zoning-code amendment cycles (like San Mateo's Measure T) — that's when the legal ceiling on housing supply actually moves." },
  { key: "minimum-lot-mech", re: /\bMin\. lot size \/ setback \/ height cap\b/gi, term: "Min. lot size / setback / height cap",
    def: "Zoning-code provisions — minimum lot size, required setbacks from property lines, maximum floor-area ratio, or height limits — that structurally rule out multifamily or dense infill housing by design, without ever holding a discretionary hearing on any specific project.",
    why: "These limits work automatically, before a single application is even filed — a parcel can be legally incapable of holding more than one home no matter how much a developer might want to build there.",
    action: "Compare a city's baseline zoning-code minimums against state model standards — a city can loosen these directly through an ordinance amendment, no lawsuit or ballot measure required." },
];

function normalizeGlossaryEntry(key) {
  return GLOSSARY.find((g) => g.key === key);
}

function findGlossaryMatches(text) {
  const matches = [];
  for (const g of GLOSSARY) {
    g.re.lastIndex = 0;
    let m;
    while ((m = g.re.exec(text))) {
      matches.push({ start: m.index, end: m.index + m[0].length, key: g.key, text: m[0] });
      if (m.index === g.re.lastIndex) g.re.lastIndex++; // guard zero-width
    }
  }
  matches.sort((a, b) => (a.start - b.start) || (b.end - b.start) - (a.end - a.start));
  const kept = [];
  let lastEnd = -1;
  for (const m of matches) {
    if (m.start >= lastEnd) {
      kept.push(m);
      lastEnd = m.end;
    }
  }
  return kept;
}

// Walks a DOM subtree and wraps recognized jargon terms in text nodes with a
// hoverable/focusable/tappable tooltip span. Skips text already inside a
// tooltip, a link, or a code/citizen-path element so URLs and file paths
// never get jargon-annotated.
function annotateJargon(root) {
  if (!root) return;
  const walker = document.createTreeWalker(root, NodeFilter.SHOW_TEXT, {
    acceptNode(node) {
      if (!node.nodeValue || !node.nodeValue.trim()) return NodeFilter.FILTER_REJECT;
      const p = node.parentElement;
      if (p && (p.closest(".jargon") || p.closest("a") || p.closest("code") || p.closest(".citizen"))) {
        return NodeFilter.FILTER_REJECT;
      }
      return NodeFilter.FILTER_ACCEPT;
    },
  });
  const nodes = [];
  let n;
  while ((n = walker.nextNode())) nodes.push(n);

  for (const node of nodes) {
    const text = node.nodeValue;
    const matches = findGlossaryMatches(text);
    if (!matches.length) continue;
    const frag = document.createDocumentFragment();
    let last = 0;
    for (const m of matches) {
      if (m.start > last) frag.appendChild(document.createTextNode(text.slice(last, m.start)));
      const entry = normalizeGlossaryEntry(m.key);
      const span = document.createElement("span");
      span.className = "jargon";
      span.tabIndex = 0;
      span.textContent = m.text;
      const tip = document.createElement("span");
      tip.className = "tooltip";
      tip.innerHTML =
        "<strong>" + escapeHtml(entry.term) + "</strong>" +
        "<div>" + escapeHtml(entry.def) + "</div>" +
        "<div class=\"tt-label\">Why it matters</div><div>" + escapeHtml(entry.why) + "</div>" +
        "<div class=\"tt-label\">What can move the needle</div><div>" + escapeHtml(entry.action) + "</div>";
      span.appendChild(tip);
      span.addEventListener("click", (e) => {
        e.stopPropagation();
        const wasOpen = span.classList.contains("show");
        document.querySelectorAll(".jargon.show").forEach((s) => s.classList.remove("show"));
        if (!wasOpen) span.classList.add("show");
      });
      frag.appendChild(span);
      last = m.end;
    }
    if (last < text.length) frag.appendChild(document.createTextNode(text.slice(last)));
    node.parentNode.replaceChild(frag, node);
  }
}
document.addEventListener("click", () => {
  document.querySelectorAll(".jargon.show").forEach((s) => s.classList.remove("show"));
});

// ---------------------------------------------------------------------------
// Letter talking points — turns a raw agenda-item into "what's being
// asserted in the letter": the concern, why it matters for housing prices,
// and a concrete ask. Computed from real fields already on the build object
// (its classified capture mechanism, a unit-count regex match against its
// actual agenda text) — never fabricated per-item commentary the chronology
// doesn't support.
// ---------------------------------------------------------------------------
const MECHANISM_LETTER_TALKING_POINTS = {
  "ceqa-litigation": {
    concern: "This item may use a CEQA challenge or appeal to delay or kill this housing project, independent of its actual environmental impact.",
    why: "Every year of CEQA delay adds carrying costs that get passed into higher prices for the eventual units, or kills the project outright — keeping the project on track is what actually gets supply built and eases prices.",
  },
  "ballot-box-supermajority": {
    concern: "This action would require a public vote or supermajority before this housing (or the disposition of land for it) can proceed.",
    why: "Routing a normal legislative housing decision through an election adds years of delay and lets a well-funded opposition campaign kill supply a council majority already supports.",
  },
  "discretionary-design-review": {
    concern: "This is a discretionary hearing where the commission can deny, downsize, or add costly conditions to this project on a judgment call, not a fixed rule.",
    why: "Discretionary denial or downsizing is the single biggest chokepoint for blocking housing supply — every unit cut here is a unit that won't help bring prices down.",
  },
  "subjective-design-standard": {
    concern: "This project may be evaluated against a subjective 'compatibility' standard rather than a fixed, objective rule.",
    why: "A vague standard can function as an unlimited veto regardless of a project's actual merits — objective standards are what state streamlining law requires precisely to stop this.",
  },
  "pla-linked-appeal": {
    concern: "This appeal or hearing may be leverage for a Project Labor Agreement rather than a genuine environmental or design objection.",
    why: "Using a housing-blocking tool for a labor negotiation adds delay and cost with no bearing on whether the project should be approved on its actual merits.",
  },
  "minimum-lot-size-setback": {
    concern: "The zoning code's own minimum lot size, setback, or height-cap rules may structurally rule out the housing density this parcel could otherwise support.",
    why: "These limits work automatically, before any hearing — loosening them is a direct, durable increase in a city's legal housing capacity, not a one-project fix.",
  },
  "fiscal-zoning-prop13": {
    concern: "This action may reflect a preference for sales-tax-generating commercial use over housing, driven by Prop 13's fiscal incentives rather than a merits-based land-use judgment.",
    why: "Fiscal zoning restricts supply for budget reasons unrelated to actual housing need or site suitability — naming it as the real motive is often the first step to overriding it.",
  },
};

function letterSummary(build) {
  const unitMatch = (build.text || "").match(/(\d[\d,]*)\s*(dwelling units?|units?|homes?|apartments?)/i);
  const units = unitMatch ? (unitMatch[1] + " " + unitMatch[2].toLowerCase()) : null;
  const bodyName = (build.body || "").replace(/-/g, " ");
  const tp = MECHANISM_LETTER_TALKING_POINTS[build.mechanism];

  if (tp) {
    return {
      concern: tp.concern,
      why: tp.why,
      ask: "Ask the " + bodyName + " to approve this item without using this mechanism to deny, downsize, or delay the project" + (units ? " (" + units + ")" : "") + ".",
    };
  }
  if (units) {
    return {
      concern: "This item proposes " + units + " of new housing.",
      why: "More approved, built units is the most direct lever for bringing housing prices down — every unit cut, delayed, or denied at this stage is supply that won't exist to ease the market.",
      ask: "Ask the " + bodyName + " to approve the full " + units + " as proposed, without reducing the count or attaching conditions that would delay construction.",
    };
  }
  return {
    concern: "Review this agenda item for any condition that would reduce unit count, add delay, or increase cost for the housing described.",
    why: "Any reduction in scope or added delay at this stage is supply that won't materialize to help bring prices down.",
    ask: "Ask the " + bodyName + " to approve the item as proposed, and to state its reasoning on the record if it does not.",
  };
}
