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

// Every def/why/action below is written for a smart 10-year-old: short
// sentences, everyday words, and a concrete "why should I care" instead of
// legal jargon. If a word here needs its OWN glossary entry, that's fine —
// tooltips can nest (e.g. this entry can casually say "CEQA" and the reader
// can hover that too).
const GLOSSARY = [
  { key: "ceqa-litigation-mech", re: /\bCEQA litigation\b/gi, term: "CEQA litigation",
    def: "Someone uses an environmental law (CEQA) to sue or threaten to sue, to stop or slow down a housing project.",
    why: "A lawsuit like this can take years and cost a ton of money — even when the project wouldn't really hurt the environment. That's often enough to make a builder give up.",
    action: "Support rules that say 'this kind of housing project doesn't need this lawsuit risk,' and speak up when a lawsuit looks like it's really about stopping housing, not protecting nature." },
  { key: "ceqa", re: /\bCEQA\b/g, term: "CEQA",
    def: "A California law from 1970 that says: before you build big things, you have to check how it affects nature and the environment.",
    why: "Checking is a good idea, but people have learned to use this law to slow down or block new homes for years — even when there's barely any real environmental harm.",
    action: "Support giving housing projects (especially small, in-city ones) a faster, simpler path through this check." },
  { key: "eir", re: /\bEIRs?\b/g, term: "EIR (Environmental Impact Report)",
    def: "The biggest, most detailed environmental check a project can be asked to do — like a giant homework report about every way a project might affect nature.",
    why: "It can take 1 to 3+ years and cost a huge amount of money to write, and people can still argue about it in court afterward. That's a long time for homes not to get built.",
    action: "Support laws that let good, normal housing projects skip this giant report." },
  { key: "mnd", re: /\bMND\b|\bMitigated Negative Declarations?\b/gi, term: "Mitigated Negative Declaration (MND)",
    def: "A shorter environmental check that says: 'this project has a small effect, but we fixed it, so it's okay.'",
    why: "It's faster than the giant report, but people can still challenge it to force the project into the giant report instead — starting the clock all over again.",
    action: "Notice if this gets challenged a lot in one city — that's a sign it's being used to stall, not to protect nature." },
  { key: "sb9", re: /\bSB\s?9\b/gi, term: "SB 9 (2021)",
    def: "A state law that lets someone split a lot with one house into two, and put up to 2 homes on each part — up to 4 homes total — without asking the city for special permission.",
    why: "Most land in California only allows ONE house per lot. SB 9 pokes a hole in that rule everywhere, automatically.",
    action: "Check whether a city is quietly making SB 9 hard to use anyway, with strict parking or spacing rules." },
  { key: "sb35", re: /\bSB\s?35\b/gi, term: "SB 35 (2017)",
    def: "A state law that says: if a housing project follows the rules, a city that's behind on building homes has to approve it fast — no big public hearing, no environmental report.",
    why: "It skips the exact step (a public hearing) that a city normally uses to say no or shrink a project.",
    action: "Check whether a project that should qualify for this fast path is being given a hearing anyway." },
  { key: "sb79", re: /\bSB\s?79\b/gi, term: "SB 79 (2025)",
    def: "A state law that says cities MUST allow tall buildings (up to 9 floors) right next to train and BART stations — cities don't get a choice.",
    why: "Land next to train stations is usually where housing fights are the fiercest. This law removes the city's power to say no there.",
    action: "Watch whether a city tries to write its own weaker rule instead of following this one before the deadline." },
  { key: "sb10", re: /\bSB\s?10\b/gi, term: "SB 10 (2021)",
    def: "A state law that lets a city CHOOSE to allow up to 10 homes per lot near transit — but the city has to opt in. It's not automatic.",
    why: "Because cities can just ignore it, almost none did — which is why SB 79 (above) later made it mandatory instead.",
    action: "Ask why a city near trains never opted into this, back when it was voluntary." },
  { key: "rhna", re: /\bRHNA\b/g, term: "RHNA (say: 'REE-nuh')",
    def: "A number the state gives each city: 'you need to make room for this many new homes in the next few years.'",
    why: "This number is the report card a city gets graded on — it decides other things too, like whether SB 35's fast path applies to that city.",
    action: "Compare how many homes a city has actually approved against its number — falling way behind is a warning sign." },
  { key: "housing-element", re: /\bHousing Elements?\b/gi, term: "Housing Element",
    def: "A city's official homework assignment: a plan showing exactly where it will allow enough new homes to hit its RHNA number.",
    why: "If a city's plan isn't approved by the state, the city loses a lot of its normal power to say no to new housing projects.",
    action: "Check if a city's plan is actually approved — and if not, ask what's blocking it." },
  { key: "hcd", re: /\bHCD\b/g, term: "HCD (the state's housing office)",
    def: "The state office that grades a city's Housing Element homework and says 'pass' or 'fail.'",
    why: "A 'fail' grade (no certification) is the exact moment a city loses its normal power to block housing — that's when Builder's Remedy can kick in.",
    action: "Keep an eye on HCD's pass/fail decisions — a 'fail' is a big opportunity to push for new housing." },
  { key: "builders-remedy", re: /\bBuilder'?s Remedy\b/gi, term: "Builder's Remedy",
    def: "A rule that says: if a city failed its housing homework (no certified plan), a builder can propose homes that ignore that city's normal zoning rules — as long as enough of the homes are affordable.",
    why: "It's the strongest tool there is against a city that's refusing to plan for enough housing.",
    action: "Find cities that currently have no certified plan — that's the exact window where this tool works." },
  { key: "adu", re: /\bADUs?\b|\bAccessory Dwelling Units?\b/gi, term: "ADU (a 'granny flat')",
    def: "A small second home built on a lot that already has a house — like a converted garage or a tiny house in the backyard.",
    why: "Cities aren't allowed to block these very easily anymore, which is why they get built even in cities that fight most other new housing.",
    action: "Watch for a city quietly adding fees or rules that make ADUs harder than the state allows." },
  { key: "density-bonus", re: /\bdensity bonus(?:es)?\b/gi, term: "Density Bonus",
    def: "A deal: a builder can add extra homes beyond what's normally allowed, if some of those homes are set aside as affordable.",
    why: "It's a rare win-win — the city gets affordable homes, and the builder gets enough extra homes to make the project worth building.",
    action: "Check if a city is giving builders the FULL bonus they're owed by law, or quietly shrinking it." },
  { key: "pla-linked-appeal-mech", re: /\bPLA-linked appeals?\b/gi, term: "PLA-linked appeal",
    def: "Someone files (or threatens) a lawsuit or appeal against a housing project — not because they truly care about the environment or design, but to pressure the builder into signing a union labor deal (a PLA).",
    why: "It uses a housing-blocking tool for a totally different goal, which still adds delay and cost to the project either way.",
    action: "Notice if the 'objection' disappears right after a labor deal gets signed — that's the giveaway." },
  { key: "pla", re: /\bPLAs?\b|\bProject Labor Agreements?\b/gi, term: "PLA (Project Labor Agreement)",
    def: "A deal between a builder and construction unions about pay and hiring rules for one specific project.",
    why: "These deals aren't bad by themselves — but sometimes they get forced through a fake lawsuit threat instead of a fair negotiation (see 'PLA-linked appeal').",
    action: "Check whether the deal came from real bargaining, or from a lawsuit threat used as leverage." },
  { key: "objective-design", re: /\bObjective Design Standards?\b/gi, term: "Objective Design Standards (ODS)",
    def: "Building design rules you can measure with a ruler or a checklist — like 'windows must cover 20% of the wall' — instead of a vague opinion like 'it has to look nice.'",
    why: "A vague rule can be used to say no to ANY project forever, for ANY reason. A measurable rule can't be stretched like that.",
    action: "Check whether a city's 'objective' rules are truly measurable, or just vague opinions with a fancier name." },
  { key: "subjective-design-mech", re: /\bSubjective design standards?\b/gi, term: "Subjective design standard",
    def: "A design rule that's really just someone's opinion — like 'it has to match the neighborhood's character' — dressed up to look like an official rule.",
    why: "A rule like this can be used to say no forever, because nobody can ever prove they satisfied someone's personal opinion.",
    action: "Push for real, measurable rules instead — this exact trick got struck down in a real court case (CARLA v. San Mateo)." },
  { key: "discretionary-design-review-mech", re: /\bDiscretionary design reviews?\b/gi, term: "Discretionary design review",
    def: "A meeting where a small group of people (a commission) gets to decide yes or no on a project based on their own judgment, not a fixed checklist.",
    why: "This is the #1 spot where a project gets denied, shrunk, or loaded up with expensive conditions — for almost any reason the commission wants.",
    action: "Compare how often housing projects get denied here versus other types of projects — a big gap is a red flag." },
  { key: "discretionary-review", re: /\bdiscretionary review\b|\bdiscretionary approvals?\b/gi, term: "Discretionary review",
    def: "Any city approval step where a person or group gets to use their own judgment to say yes or no — instead of just checking boxes on a fixed list.",
    why: "This is exactly the kind of step that fast-track state laws (like SB 35) try to remove, because it's where projects get stuck.",
    action: "Check which projects still need this kind of review, even though state law says they shouldn't." },
  { key: "use-permit", re: /\bConditional Use Permits?\b|\bUse Permits?\b/gi, term: "(Conditional) Use Permit",
    def: "Special permission a project needs because the zoning code doesn't automatically allow that use — the city can say yes, no, or 'yes, but only if...'",
    why: "Even a project that's technically allowed can get stuck waiting for this extra permission and the hearing (and appeal) that comes with it.",
    action: "Check whether state law actually says this project shouldn't need extra permission at all." },
  { key: "ballot-box-mech", re: /\bBallot-box supermajority\b/gi, term: "Ballot-box supermajority",
    def: "A rule that says: before the city can approve more homes (or sell city land for homes), regular voters have to vote yes — often by a big majority.",
    why: "Turning a normal city decision into an election makes it slow, expensive, and easy for a small, loud group to defeat — even if most city leaders already agree.",
    action: "Watch for a new ballot measure that shows up right when a specific housing project or land sale is being decided." },
  { key: "ballot-measure", re: /\bballot measures?\b|\bballot initiatives?\b/gi, term: "Ballot measure / initiative",
    def: "A question put directly to voters to decide, instead of the city council deciding it.",
    why: "It skips the normal decision-making process, so a housing rule can get locked in (or blocked) by an election instead of by elected leaders debating it.",
    action: "Read exactly what the measure would do — many of them are really about stopping one specific housing plan." },
  { key: "fiscal-zoning-mech", re: /\bFiscal zoning\b/gi, term: "Fiscal zoning",
    def: "When a city prefers stores and offices over housing, because stores bring in sales-tax money and housing (under California's tax rules) mostly costs the city money.",
    why: "This means a city can be against new homes for BUDGET reasons — not because neighbors are upset, just because homes don't pay the city's bills as well as a store does.",
    action: "Compare a city's zoning map to where its tax money comes from — a mismatch is a fiscal-zoning clue." },
  { key: "prop13", re: /\bProp(?:osition)?\s?13\b/gi, term: "Proposition 13 (1978)",
    def: "An old California rule that freezes most property tax bills near what they were when the property was bought, and only lets them grow a little bit each year.",
    why: "This is the deep reason cities like stores more than homes for tax money (see 'Fiscal zoning') — homes just don't grow the city's tax income much over time.",
    action: "This one isn't fixed at the city level — it needs a state-level change, not just a local vote." },
  { key: "vesting-map", re: /\bVesting Tentative (?:Parcel )?Maps?\b/gi, term: "Vesting Tentative (Parcel) Map",
    def: "A special map approval that locks in today's rules for a project, so the city can't change the rules on it later, mid-construction.",
    why: "Without this 'lock-in,' a city could approve a project and then change the rules to shrink or kill it anyway.",
    action: "Check whether a project actually has this lock-in, not just a basic site-plan approval." },
  { key: "site-dev-app", re: /\bSite Development Planning Applications?\b|\bSite Plan and Architectural Reviews?\b/gi, term: "Site plan / architectural review",
    def: "The city checking what a project will actually look like and how it's laid out on the lot.",
    why: "This is often the same step where extra, judgment-call design conditions get attached to a project.",
    action: "Check if this review was a quick checklist, or a full hearing where the project could be denied." },
  { key: "apn", re: /\bAPN\b/g, term: "APN (Parcel Number)",
    def: "A unique ID number the county gives every single piece of land — like a name tag, but for land.",
    why: "It lets you look up exactly what's true about one specific piece of land, instead of guessing from a street address.",
    action: "Use it to pull up that piece of land's full history in county records." },
  { key: "zoning", re: /\bupzon(?:e|ed|ing)\b|\brezon(?:e|ed|ing)\b/gi, term: "Upzoning / rezoning",
    def: "Changing the rules for a piece of land to allow MORE housing there than before — more homes, more height, less required parking.",
    why: "This is the single biggest way to legally allow more homes to get built — the problem is almost never 'not enough land,' it's 'the rules don't allow it yet.'",
    action: "Watch for when a city updates its zoning rules — that's the moment the legal ceiling on housing actually moves." },
  { key: "minimum-lot-mech", re: /\bMin\. lot size \/ setback \/ height cap\b/gi, term: "Min. lot size / setback / height cap",
    def: "Rules baked into the zoning code — like 'lots must be huge,' 'buildings must sit far from the property line,' or 'nothing taller than X feet' — that make it impossible to fit more than one home on a lot, before anyone even applies.",
    why: "These rules work automatically, with no hearing needed — a piece of land can be legally stuck at 'one house' forever, no matter how much anyone wants to build more.",
    action: "Compare a city's rules to what the state considers normal — a city can loosen these with one ordinance change, no lawsuit or election needed." },
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
        "<div class=\"tt-label\">Why should I care?</div><div>" + escapeHtml(entry.why) + "</div>" +
        "<div class=\"tt-label\">What can help?</div><div>" + escapeHtml(entry.action) + "</div>";
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
    concern: "This might get challenged with an environmental lawsuit (CEQA) to slow it down or stop it — even if it wouldn't really hurt the environment.",
    why: "If a project gets tied up in court for years, that's years where those homes don't exist. Meanwhile the number of people who need a place to live keeps growing — so the homes that DO exist get more expensive, because more people are competing for the same, too-small supply.",
  },
  "ballot-box-supermajority": {
    concern: "This might need a public vote before it can move forward, instead of just a normal city council decision.",
    why: "Turning it into an election adds years of delay and gives a small, loud group a chance to kill it — even if most people in charge already said yes.",
  },
  "discretionary-design-review": {
    concern: "This is a meeting where a small group of people can vote no, shrink it, or pile on expensive extra requirements — just based on their own opinion, not a fixed rule.",
    why: "This is the #1 spot where new homes get blocked. Every home that gets cut here is one less home available — and fewer homes for the same number of people means higher prices.",
  },
  "subjective-design-standard": {
    concern: "This might get judged by a vague rule like 'does it fit the neighborhood?' instead of a clear, measurable rule.",
    why: "A vague rule can be used to say no forever, for any reason, to any project — that's exactly the kind of rule that keeps new homes from ever getting built.",
  },
  "pla-linked-appeal": {
    concern: "An appeal against this project might really be about pressuring a union labor deal, not a genuine complaint about the project itself.",
    why: "Either way, it adds delay and cost to building the home — delay that has nothing to do with whether the project is actually good or bad.",
  },
  "minimum-lot-size-setback": {
    concern: "The city's own zoning rules (like minimum lot size or how far buildings must sit from the property line) might make it illegal to build as much housing here as is actually needed.",
    why: "These rules work automatically, with no meeting or vote — fixing them is a permanent fix for a whole city, not just one project.",
  },
  "fiscal-zoning-prop13": {
    concern: "The city might quietly prefer a store or office here instead of homes, because stores bring in more tax money under California's tax rules.",
    why: "This means a city can be against new homes just to protect its budget — not because anyone is even complaining about the project.",
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
      ask: "Ask the " + bodyName + " to say yes to this project as-is — without shrinking it, delaying it, or piling on extra conditions" + (units ? " (" + units + ")" : "") + ".",
    };
  }
  if (units) {
    return {
      concern: "This would add " + units + " of new housing.",
      why: "Here's the simple version: when there are more homes for people to live in, and the same number of people who need one, homes cost less. Every home that gets cut, delayed, or denied here is one less home to help with that.",
      ask: "Ask the " + bodyName + " to approve all " + units + " as planned, without shrinking the number or slowing it down.",
    };
  }
  return {
    concern: "Check this agenda item for anything that would shrink the project, slow it down, or make it cost more.",
    why: "Any home that gets cut or delayed here is one less home available — and fewer homes for the same number of people means higher prices for everyone.",
    ask: "Ask the " + bodyName + " to approve the item as proposed, and to explain clearly if they don't.",
  };
}

