# Foster City, CA — Source Map

Researched via WebSearch/WebFetch only (no live browser). Confirmed URLs are marked;
anything I could not directly confirm is flagged explicitly rather than guessed.

---

## 1. Planning Commission — Agendas & Minutes

- **Name:** City of Foster City Planning Commission
- **Landing/index page (confirmed via WebFetch):**
  https://www.fostercity.org/agendasandminutes — footer reads "Government
  Websites by CivicPlus®," confirming the main city site CMS is **CivicPlus**.
  This page is a router/index into the actual agenda repository, not the
  repository itself.
- **Actual agenda/minutes platform (confirmed via WebFetch):** **PrimeGov**,
  not CivicPlus AgendaCenter and not Granicus. Evidenced by a live Planning
  Commission meeting page:
  https://fostercity.primegov.com/Portal/Meeting?meetingTemplateId=5624
  (five-member body; agenda dated April 4, 2024 in fetched content),
  referencing documents on Azure blob storage
  (`primegovmasterpublic.blob.core.windows.net`).
- **Migration note (confirmed via WebFetch):**
  https://www.fostercity.org/229/Agendas-Minutes---Migration — the city
  states it is "in the process of migrating to a new agenda management
  system," with separate containers for meetings **before/after August 12,
  2026** (a very recent cutover relative to today, 2026-09-05). The legacy
  (pre-migration) platform name was **not confirmed** on this page —
  plausibly Granicus or CivicPlus AgendaCenter by general municipal pattern,
  but this is inference only, not confirmed.
- **Archive depth:** Deepest date directly confirmed via fetch is **March 21,
  2024** (a minutes document linked from the Consent Calendar of the
  April 4, 2024 PrimeGov agenda page). Depth further back was **not
  confirmed** in this pass — PrimeGov's archive is paginated/searchable and
  would need live browsing, not a single WebFetch, to establish a floor
  year.
- **Access notes:** No login wall or CAPTCHA encountered on the pages that
  did load. However, most other `fostercity.org` subpages returned **403
  Forbidden or 404 Not Found** on direct WebFetch (bot-hostile CivicPlus
  front end on many paths), so confidence is uneven page-to-page — treat a
  fetch failure as inconclusive, not as "page doesn't exist."
- **Est. pull effort:** **Medium.** The PrimeGov portal itself looks
  reasonably structured, but the migration in progress (cutover August 2026)
  means a live session should check whether pre- and post-migration meetings
  live in two different UIs/URLs, and the legacy platform for older archives
  is still unidentified.

---

## 2. Transportation-Equivalent Commission

- Foster City does **not** appear to have a standing body literally named
  "Transportation Commission" or "BPAC." The closest functional equivalent
  identified is the **Traffic Review Committee (TRC)**:
  - https://www.fostercity.org/bc-trc/page/traffic-review-committee-regular-meeting-14
    (**snippet-confirmed only** — direct WebFetch returned 404)
  - https://www.fostercity.org/bc-trc/page/traffic-review-committee-regular-meeting-cancelled-0
    (snippet only, unconfirmed)
- Also surfaced via search: an apparently **defunct "Transportation
  Subcommittee"** —
  https://www.fostercity.org/bc/page/cancelled-transportation-subcommittee
  (snippet only; the page title itself says "CANCELLED," not fetch-confirmed).
- Bicycle/pedestrian planning is run as a **project**, not a standing
  advisory commission: the **Foster City Bicycle and Pedestrian Master
  Plan**, at https://www.fostercity.org/718/Foster-City-Bicycle-Pedestrian-Master-Pl
  and https://www.fostercity.org/publicworks/project/foster-city-bicycle-and-pedestrian-master-plan
  (both snippet-confirmed only, not fetched). Search snippets suggest an
  active 2026 public-draft/outreach process (survey, a July 2026 outreach
  event, an August 3, 2026 City Council public hearing) — a live planning
  effort, not a standing commission with its own recurring agenda portal.
- **Do not conflate** with the regional **C/CAG Bicycle and Pedestrian
  Advisory Committee (BPAC)** at `ccag.ca.gov`, which covers multiple San
  Mateo County cities including Foster City but is a *county-level* body,
  not Foster City's own.
- **Bottom line:** No confirmed dedicated Transportation Commission
  agenda/minutes portal exists for Foster City analogous to Planning
  Commission. Traffic Review Committee is the closest equivalent, but its
  exact portal URL and hosting platform are **unconfirmed** (search-snippet
  level only) and should be verified live.

---

## 3. Recently Adopted Ordinances / Housing Element Compliance

- **Municipal code host:** Search results indicate **Code Publishing Co.**
  hosts Foster City's code at https://www.codepublishing.com/CA/FosterCity/
  (found via WebSearch title "Foster City Municipal Code |
  codepublishing.com" — **direct WebFetch returned 403 Forbidden**, so this
  is search-snippet-confirmed only, not page-content-confirmed). No evidence
  was found that Foster City uses Municode or eCode360 for its own code; a
  `municode.com/municode/page/foster-city-california` URL surfaced in search
  but also returned 403 on fetch and its actual content/purpose (legacy
  listing vs. active host) is **unconfirmed**.
