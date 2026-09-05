# Demo Script — Builder's Remedy Checker
### Deep Research — Linkup track ($500) · 3-minute video

Judging language this script is built to satisfy, verbatim from the brief:
> "a Project reacting to a trigger and performing an action" · "show the sources,
> the follow-up searches, and how the findings affect the result" · Shipping,
> Usefulness, Research quality, Integration (is Linkup essential?).

Every beat below is tagged with the criterion it answers so nothing on screen is
decorative.

---

## [0:00–0:20] The problem, the user, the stakes

**On screen:** cold open on a split screen — a stack of San Mateo County city
council PDFs and a text overlay reading "8 of 21 jurisdictions still don't have a
certified Housing Element." Then cut to a plain question in large type: *"Can I
build here without a rezoning fight?"*

**Voiceover (~15s):**
"San Mateo County has the highest Housing Element non-compliance rate in the Bay
Area. That means Builder's Remedy — a state law that strips a non-compliant city's
power to deny a housing project on zoning grounds — is live in more places here
than almost anywhere in California. But whether it actually applies to *your*
parcel, today, depends on facts that change monthly: has the city certified since
last quarter? Is a project's Builder's Remedy claim still standing, or was it just
rejected? Nobody keeps that current. We built something that checks, right now,
live."

*(Answers: Usefulness — names the real user and the real, current pain.)*

---

## [0:20–1:00] Trigger — user enters an address

**On screen:** the live, deployed app in a browser window (real URL visible in
the address bar — this is not a local mockup). User types a San Mateo County
address into a single input field, selects/confirms the jurisdiction, and clicks
**Check Eligibility**.

**Voiceover (~25s):**
"This is the Builder's Remedy Checker, live at [URL]. I'll drop in an address in
Pacifica — a city with one of the most contested Builder's Remedy pipelines in
the state. That's the trigger. Behind the scenes, the app doesn't start from a
blank page: it first checks our pre-seeded research cache — a chronology of
research across 14-plus San Mateo County cities we'd already built — for what's
already known about Pacifica's Housing Element status and its Builder's Remedy
history."

**On screen (secondary panel, visible, not narrated over):** a "Checking cached
findings…" state that resolves to a short list of cached facts with timestamps,
e.g. "Housing Element status: non-compliant (cached Sept 2024)" and "Builder's
Remedy project on record: Pacifica Quarry, 1,000+ units (cached)."

*(Answers: trigger must be visible — this is the on-screen trigger.)*

---

## [1:00–2:20] Action — the search-decide-search loop, sources, findings

**On screen:** UI transitions to a visible "Researching live…" state with a
running log of Linkup queries appearing one at a time, each with its returned
source list expanding below it.

**Voiceover (~35s), timed to the queries appearing on screen:**
"The cached finding on Pacifica Quarry is over a year old, and Builder's Remedy
statuses change fast — so the app doesn't trust a stale cache. It runs a live
Linkup search: 'Pacifica Housing Element certification status 2026.' Sources come
back with dates and URLs, shown right here, not just a paragraph of text."

**On screen:** query #1 result renders as a card: answer text + 2–3 source
chips (name, favicon, URL, date).

**Voiceover continues:**
"Here's the part that matters: the app doesn't stop at one search. It reads what
came back, and if the finding is ambiguous — say, the certification date and the
Builder's Remedy project status don't agree — it decides on a follow-up query
itself. Watch: because the first result flags Pacifica Quarry as 'pending,' the
app automatically fires a second Linkup search — 'Pacifica Quarry project
Planning Commission vote 2026' — to resolve the ambiguity. That's the store
findings, decide what's missing, search again loop the brief asks for, not a
single web lookup."

**On screen:** a second query card appears, triggered visibly (e.g. a small
"Gap detected → follow-up search" badge/arrow animates from card 1 to card 2)
before the query text types in and results populate.

**On screen:** a "Findings stored" panel accumulates entries with source
attribution as both searches complete — this is the persisted research record,
visible, not just spoken about.

*(Answers: "show the search sequence, the stored findings, the follow-up search
triggered by a gap, sources cited" — literally, on screen, each element named.)*

---

## [2:20–2:50] The uncertainty-flagging moment

**On screen:** the eligibility memo renders. Most sections show a green
"Confirmed" tag with a source link. One section — Pacifica Quarry — renders in
an amber "Status Contested / Recently Changed" block.

**Voiceover (~25s):**
"This is the moment that matters most. Our own earlier research — done by hand —
had reported Pacifica Quarry as an active 1,000-unit Builder's Remedy success
story. It wasn't current: Pacifica's Planning Commission actually voted 5-0 to
reject that project on August 3rd. A static report or a cached database would
have kept repeating the stale claim indefinitely. This tool's live Linkup
follow-up search is exactly the mechanism that would have caught that flip in
real time — it's why the memo shows 'contested, last confirmed [date]' instead
of asserting a fact that quietly went stale. Where the tool truly can't confirm
something, it says so, explicitly, in its own 'Could Not Confirm' section —
never a silent guess."

**On screen:** the "Could Not Confirm" section of the memo, visibly listing 1–2
items with a plain-language reason ("no source newer than [date] found").

*(Answers: Research quality — "finds missing info, checks evidence, flags
uncertainty" — this is the single clearest, most concrete proof point in the
whole demo.)*

---

## [2:50–3:00] Close

**On screen:** final memo view, then a card: "Built for San Mateo County renters,
builders, and advocates who need a current answer, not a stale one."

**Voiceover (~10s):**
"This is for anyone deciding whether to file, invest in, or fight a housing
project in San Mateo County, and it's live for anyone to use right now.
Linkup isn't swappable here for plain web search — the product's whole value is
the store-then-decide-next-search loop: persisting what's known, judging what's
missing or contested, and searching again until the gap closes. That loop is the
product. Sourced. Current. Honest about what it doesn't know."

*(Answers: Integration — names exactly why Linkup is structural, not cosmetic;
Shipping — "live for anyone to use right now.")*

---

## Production notes

- Every "on screen" element above must actually render in the recorded take —
  do not narrate a search that isn't visibly firing, per the brief's "not
  implied" instruction.
- Use Pacifica as the demo jurisdiction specifically because it is the one city
  where the project's own prior research (`reports/fact-check-verification.md`)
  already caught a real staleness error — this makes the uncertainty-flagging
  beat demonstrably true, not hypothetical.
- Keep total runtime at or under 3:00; the two heaviest beats (trigger, action)
  get the most screen time because they carry the judging language most
  directly.
