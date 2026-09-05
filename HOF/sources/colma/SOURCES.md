# Colma, CA — Source Map

Researched via WebSearch/WebFetch only (no live browser). Confirmed URLs are marked;
anything I could not directly confirm is flagged explicitly rather than guessed.

(distillation-skipped . "pure-lookup" — this document is a source/infrastructure map,
not a claim requiring cross-source synthesis; no `.web.fact.af` / fundamental-distillation
pass applies.)

---

## 1. Planning Commission — Agendas & Minutes

**CONFIRMED: Colma has NO standalone Planning Commission.** This is the single most
important structural finding for this town.

- Searched `colma.ca.gov` directly (site-scoped search), the Council Committee
  Assignments page, and the Planning Department page — no Planning Commission is named
  anywhere. The town's committee/commission list (confirmed via
  https://www.colma.ca.gov/council-committee-assignments/) covers ABAG, C/CAG, CCGA,
  Colma Creek Citizens Advisory Committee, Emergency Services Council, HEART, Peninsula
  Clean Energy, Commute.org, SFO Community Roundtable, and the SMC City Selection
  Committee — no planning body.
- Confirmed the **Planning Department** exists as a staff department
  (https://www.colma.ca.gov/departments/planning/) handling current application
  processing, long-range planning, General Plan maintenance, and Zoning Code
  administration — but it is a staff function, not a commission with its own public
  meetings/agendas.
- Design review and zoning-amendment items that would go to a Planning Commission in a
  larger town instead appear directly on the Town Council's agenda, or are approved
  administratively at staff/Planning Department level (see project tracker at
  https://www.colma.ca.gov/current-projects/ — e.g. "PL2026-001" ADU zoning amendment
  "Approved and adopted by the City Council on 1/28/2026"; "B2025-0006" ADU conversion
  "received approval by Planning" directly, no commission hearing referenced).
- **Conclusion: the 5-member Town Council acts as the de facto planning body** for
  legislative zoning/ordinance actions, with the Planning Department handling
  ministerial/administrative approvals. This tracks with the town's tiny size (~1,500
  living residents; 2.2 sq mi, ~75-78% zoned cemetery land per Mental Floss/All That's
  Interesting/When In Your State reporting).
- Est. pull effort: N/A — no Planning Commission portal exists to pull. Any
  planning-adjacent item is inside the Town Council agenda archive (see §2 same portal).

---

## 2. Town Council — Agendas & Minutes (substitutes for Planning Commission)

- **Name:** Colma Town/City Council (used interchangeably in town materials — legal
  name is "Town of Colma," meeting pages say "City Council").
- **URL (current, live agendas):** https://colmaca.portal.civicclerk.com/ — confirmed
  via fetch of https://www.colma.ca.gov/city-council-meetings/, page title "Public
  Portal • CivicClerk."
- **URL (historical archive, pre-migration):** Laserfiche repository —
  https://portal.laserfiche.com/Portal/Browse.aspx?id=830&repo=r-4222b8fd (confirmed
  link on the same city-council-meetings page).
- **URL (per-meeting static pages, ProudCity CMS):** individual meeting pages exist at
  patterns like https://www.colma.ca.gov/meetings/regular-meeting-october-22-2025/ and
  https://www.colma.ca.gov/meetings/regular-council-meeting-november-12-2025/, with an
  archive index at https://www.colma.ca.gov/meeting-taxonomy/city-council/ (confirmed
  at least through page 2 of 36 in search results — implies a deep paginated archive
  going back many years on the ProudCity side, separate from CivicClerk/Laserfiche).