// ---------------------------------------------------------------------------
// Challenge checklist — for a given build item, assess each of the seven
// capture-mechanism "fundamentals" as a risk an incumbent-opposition actor
// could use to block/delay/shrink it. Two kinds of evidence only, never
// speculation dressed as fact:
//   1. Direct textual evidence in the item's own agenda text (e.g. the item
//      itself is a discretionary hearing, or requests a zoning exception).
//   2. Cross-referenced evidence from that city's own adopted-ordinance
//      record (e.g. a ballot-box-supermajority ordinance already on file
//      for this city is real evidence that lever exists here).
// Anything without either kind of evidence is explicitly labeled
// "not evidenced" rather than invented — this is a risk-scan, not a verdict.
// ---------------------------------------------------------------------------
const CHALLENGE_MECHANISM_ORDER = [
  "ceqa-litigation",
  "ballot-box-supermajority",
  "discretionary-design-review",
  "subjective-design-standard",
  "pla-linked-appeal",
  "minimum-lot-size-setback",
  "fiscal-zoning-prop13",
];

function buildChallengeChecklist(build, ordinances) {
  const text = build.text || "";
  const cityOrdinances = (ordinances || []).filter((o) => o.city === build.city);
  const rows = [];

  // 1. CEQA litigation
  if (/ceqa[- ]exempt|exempt from.*ceqa|public resources code/i.test(text)) {
    rows.push({
      mechanism: "ceqa-litigation",
      risk: "possible",
      rationale: "This project says it doesn't need the big environmental check. A common trick is to sue over THAT claim, forcing the whole slow check to happen anyway.",
    });
  } else if (/mitigated negative declaration|\bEIR\b|environmental impact report/i.test(text)) {
    rows.push({
      mechanism: "ceqa-litigation",
      risk: "possible",
      rationale: "This project did an environmental check (MND or EIR) — and people can still sue saying the check wasn't good enough, forcing it to be redone.",
    });
  } else {
    rows.push({
      mechanism: "ceqa-litigation",
      risk: "not-evidenced",
      rationale: "This short excerpt doesn't say what environmental check was done — check the full report to know for sure.",
    });
  }

  // 2. Ballot-box supermajority — cross-referenced against this city's ordinances
  const ballotOrd = cityOrdinances.find((o) => o.mechanism === "ballot-box-supermajority");
  if (ballotOrd) {
    rows.push({
      mechanism: "ballot-box-supermajority",
      risk: "confirmed",
      rationale: "We have proof this city has used a public-vote rule before — so this is a real risk here, not just a guess.",
      citation: ballotOrd.title,
    });
  } else {
    rows.push({
      mechanism: "ballot-box-supermajority",
      risk: "not-evidenced",
      rationale: "We don't have proof (yet) that this city uses a public-vote rule like this.",
    });
  }

  // 3. Discretionary design review
  if (/discretionary|design review|use permit|conditional use|site plan and architectural review|site development planning/i.test(text)) {
    rows.push({
      mechanism: "discretionary-design-review",
      risk: "confirmed",
      rationale: "This is exactly the kind of meeting where a small group can vote no, shrink it, or add expensive conditions — just based on opinion.",
    });
  } else {
    rows.push({
      mechanism: "discretionary-design-review",
      risk: "not-evidenced",
      rationale: "This excerpt doesn't sound like a vote-your-opinion type of meeting.",
    });
  }

  // 4. Subjective design standard — cross-referenced against Objective Design Standards ordinance
  const odsOrd = cityOrdinances.find((o) => /objective design standards?/i.test(o.title || ""));
  if (odsOrd) {
    rows.push({
      mechanism: "subjective-design-standard",
      risk: "possible",
      rationale: "This city has clear, measurable design rules on the books, which helps — but only if those rules are truly measurable and not just opinions with a fancy name.",
      citation: odsOrd.title,
    });
  } else {
    rows.push({
      mechanism: "subjective-design-standard",
      risk: "possible",
      rationale: "This city doesn't have clear, measurable design rules on record yet — so a vague 'it doesn't fit the neighborhood' denial is still possible.",
    });
  }

  // 5. PLA-linked appeal — generic risk for any project of real size
  const unitMatch = text.match(/(\d[\d,]*)\s*(dwelling units?|units?|homes?|apartments?)/i);
  if (unitMatch) {
    rows.push({
      mechanism: "pla-linked-appeal",
      risk: "possible",
      rationale: "A project this size is worth watching — sometimes an appeal like this is really just pressure for a union labor deal, not a real complaint.",
    });
  } else {
    rows.push({
      mechanism: "pla-linked-appeal",
      risk: "not-evidenced",
      rationale: "This excerpt doesn't say how many homes are planned, so we can't judge this risk yet.",
    });
  }

  // 6. Minimum lot size / setback / height cap
  if (/\bexception\b|nonconform|\bsetback\b|\bvariance\b/i.test(text)) {
    rows.push({
      mechanism: "minimum-lot-size-setback",
      risk: "confirmed",
      rationale: "This project is asking for an exception to the normal rules (like spacing or parking) — proof that the normal rules wouldn't allow it otherwise.",
    });
  } else {
    rows.push({
      mechanism: "minimum-lot-size-setback",
      risk: "not-evidenced",
      rationale: "This excerpt doesn't mention needing an exception to the normal rules.",
    });
  }

  // 7. Fiscal zoning (Prop 13) — structural, not item-specific
  if (build.housingSignal) {
    rows.push({
      mechanism: "fiscal-zoning-prop13",
      risk: "possible",
      rationale: "Because this is housing (not a store), it brings the city less tax money under old tax rules (Prop 13) — so the city has a quiet money reason to not prioritize it, even if nobody's complaining out loud.",
    });
  } else {
    rows.push({
      mechanism: "fiscal-zoning-prop13",
      risk: "not-evidenced",
      rationale: "This isn't a housing project, so this money-related risk doesn't apply here.",
    });
  }

  // Stable order matching the taxonomy's own canonical ordering.
  return CHALLENGE_MECHANISM_ORDER.map((key) => rows.find((r) => r.mechanism === key));
}

