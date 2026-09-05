# Portola Valley, CA — Source Map

Researched via WebSearch/WebFetch only (no live browser). Confirmed URLs are marked;
anything I could not directly confirm is flagged explicitly rather than guessed.

**Note on WebFetch behavior:** every direct WebFetch attempt against `portolavalley.net`
pages returned **HTTP 403 Forbidden** during this research session (bot-gated at the
edge/CDN, likely CivicPlus's own WAF or Cloudflare bot management). All portolavalley.net
findings below are therefore derived from WebSearch result snippets/cached text, NOT
confirmed by direct page fetch. A live browser session will likely succeed where WebFetch
did not — flagged per-item below.

---

## 1. Planning Commission — Agendas & Minutes

- **Name:** Planning Commission, Town of Portola Valley
- **URL:** `https://www.portolavalley.net/town-government/planning-commission/minutes-and-agendas`
  (confirmed via WebSearch result; **not** independently confirmed by WebFetch — 403'd)
- **Platform:** Not directly confirmed. Circumstantial evidence points to **CivicPlus**
  (CivicEngage-style CMS): individual meeting/event pages resolve through a distinctive
  path pattern `/Home/Components/Calendar/Event/<event-id>/<category-id>` (e.g.
  `https://www.portolavalley.net/Home/Components/Calendar/Event/34836/116?npage=5&sortn=EName&sortd=desc`),
  which is a known CivicPlus "Calendar" module URL shape, not a Granicus/Legistar/CivicClerk
  pattern (those use `legistar.com`, `granicus.com`, or `civicclerk.com` subdomains/hosts,
  none of which appeared anywhere in search results tied to portolavalley.net). **Flag:
  platform identification is inferential, not confirmed** — a live browser session
  checking page source / footer "powered by" text is needed to confirm CivicPlus vs. a
  bespoke CMS.
- **Archive depth:** Unconfirmed exact start date. The calendar pagination parameter
  (`npage=5`, `npage=28` seen on a related Special Planning Commission page) implies a
  multi-page, likely multi-year archive, but no explicit "archive begins in YYYY" text was
  found in search snippets.
- **Meeting cadence:** Planning Commission meets 1st and 3rd Wednesdays, 7:00 pm, Historic
  Schoolhouse, with occasional field meetings (per site snippet). Packets are posted by
  the Saturday before the meeting (per site snippet).
- **Access notes:** Meeting videos also posted to YouTube per site text; no login wall
  language appeared in any snippet. CAPTCHA/bot-gate behavior is a server-side 403 to the
  WebFetch tool specifically (see Section 4) — unclear if this blocks all automated
  fetchers or only this tool's user-agent/IP.
- **Est. pull effort:** Low-medium in a live browser (page structure looks like a standard
  event-detail template); WebFetch alone cannot retrieve it (403 on every attempt).

---

## 2. Transportation Commission (or equivalent)

Two relevant bodies were found and should be distinguished — **do not conflate them.**

### 2a. Bicycle, Pedestrian & Traffic Safety Committee (the actual transportation-equivalent body)
- **URL:** `https://www.portolavalley.net/government/town-committees/bicycle-pedestrian-traffic-safety-committee/` (confirmed to exist via WebSearch snippet; page includes a paginated event list variant,
  e.g. `.../-sortn-EDate/-sortd-asc/-npage-4/-toggle-allpast`; not independently confirmed
  by WebFetch — 403'd)
- **Platform:** Same inferred CivicPlus-style calendar/committee page pattern as Section 1.
- **Purpose (per site snippet):** Advises the Town on safer conditions for motor vehicles,
  bicycles, pedestrians, and road conditions; promotes proper traffic enforcement and safe
  bicycling as transportation/recreation.
- **Status note:** As of the search snippet date, the committee "currently has 7
  vacancies for dedicated volunteers" — unconfirmed whether this is still current; flag
  as a point-in-time snippet, not verified live.
- **Related regional body (not a Portola Valley town body):** Portola Valley participates
  in **C/CAG (City/County Association of Governments of San Mateo County)**'s Bicycle and
  Pedestrian Advisory Committee (BPAC), a countywide body, not a town committee — relevant
  context but out of scope for this town-level source map.
- **Archive depth / access notes:** Unconfirmed; same 403 pattern expected as Section 1.

### 2b. Trails and Paths Committee (equestrian/trails-focused, NOT primarily a transportation body but historically adjacent — confirms the rural/equestrian-character note the task asked to check for)
- **URL:** `https://www.portolavalley.net/government/town-committees/trails-and-paths-committee` (confirmed via WebSearch; not independently WebFetch-confirmed — 403'd)
- **Purpose (per site snippet):** Recommends routing/construction of new trails, usage
  restrictions and maintenance of existing trails, and an annual trails budget. Represents
  equestrians plus hikers, families, dog walkers, cyclists. Town has "nearly the same
  number of miles of trails as roads," reflecting a mission tied to the town's 1964
  founding.
- **Historical note:** A 2010 Almanac News article ("Trails committee: Not just for
  equestrians") confirms the committee's scope was historically debated/expanded beyond
  pure equestrian use — supports the rural/equestrian-character framing.
- **A 2011 Almanac News article** ("Adding bikers and hikers to Traffic Committee
  responsibilities?") suggests the Bicycle/Pedestrian/Traffic committee's bike-ped scope
  was itself a later addition to what may have originally been a narrower Traffic
  Committee — useful historical color, not independently verified beyond the headline
  snippet.
- **Archive depth / access notes:** Unconfirmed; same 403 pattern expected.

**Unconfirmed:** No distinct "Transportation Commission" (as a formally separate,
differently-named body from the Bicycle/Pedestrian/Traffic Safety Committee) was found.
The Bicycle, Pedestrian & Traffic Safety Committee appears to be the town's sole
transportation-focused committee.

---

## 3. Recently Adopted Ordinances / Housing-Related Municipal Code Updates

- **Municipal code host:** **Municode Library** (library.municode.com) — confirmed by
  direct search-result URLs, e.g.
  `https://library.municode.com/ca/portola_valley/codes/code_of_ordinances?nodeId=POVAMUCO1983`
  and `https://library.municode.com/ca/portola_valley` (root). The `nodeId=` query-param
  URL shape is Municode's standard pattern (as distinct from eCode360's `/codes/...`
  path style or codepublishing.com's structure). **Not independently confirmed by
  WebFetch** — the library.municode.com fetch also returned 403 in this session.
  - Title 18 = Zoning: `https://library.municode.com/ca/portola_valley/codes/code_of_ordinances?nodeId=TIT18ZO`
  - The town's own Municipal Code page links out to this Municode host:
    `https://www.portolavalley.net/departments/town-clerk/municipal-code` (unconfirmed by
    fetch, 403'd; content described only in search snippet).
- **Ordinance disposition/download system:** A distinct Municode subsystem URL was found —
  `https://mcclibraryfunctions.azurewebsites.us/api/ordinanceDownload/13781/1364025/pdf`
  (titled "Housing Element Implementation Zoning Code Amendments Town Council") — this is
  Municode's ordinance-PDF microservice (Azure-hosted), confirming Municode is the
  ordinance archival system as well as the code host. Not independently opened/verified
  beyond the search-result title.
- **Town-hosted ordinance page:** `https://www.portolavalley.net/departments/planning-building-department/resource-center/ordinances-regulations`
  (found via search; not WebFetch-confirmed, 403'd).

### Housing Element / HCD compliance timeline (HIGH CONFIDENCE — cross-confirmed across
multiple independent sources: The Almanac, ABC7, SFGate, SFist, Palo Alto Daily Post, HCD.ca.gov itself, and the Campaign for Fair Housing Elements tracker)

- **Jan 23-24, 2024:** Town Council adopted the 2023-2031 Housing Element.
- **Jan 30, 2024:** HCD certified the Housing Element.
- **Feb 5, 2024:** HCD put the town on notice regarding rezoning-deadline compliance.
- **Mar 20, 2024:** Planning Commission expedited zoning-code amendments / multifamily
  district introduction, just days before decertification.
- **Mar 26, 2024:** HCD **decertified/revoked** the Housing Element — Portola Valley
  reported as the **first California city to have a housing element revoked** under this
  process (per SFist, SFGate, Palo Alto Daily Post). Cause: town missed the state's
  post-certification rezoning deadline. Mayor Jeff Wernikoff (per Almanac) called HCD's
  approach a "one-size-fits-all" standard poorly suited to a town Portola Valley's size,
  criticizing a deadline "two days after housing element certification."
- **Oct 16, 2024:** HCD sent a follow-up technical-assistance/correction letter
  (`portola-valley-corr-action-020524.pdf` and `portola-valley-rezone-ta-letter-101624.pdf`
  on hcd.ca.gov, both confirmed as real hcd.ca.gov URLs via search results) asking the
  town to revise its zoning ordinance and general plan; town given until **Nov 26, 2024**
  to respond.
- **Site selection dispute:** State initially required rezoning ~7 acres of Dorothy Ford
  Park (with only 2.5 acres for housing); community opposition led the council to decline
  full park rezoning and pursue alternates via an Ad Hoc Site Evaluation Committee, which
  identified: Village Square, Thomas Fogarty Winery Open Space, Christ Church, and the
  Hawthorns Area as alternative sites.
- **Apr 9, 2025:** Rezoning ordinance introduced (Title 18 zoning amendments including
  Dorothy Ford Park site).
- **Apr 23, 2025:** Ordinance **passed** by Town Council at a regular meeting.
- **Apr 28, 2025:** Ordinance Nos. **2025-452** and **2025-453** submitted to HCD for
  review (specific ordinance numbers confirmed via WebSearch synthesis of HCD submission
  records — recommend a live-browser confirmation against the Municode ordinance-download
  microservice or the town clerk's ordinance list before citing these numbers as final in
  any published document).
- **May 28, 2025:** HCD **recertified** the Housing Element / found the rezoning
  compliant (`portola-valley-rezone-suc-comp-rev-052825.pdf` on hcd.ca.gov, confirmed URL;
  content is a compressed PDF that could not be text-extracted via WebFetch in this
  session — flagged as **fetched but not readable**, needs a proper PDF-text extraction
  pass, not a guess at contents).
- **Builder's remedy:** Per the Campaign for Fair Housing Elements tracker
  (`campaign-for-fair-housing-elements.webflow.io/cities/portola-valley`, confirmed
  fetchable), builder's remedy applications were "applied until 01/30/24" (i.e., the
  window builder's remedy exposure was live, from decertification-adjacent timing until
  the initial Jan 30 2024 certification date) — no specific named builder's-remedy
  project/developer was identified in this session's searches. This should be treated as
  **unconfirmed at the project level** — only the general exposure window is sourced.
  Note also (per the tracker) the town is behind on RHNA pace: **44 of 253 units
  completed (~17%) in the 2022-2030 cycle**, projected to reach only ~26% of need at
  current pace — this is a distinct, ongoing implementation-lag finding separate from the
  2024 decertification episode.
- **AB 1893 note (context, not Portola-Valley-specific):** builder's remedy projects
  submitted before 1/1/2025 face virtually no density limits; AB 1893 caps density for
  builder's-remedy projects submitted after that date. General state-law context found
  during search, not a Portola Valley-specific fact.

### Structural contrast note (as requested)
Portola Valley is a very-low-density, large-lot, rural-residential/equestrian town
(nearly as many trail-miles as road-miles, incorporated 1964, historically agricultural/
ranch character) — structurally similar in kind to Hillsborough's large-lot,
low-density pattern, though the two towns arrived at state housing-law conflict via
different specific mechanisms (Portola Valley: outright decertification over a missed
rezoning deadline; confirm Hillsborough's mechanism separately before asserting
equivalence in a comparative write-up). This framing is my own synthesis based on
confirmed town-character facts (trail/road ratio, 1964 founding, RHNA-lag data above) —
flagged as **analysis, not a directly sourced claim**.

---

## 4. Login Walls / CAPTCHA / Pagination Notes for a Human+Browser Session

- **portolavalley.net (all paths tested):** Every WebFetch attempt in this session against
  a portolavalley.net URL returned **HTTP 403 Forbidden**, with no HTML body returned —
  consistent with an edge-level bot gate (Cloudflare or a CivicPlus WAF rule) rather than
  a true user login wall. No CAPTCHA content could be observed (403 pages didn't render).
  **A live browser session (real Chrome UA + JS execution) should be tried first** — this
  is very likely to succeed where the headless WebFetch tool failed, since 403-on-fetch-
  tool-but-fine-in-browser is the single most common bot-gate pattern for CivicPlus sites.
- **library.municode.com:** Also returned 403 to WebFetch in this session. Municode
  sites are known to sometimes serve full content to browsers while blocking generic
  scrapers/bots — expect the same live-browser workaround to apply.
- **hcd.ca.gov PDFs:** These fetched successfully as binary PDF content (200 OK, no
  bot gate) but WebFetch's text-extraction step failed on at least one compressed PDF
  (`portola-valley-rezone-suc-comp-rev-052825.pdf`) — this is a tooling limitation, not a
  site-side block. A live browser or a proper PDF-text extraction tool will read these
  fine.
- **Pagination:** portolavalley.net's calendar/event listings use `npage=N` and
  `-npage-N-` query/path parameters (both forms observed across different snippet URLs —
  possibly two different eras/relayouts of the same CivicPlus module) plus `sortn=`/`sortd=`
  sort parameters and a `toggle=all`/`toggle=allpast` filter parameter. Expect to need to
  paginate through potentially dozens of pages (`npage=28` was seen on one committee's
  listing) to reach older archive material — a scripted/browser session should look for a
  "jump to year" or date-range filter control rather than paging sequentially if one
  exists on the live page (could not confirm from snippets alone).
- **No CAPTCHA evidence found** in any search snippet or fetch attempt — the observed
  blocking behavior is a flat 403, not a challenge page, based on what this session could
  observe.

---

## Pull Plan

Ordered for a live browser session, most recent/highest-value first:

1. `https://www.hcd.ca.gov/sites/default/files/docs/planning-and-community/HAU/portola-valley-rezone-suc-comp-rev-052825.pdf`
   — the May 28, 2025 recertification/compliance-review letter (fetched but unreadable in
   this session; open directly in-browser and read/extract text — highest-value single
   document, confirms final compliance status and likely cites the exact ordinance
   numbers).
2. `https://www.portolavalley.net/community/housing-element-update-for-2023-2031`
   — town's own Housing Element hub page; likely links to the adopted Housing Element PDF,
   rezoning ordinances, and HCD correspondence in one place.
3. `https://www.portolavalley.net/departments/planning-building-department/resource-center/ordinances-regulations`
   — town-hosted ordinance list; check for Ordinance Nos. 2025-452 / 2025-453 to confirm
   numbers found only via search synthesis above.
4. `https://library.municode.com/ca/portola_valley/codes/code_of_ordinances?nodeId=TIT18ZO`
   — Title 18 Zoning, to read the current post-rezoning multifamily district text directly.
5. `https://www.hcd.ca.gov/sites/default/files/docs/planning-and-community/HAU/portola-valley-rezone-ta-letter-101624.pdf`
   — Oct 16, 2024 HCD technical-assistance letter (mid-timeline detail).
6. `https://www.hcd.ca.gov/sites/default/files/docs/planning-and-community/HAU/portola-valley-corr-action-020524.pdf`
   — earlier HCD correction-action letter (Feb 2024), to pin down the exact original
   rezoning deadline that was missed.
7. `https://www.portolavalley.net/town-government/planning-commission/minutes-and-agendas`
   — Planning Commission agendas/minutes; confirm platform (page source/footer) and
   archive start date; pull Mar 20, 2024 meeting specifically (expedited zoning action).
8. `https://www.portolavalley.net/government/town-committees/bicycle-pedestrian-traffic-safety-committee/`
   — confirm current committee status/vacancies and pull recent minutes.
9. `https://www.portolavalley.net/government/town-committees/trails-and-paths-committee`
   — confirm committee charter text and recent minutes; low priority for the housing/
   transportation research angle but requested explicitly.
10. `https://www.portolavalley.net/departments/town-clerk/municipal-code`
    — confirm the exact outbound link/platform language the town uses to describe its
    Municode relationship.
11. `https://campaign-for-fair-housing-elements.webflow.io/cities/portola-valley`
    — re-check for any newer entries added after this research session's date
    (2026-09-05); this tracker fetched cleanly and is a good recurring-check source.

---

*Research conducted 2026-09-05 via WebSearch + WebFetch only. All portolavalley.net and
library.municode.com direct fetches were blocked (403); findings from those domains are
sourced from WebSearch result snippets and cross-referenced press coverage (The Almanac,
ABC7, SFGate, SFist, Palo Alto Daily Post) rather than confirmed by direct page retrieval.
HCD.ca.gov PDFs fetched successfully (200 OK) with one text-extraction failure noted above.*