- **Platform:** **CivicClerk** for current agendas; **Laserfiche** for historical
  document records; underlying town website CMS is **ProudCity** (confirmed footer
  branding "Powered by ProudCity," and file storage at
  `storage.googleapis.com/proudcity/colmaca/...` seen on multiple document links, e.g.
  the Dec 10, 2025 minutes PDF at
  https://storage.googleapis.com/proudcity/colmaca/2025/11/edab18b2-minutes-regular-meeting-12.10.25.pdf).
- **Archive depth:** CivicClerk portal is described in fetched page content as covering
  "July 1, 2026 to the present" — **flagged as UNCONFIRMED / suspicious**, since that
  reads like a forward migration cutover date rather than a start-of-archive date, and
  is inconsistent with meeting pages already dated in 2025 and even Feb 2026 found via
  ProudCity search. Most likely reading: CivicClerk went live as the *current* agenda
  system around mid-2026, with everything before that routed to Laserfiche and the
  ProudCity-hosted static meeting pages. **This needs live-browser confirmation** — do
  not trust the exact cutover date without opening the CivicClerk portal directly.
  ProudCity-hosted meeting-taxonomy pages independently show a paginated archive
  ("Page 2 of 36") suggesting many years of history are retained on that side.
- **Meeting cadence:** confirmed — City Council meets 2nd and 4th Wednesday of each
  month, 7:00pm, Town Hall, 1198 El Camino Real, Colma, CA 94014 (confirmed via
  https://www.colma.ca.gov/city-council-meetings/ and
  https://www.colma.ca.gov/question/can-see-city-council-meeting-agenda/).
- **Access notes:** Agendas/packets posted "at least 72 hours prior" to meetings; also
  available in person at Town Hall 8am-5pm M-F. Agendas by email available on request to
  mestabillo@colma.ca.gov / (650) 997-8300 (confirmed contact, appears in multiple
  fetched pages).
- **Est. pull effort:** LOW for current agendas via CivicClerk (structured portal,
  standard vendor UI); MEDIUM for pre-cutover history since it's split across
  Laserfiche (needs its own navigation) and ProudCity static pages (36 pages of
  taxonomy archive to page through).

---

## 3. Transportation Commission (or equivalent)

**CONFIRMED: no standalone Transportation Commission exists in Colma** — expected for a
town this size. Regional bodies substitute:

- **City/County Association of Governments of San Mateo County (C/CAG)** — the primary
  regional transportation planning body Colma participates in. Confirmed via
  https://www.colma.ca.gov/question/city-county-association-of-government-c-cag/ and
  independently at https://ccag.ca.gov/programs/transportation-programs/. C/CAG is a
  Joint Powers Authority covering all 20 San Mateo County cities plus the County;
  handles transportation, air quality, stormwater, airport/land-use compatibility,
  climate, and solid-waste/recycling programs.
- **San Mateo County Transit District (SamTrans)** — operates county bus transit;
  Colma has a dedicated town page at
  https://www.colma.ca.gov/public-transportation/ and a specific presentation page,
  https://www.colma.ca.gov/reimagine-samtrans-masterplan-presentation/ (confirmed via
  search, not yet fetched for full content — flagged for live-browser follow-up).
- **San Mateo County Transportation Authority (SMCTA)** — plans/funds transportation
  improvements from the countywide transportation sales tax (Measure A, reauthorized
  2009). Colma is grouped under the "Northern Judicial Cities" for SMCTA board
  appointment purposes (confirmed via https://www.smcta.com/whats-happening/board_directors
  and search synthesis — city councilmembers are appointed by the Board of Supervisors
  to 2-year terms representing judicial districts).
- **Peninsula Traffic Congestion Relief Alliance / Commute.org** — regional
  transportation-demand-management body Colma also sits on (confirmed via
  council-committee-assignments page).
- **Platform/archive:** N/A for Colma itself since there is no town-level body; C/CAG's
  own board materials are hosted at ccag.ca.gov (e.g.
  https://ccag.ca.gov/wp-content/uploads/2022/03/9.1-CCAG-TIRCP-Samtrans-ltr-Support-2-18-22-1.pdf
  as one example document found) — that is a separate JPA chronology outside Colma's
  own site and outside this task's scope unless the housing project specifically needs
  C/CAG-level transportation data.
- **Est. pull effort:** LOW (no town portal to search) if only Colma's participation is
  needed; MEDIUM-HIGH if C/CAG's own board agenda archive must be mined separately.

---

## 4. Recently Adopted Ordinances / Housing-Related Municipal Code Updates

- **Municipal code host:** **Self-hosted on ProudCity/Google Cloud Storage** — NOT
  eCode360, NOT Municode, NOT codepublishing.com. Confirmed via fetch of
  https://www.colma.ca.gov/municipal-code/ — individual chapter PDFs are linked at
  URL patterns like `/documents/cmc-1-01-general-organization-functions-general-provisions/`
  and `/documents/cmc-2-08-smoking-control/`, ultimately resolving to files under
  `storage.googleapis.com/proudcity/colmaca/uploads/`. A full table-of-contents PDF was
  also found: https://storage.googleapis.com/proudcity/colmaca/2020/05/Colma_-Municipal-Code-Table-of-Contents-c1.pdf
  (dated December 2020 in the PDF filename/title — likely stale relative to current
  code; flagged, needs re-check for a more recent TOC).
  There is no searchable/ordinance-disposition-table interface like eCode360's — each
  chapter is an individually hosted static PDF, so tracking "what changed and when"
  requires either individual ordinance PDFs or Council minutes, not a code-host
  changelog.
- **Most recent general code update found (search-derived, unconfirmed by direct PDF
  fetch this session):** search results state "The Municipal Code is updated through
  the adoption of Ordinance 810, adopted April 27, 2022" — **flagged UNCONFIRMED**,
  this is an AI-search-summarized claim, not independently verified against a primary
  ordinance PDF in this session. Needs direct confirmation against the ordinance list
  or council minutes from that date in a live-browser pass.
- **Housing Element status — CONFIRMED, well-documented:**
  - 6th Cycle (2023-2031) RHNA allocation: **202 total units** (44 Very Low / 25 Low /
    37 Moderate / 96 Above Moderate) — confirmed via fetch of
    https://www.colma.ca.gov/housing-element/.
  - HCD comment letters: first draft comments Sept 2022, second comment letter March
    2023 (both referenced as PDFs on the housing-element page).
  - Submittal history to HCD: Draft Public Review (Jan 2023), Site Inventory (July
    2023), 3rd submittal (Aug 2023 —
    https://www.colma.ca.gov/documents/housing-element-3rd-submittal-to-hcd-august-2023/),
    4th submittal (Sept 2023), 5th submittal (Oct 2023), **Final submittal (Nov 2023 —
    https://www.colma.ca.gov/documents/colma-heu-final-submittal-to-hcd-november-2023/)**.
  - **Certification: HCD certified Colma's Housing Element Update in March 2024**
    (confirmed via WebSearch synthesis citing local reporting that Colma was "among
    eight jurisdictions in the county... now in full compliance" — the actual HCD
    certification letter PDF itself was not located/fetched directly this session;
    flagged as search-corroborated but not primary-source-confirmed. Comparable
    jurisdictions' certification letters follow a standard HCD template hosted on the
    town's own site, e.g. Los Gatos's at
    https://www.losgatosca.gov/DocumentCenter/View/39111/HCD-Certification-Letter---07-10-2024
    — Colma's equivalent letter was not found at an analogous URL in this session and
    should be searched for directly on colma.ca.gov in a live pass).
  - **Post-certification implementation, CONFIRMED via current-projects tracker
    (https://www.colma.ca.gov/current-projects/):** ADU Zoning Amendment for state
    mandates, tracked as **PL2026-001**, "Approved and adopted by the City Council on
    1/28/2026" — this is the concrete housing-element-implementation ordinance action
    for Colma in the 2023-2026 window. An individual ADU conversion permit (B2025-0006,
    approved 3/27/2025) is also tracked but is a permit, not an ordinance.
  - **No builder's remedy, no state-mandated rezoning program, no HCD non-compliance
    letters were found for Colma** in this session — the town appears to have stayed
    in continuous good standing with HCD (certified March 2024, no compliance gap
    identified). This should be explicitly flagged as a CONTRAST point: unlike towns
    that faced builder's remedy exposure or rezoning mandates for RHNA shortfalls,
    Colma's small 202-unit allocation and quick March 2024 certification put it in a
    fundamentally different risk posture than a larger town like Menlo Park, which has
    had more contested/litigated housing element cycles. This is compounded by the
    unusual land-use base: independently confirmed via search (Mental Floss, All
    That's Interesting, When In Your State, SF Chronicle) that **roughly 75-78% of
    Colma's 2.2 sq mi is zoned for cemetery use**, with ~1,500 living residents against
    an estimated 1.5 million interred — meaning the town's buildable/rezonable land base
    for meeting its 202-unit RHNA is structurally tiny and largely non-cemetery parcels
    along El Camino Real/Serramonte corridor commercial sites, a completely different
    physical planning problem than Menlo Park's more conventional suburban land supply.
    This is a genuinely load-bearing compare/contrast fact for the housing hackathon
    thesis, not incidental color.

---

## 4b. Login Walls / CAPTCHA / Pagination Notes for a Human+Browser Session

- No login wall or CAPTCHA was encountered on any `colma.ca.gov` page fetched via
  WebFetch in this session (ProudCity-hosted pages, static PDF links, and document
  pages all returned content directly).
- The **CivicClerk portal** (`colmaca.portal.civicclerk.com`) returned only a bare
  "Public Portal • CivicClerk" header on WebFetch — this is very likely a
  JavaScript-rendered single-page app that WebFetch's markdown conversion cannot
  execute. **A live browser session (claude-in-chrome) will be required** to actually
  enumerate meeting bodies, dates, and any Planning-Commission-labeled entries inside
  CivicClerk, since static fetch could not render it.
- The **Laserfiche portal** link
  (https://portal.laserfiche.com/Portal/Browse.aspx?id=830&repo=r-4222b8fd) was found
  but not fetched this session — Laserfiche portals commonly require either no auth
  (public browse mode) or a login depending on repository configuration; this needs
  direct browser confirmation of which mode Colma's repo uses.
- One direct 404 was hit: `https://www.colma.ca.gov/topics/codes/` returned HTTP 404
  despite appearing in WebSearch results — the live URL is
  `https://www.colma.ca.gov/municipal-code/` instead (confirmed working). This is a
  sign the town's ProudCity site has had URL/slug churn; search-indexed URLs should be
  treated as approximate and re-verified by following the current site's own internal
  links rather than assuming search-result URLs are still live.
- ProudCity's `meeting-taxonomy` archive index paginates ("Page 2 of 36" observed) —
  expect standard `?page=N` or `/page/N/`-style pagination, no bot gate detected in
  search snippets, but full page-by-page enumeration wasn't performed via WebFetch this
  session (only isolated result pages were sampled).
- No evidence of rate-limiting or bot-detection (403s) encountered on any colma.ca.gov
  path fetched this session — all non-404 fetches succeeded on first try.

---

## Pull Plan

Ordered for a live browser session, most recent/highest-value first:

1. `https://colmaca.portal.civicclerk.com/` — render with JS to enumerate actual
   meeting-body list (confirm/deny any Planning-Commission-labeled agenda item exists
   inside CivicClerk that wasn't visible in static search) and confirm the true archive
   start date (the "July 1, 2026" figure needs correction/confirmation).
2. `https://www.colma.ca.gov/current-projects/` — re-pull live to get the up-to-date
   project tracker table in full (PL2026-001 ADU ordinance, PL2025-020, PL2025-032,
   PL2025-002) as the primary source of what's actually moving through
   planning/zoning right now.
3. `https://www.colma.ca.gov/housing-element/` — re-pull and follow every document
   link, specifically hunting for the actual HCD certification letter (March 2024) PDF,
   which was not located by URL in this session.
4. `https://portal.laserfiche.com/Portal/Browse.aspx?id=830&repo=r-4222b8fd` —
   determine auth requirements and historical Council agenda/minutes depth.
5. `https://www.colma.ca.gov/meeting-taxonomy/city-council/` (and its `/page/2/`
   through `/page/36/` pagination) — build the full historical meeting-date index from
   the ProudCity side to cross-check against CivicClerk/Laserfiche coverage gaps.
6. `https://www.colma.ca.gov/municipal-code/` — re-pull and click through to confirm
   whether "Ordinance 810 (April 27, 2022)" is genuinely the most recent codified
   ordinance, or whether the ADU ordinance (PL2026-001, adopted 1/28/2026) has already
   been codified as a newer ordinance number.
7. `https://www.colma.ca.gov/reimagine-samtrans-masterplan-presentation/` — confirm
   content and date; determine if this is relevant to a transportation-equity angle for
   the housing hackathon.
8. `https://ccag.ca.gov/programs/transportation-programs/` — only if the hackathon
   thesis needs county-level (not town-level) transportation planning data, since Colma
   itself has no standalone transportation body.