// ---------------------------------------------------------------------------
// Simple action cards — the Participate timeline collapses each action down
// to one line + one button ("Go here" / "Write this letter"), with the full
// detail (sample letter text, why it actually works, how it physically
// reaches a decision-maker) tucked behind a click so the default view stays
// dead simple.
// ---------------------------------------------------------------------------

function generateSampleLetter(build, route) {
  const s = letterSummary(build);
  const bodyName = (build.body || "").replace(/-/g, " ");
  const cityName = build.city.replace(/-/g, " ").replace(/\b\w/g, (c) => c.toUpperCase());
  const dateLine = build.date ? "the " + build.date + " meeting" : "an upcoming meeting";
  return (
    "To the " + cityName + " " + bodyName + ",\n\n" +
    "I'm writing about this item on your agenda for " + dateLine + ":\n\n" +
    "\"" + build.text + "\"\n\n" +
    s.concern + "\n\n" +
    s.why + "\n\n" +
    s.ask + "\n\n" +
    "Thank you for reading this before you vote.\n\n" +
    "Sincerely,\n" +
    "A " + cityName + " resident" +
    (route ? "\n\n(Sent to: " + route.url + ")" : "")
  );
}

// Why showing up / writing in actually works, and how it physically reaches
// the people voting — kept generic (true of any city meeting) rather than
// re-derived per item, since this is about how city government works, not
// about this specific project.
const ACTION_EXPLAINERS = {
  meeting: {
    why: "The people voting can only vote no (or shrink a project) if they think nobody wants it. Every person who shows up and says 'I support this' out loud, in the room, makes that much harder to do quietly.",
    how: "When you speak during public comment, it becomes part of the official meeting record (the minutes) — it's not just heard once, it's a permanent part of the file for that project, which can even matter later if the decision gets challenged.",
  },
  letter: {
    why: "Most people only show up to complain, not to support. A single letter of support can outweigh several complaints, because right now the loud voices are almost all on one side.",
    how: "City staff collect every letter into the 'staff report' packet the commission reads BEFORE the meeting even starts — so a letter sent a day or two ahead is guaranteed to be seen, even if you can't attend in person.",
  },
};