- **Housing Element 2023–2031 (6th Cycle) — all points below are
  search-snippet level, cross-referenced across at least two independent
  sources, but NOT directly WebFetch-confirmed this pass:**
  - HCD certified the Housing Element on **April 18, 2024**.
  - City Council adopted **Resolution 2024-17** (minor revisions) on
    **March 20, 2024**; Planning Commission had recommended approval via
    **Resolution P-2-24**.
  - City Council adopted **Resolution 2023-48** on **May 22, 2023**,
    certifying the EIR for the 6th Cycle Housing Element and Safety Element
    Update.
  - HCD determined on **February 2, 2024** that the city's January 31, 2024
    draft revisions met statutory requirements.
  - Zoning Map and Title 17 (Zoning) amendment ordinances were reportedly
    introduced consistent with the Housing Element (specific ordinance
    number **not confirmed**).
  - Source URLs (all snippet-level, not directly fetched this session):
    - https://www.fostercity.org/1003/Housing-Legislation
    - https://www.fostercity.org/citycouncil/page/rhna-requirements-and-affordable-housing-overlay
    - https://engagefostercity.org/housing-element
    - https://www.hcd.ca.gov/housing-elements/docs/foster-city-6th-draft070522.pdf
      (HCD's own draft-review PDF — primary state-side source, most likely
      to survive a live fetch)
    - https://ceqanet.opr.ca.gov/2022010509 (CEQA record for the EIR)
  - **No evidence found** of a Builder's Remedy dispute against Foster City
    in this search pass — this is absence of evidence, not evidence of
    absence; the search was not exhaustive on this specific point.
- **Access notes:** codepublishing.com and municode.com both returned HTTP
  403 to automated WebFetch — consistent with bot/JS-challenge gating seen
  on other cities' code hosts in this project, not necessarily a true login
  wall. `hcd.ca.gov` PDF links are far more likely to be directly fetchable
  and should be prioritized as primary sources in a live session.
- **Est. pull effort:** **Medium–High.** The Housing Element paper trail is
  well-documented in secondary/city sources but none of the primary
  resolution PDFs or the municipal code were confirmed by direct fetch in
  this pass; a live session should start from the HCD PDF (least likely to
  be bot-gated) and the `fostercity.org/1003/Housing-Legislation` page.

---

## 4. Login Walls / CAPTCHA / Pagination Notes for a Human+Browser Session

- **fostercity.org (CivicPlus):** No login wall or CAPTCHA encountered on
  pages that loaded successfully. However, **most subpages returned 403 or
  404 to automated WebFetch** (e.g. `/cityclerk/page/city-codes-and-ordinances`,
  `/bc-trc/page/traffic-review-committee-regular-meeting-14`), which is
  consistent with bot-hostile behavior on parts of the CivicPlus front end
  rather than a genuine credential wall. A live browser session should
  expect these same paths to load fine as a real user.
- **fostercity.primegov.com (PrimeGov):** No login wall or CAPTCHA
  encountered on the one meeting page fetched
  (`?meetingTemplateId=5624`). PrimeGov portals are typically paginated by
  meeting-template ID and date filter in the live UI — a WebFetch-only pass
  cannot page through the archive; a live session should use the portal's
  own date/search filters rather than guessing `meetingTemplateId` values.
- **Migration transition (as of 2026-09-05):** The city's own
  `/229/Agendas-Minutes---Migration` page states an **August 12, 2026**
  cutover between an old and new agenda system. A live session should
  expect to navigate TWO different UIs/URL schemes depending on whether the
  target meeting predates or postdates that cutover, and should identify
  the legacy (pre-migration) platform on-site since it was not confirmed
  here.
- **codepublishing.com / municode.com (municipal code):** Both returned HTTP
  403 to automated WebFetch. As with other cities in this project, treat
  this as likely bot/JS-challenge gating rather than a true login wall — a
  real browser session should load normally, possibly with a brief
  interstitial.
- **No CAPTCHA was encountered** on any page in this research pass (whether
  it loaded or 403/404'd).

---

## Pull Plan

Ordered list of exact pages for a human+browser-extension session to visit
first:

1. https://www.fostercity.org/agendasandminutes — start here; this is the
   confirmed router page into Planning Commission and other bodies' current
   agendas.
2. https://fostercity.primegov.com/Portal/Meeting?meetingTemplateId=5624 —
   confirmed live Planning Commission PrimeGov portal page; use the
   portal's own date filter/search to pull the trailing 6–12 months.
3. https://www.fostercity.org/229/Agendas-Minutes---Migration — read this
   page live to identify (a) the exact legacy platform used before the
   August 12, 2026 cutover, and (b) where pre-cutover archives now live.
4. https://www.fostercity.org/bc-trc/page/traffic-review-committee-regular-meeting-14
   — confirm live whether this is in fact the Traffic Review Committee's
   real agenda/minutes page (only snippet-confirmed in this pass; returned
   404 to automated fetch).
5. https://www.fostercity.org/718/Foster-City-Bicycle-Pedestrian-Master-Pl
   and https://www.fostercity.org/publicworks/project/foster-city-bicycle-and-pedestrian-master-plan
   — for the active 2026 Bicycle & Pedestrian Master Plan process (survey,
   outreach, August 2026 Council hearing).
6. https://www.hcd.ca.gov/housing-elements/docs/foster-city-6th-draft070522.pdf
   — state HCD-side primary document for the 6th Cycle Housing Element,
   most likely to be directly fetchable (not city-hosted, not bot-gated).
7. https://www.fostercity.org/1003/Housing-Legislation and
   https://www.fostercity.org/citycouncil/page/rhna-requirements-and-affordable-housing-overlay
   — city-hosted Housing Element / RHNA pages; live-verify Resolution
   2024-17 and Resolution 2023-48 details cited only from search snippets
   here.
8. https://www.codepublishing.com/CA/FosterCity/ — municipal code host
   (403'd to automated fetch); load live to confirm this is indeed the
   active host and to drill into zoning (Title 17) chapters relevant to the
   Housing Element rezoning.
9. https://ceqanet.opr.ca.gov/2022010509 — CEQA record for the Housing
   Element / Safety Element EIR, useful cross-reference for the adoption
   timeline.
