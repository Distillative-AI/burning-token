# Menlo Park, CA — Source Map

Researched via WebSearch/WebFetch only (no live browser). Confirmed URLs are marked;
anything I could not directly confirm is flagged explicitly rather than guessed.

---

## 1. Planning Commission — Agendas & Minutes

- **Name:** City of Menlo Park Planning Commission
- **URL (current, primary):** https://www.menlopark.gov/Agendas-and-minutes
  (Planning Commission section on this page lists current-year meetings; each
  commission section links to a "Previous Planning Commission agendas, minutes
  and staff reports" page broken out by year, e.g.
  https://www.menlopark.gov/Agendas-and-minutes/Previous-Planning-Commission-agendas-and-minutes/2018-Planning-Commission-agendas-and-minutes
  and https://www.menlopark.gov/Agendas-and-minutes/Previous-Planning-Commission-agendas-and-minutes/2025-Planning-Commission-agendas-and-minutes)
- **Platform:** Granicus (the menlopark.gov site is served on Granicus's
  "OpenCities" CMS — confirmed via page footer "Powered by Granicus"). This is
  **not** Legistar and **not** CivicClerk. There is also a legacy
  `menlopark.org` CivicEngage AgendaCenter mirror
  (https://menlopark.org/AgendaCenter/11 — "Planning Commission" node 11), which
  appears to be the prior-generation site; treat menlopark.gov as canonical and
  menlopark.org as a legacy/possibly-stale fallback.
- **Archive depth:** Individual PDF minutes exist back to at least **2003**
  (e.g. `20030407-planning-minutes.pdf`, `20030505-planning-minutes.pdf` under
  `/files/sharedassets/public/v/1/agendas-and-minutes/planning-commission/2003-meetings/`),
  and search evidence indicates per-year archive pages exist back to **2002**.
  I was not able to directly enumerate a single index page confirming 2002 as
  the hard floor — treat 2002–2003 as the practical archive boundary, not a
  guaranteed exact origin year.
- **Access notes:** Public, no login wall observed. Files are static PDFs
  under predictable per-year directories
  (`/files/sharedassets/public/v/1/agendas-and-minutes/planning-commission/<year>-meetings/{agendas,minutes}/YYYYMMDD-pc-....pdf`).
  No CAPTCHA encountered in search/fetch. Older years may only be reachable by
  clicking through the per-year "Previous ... agendas and minutes" landing
  pages rather than by direct filename guessing, since filename conventions
  shift across years (e.g. `20240415-pc-approved-minutes.pdf` vs
  `20030407-planning-minutes.pdf`).
- **Est. pull effort:** **Low–Medium.** Recent (2024–2026) years are a single
  well-structured landing page per year with agenda + minutes + video rows.
  Going back further requires per-year page navigation, and filename patterns
  are not fully consistent across eras.

---

## 2. Transportation Commission (Complete Streets Commission)

- **Name:** Menlo Park does **not** have a body called "Transportation
  Commission" today. The functional equivalent is the **Complete Streets
  Commission**, formed in 2017 by merging the former Bicycle Commission and
  Transportation Commission (confirmed via Almanac News coverage of the 2017
  reorganization). There is a Public Works "Transportation Division" (staff,
  not a commission) at
  https://www.menlopark.gov/Government/Departments/Public-Works/Transportation-Division.
- **URL (current, primary):** https://www.menlopark.gov/Agendas-and-minutes
  (Complete Streets Commission section), with per-year archive pages, e.g.
  confirmed PDF paths:
  - https://www.menlopark.gov/files/sharedassets/public/v/1/agendas-and-minutes/complete-streets-commission/2025-meetings/agendas/20250910-csc-agenda_original.pdf
  - https://www.menlopark.gov/files/sharedassets/public/v/1/agendas-and-minutes/complete-streets-commission/2023-meetings/minutes/20230913-csc-regular-minutes.pdf
  - https://www.menlopark.gov/files/sharedassets/public/v/1/agendas-and-minutes/complete-streets-commission/2022-meetings/agendas/20221214-complete-streets-commission-agenda.pdf
- **Secondary/video platform:** Granicus video/agenda viewer at
  https://menlopark.granicus.com/ViewPublisher.php?view_id=6 — **note:**
  `view_id=6` on that Granicus instance resolves to **City Council** video
  archives (confirmed by fetch), not Complete Streets Commission, despite an
  earlier search hit
  (`https://menlopark.granicus.com/AgendaViewer.php?view_id=6&clip_id=2066`)
  surfacing under a Complete Streets Commission search query. Do not assume
  `view_id=6` is the Complete Streets Commission channel — the correct
  `view_id` for Complete Streets Commission was **not confirmed** in this
  research pass and should be checked live (likely a different low integer;
  Granicus assigns one `view_id` per body).
- **Archive depth:** Confirmed PDF minutes/agendas back to at least **2022**;
  the commission itself has only existed since 2017, so full archive depth is
  bounded by that reorg date rather than an earlier Planning-Commission-style
  archive.
- **Access notes:** Same Granicus/OpenCities static-PDF structure as Planning
  Commission, no login wall observed. Directory pattern:
  `/files/sharedassets/public/v/1/agendas-and-minutes/complete-streets-commission/<year>-meetings/{agendas,minutes}/YYYYMMDD-csc-....pdf`.
- **Est. pull effort:** **Low–Medium**, same caveats as Planning Commission
  re: per-year landing pages vs. filename guessing.

---

## 3. Recently Adopted Ordinances / Housing-Related Municipal Code Updates

- **Name:** City of Menlo Park Municipal Code (housing/zoning-relevant
  chapters) + Ordinance List and Disposition Table
- **URL (official code host):** https://ecode360.com/ME4536 — this is the
  link the city's own footer "Municipal code" quick-link points to
  (confirmed via fetch of
  https://www.menlopark.gov/Site-Footer/Footer-Widgets/Quick-links/Municipal-code,
  which resolves to `https://ecode360.com/ME4536/home`). This is **General
  Code's eCode360 platform, not Municode**. A `codepublishing.com/CA/MenloPark/`
  page also surfaced in search but returned HTTP 403 on fetch and is not
  confirmed as an actively maintained alternate host — do not treat it as
  canonical without live verification.
  - Relevant sub-pages found by search (titles confirmed, not fully re-fetched
    for content): "Title 16: Zoning" (`https://ecode360.com/47185712`),
    "Title OL: Ordinance List and Disposition Table"
    (`https://ecode360.com/47199918`) — the latter is the most direct path to
    a chronological list of adopted ordinances including housing/zoning
    amendments.
  - Housing-element zoning chapters cited in secondary sources: Chapters
    16.96–16.99 (housing programs / density bonus), sections 16.98.050–.060
    (FAR/height/parking incentives) — cited via Municode-adjacent secondary
    aggregator (GoCodebook), **not independently verified against the primary
    eCode360 text** in this pass.
  - The code was reported (via search snippet, not a primary fetch — eCode360
    blocked WebFetch with HTTP 403) as **"current through Ordinance 1120,
    passed November 19, 2024."** Treat this as unverified-but-plausible; a
    live session should confirm the "current through" banner on the eCode360
    homepage directly.
- **City Council ordinance-adoption source documents (primary, confirmed
  PDFs, useful for the housing-element/zoning-amendment paper trail):**
  - https://www.menlopark.gov/files/sharedassets/public/v/1/agendas-and-minutes/city-council/2025-meetings/20251104/j1-20251104-cc-building-standards-code-amend-adoption.pdf
  - https://www.menlopark.gov/files/sharedassets/public/v/1/agendas-and-minutes/city-council/2025-meetings/20251104/j3-20251104-cc-determination-of-action-ec-9515.pdf
- **2025/2026 anti-housing ballot measure (downtown parking-lot initiative):**
  **Correction to the task framing** — this is a **November 3, 2026** ballot
  measure, not a "2025" measure; it qualified for the ballot via City Council
  action in **December 2025** after a citizen signature drive launched in
  **May 2025**. I could not confirm a Municode/city-clerk-hosted page with the
  literal certified ballot-measure TEXT (the full initiative ordinance
  language) via search — what is confirmed are news accounts of its
  substance and one primary city document:
  - https://www.menlopark.gov/files/sharedassets/public/v/1/agendas-and-minutes/city-council/2025-meetings/20251104/j3-20251104-cc-determination-of-action-ec-9515.pdf
    (City Attorney "Determination of Action — EC-9515" staff report; this is
    the closest primary-source document found and likely contains or
    references the initiative's operative text/summary — needs a live read to
    confirm).
  - Secondary coverage confirming substance/date/status:
    - https://www.almanacnews.com/menlo-park/2025/12/04/menlo-park-ballot-measure-on-downtown-parking-lot-housing-heads-to-voters-in-2026/
    - https://localnewsmatters.org/2025/12/09/menlo-park-measure-limiting-housing-on-downtown-parking-lots-heads-to-next-years-ballot/
    - https://inmenlo.com/2025/12/04/update-citizen-initiated-measure-downtown-parking-plazas-ordinance/
    - https://transformca.org/transform-opposes-anti-housing-measure-in-menlo-park/
  - **No official measure letter (e.g. "Measure X") was confirmed** — do not
    cite a measure letter/number without live confirmation from the San Mateo
    County Elections Office or the City Clerk's certified resolution.
- **Builder's Remedy context (2024–2025), primary/near-primary sources:**
  - HCD technical assistance letter re: 80 Willow Road:
    https://www.hcd.ca.gov/sites/default/files/docs/planning-and-community/HAU/menlo-park-hau-1138-ta-112624.pdf
  - Secondary reporting: https://www.paloaltoonline.com/news/2025/03/24/city-seeks-allies-for-effort-to-blunt-builders-remedy/
    and https://www.almanacnews.com/menlo-park/2025/12/29/looking-back-at-a-consequential-year-in-menlo-park/
- **Access notes:** eCode360 returned HTTP 403 to the automated WebFetch tool
  (likely bot/JS-challenge gating, not a true login wall — eCode360 is
  normally public-read). A human-in-the-loop browser session should expect a
  possible interstitial or slow initial load, not a credentialed login.
  menlopark.gov PDF documents had no access barrier.
- **Est. pull effort:** **Medium–High.** The municipal code text itself is
  behind a bot-hostile front end (403 to automated fetch); the ordinance
  list/disposition table is a good confirmed entry point but wasn't rendered
  in this pass; the ballot-measure literal text was not locatable via search
  and will need a targeted city-clerk-site or county-elections-site visit.

---

## 4. Login Walls / CAPTCHA / Pagination Notes for a Human+Browser Session

- **menlopark.gov (Granicus/OpenCities):** No login wall or CAPTCHA
  encountered. Static PDFs under predictable per-year, per-body directories.
  Main friction is that filename conventions changed across eras (e.g.
  `-pc-approved-minutes.pdf` in 2024 vs `-planning-minutes.pdf` in 2003), so
  don't assume one glob pattern covers all years — browse each year's landing
  page rather than guessing filenames past ~2020.
- **menlopark.org (legacy CivicEngage AgendaCenter):** Appears to be an older
  parallel/legacy site (`AgendaCenter/11` etc.) — may be stale or partially
  redirect to menlopark.gov. Worth a quick check but not the primary target.
- **ecode360.com (Menlo Park Municipal Code):** Returned HTTP 403 to the
  automated fetch tool used in this research pass — this is consistent with
  eCode360's known bot/JS-challenge behavior on some municipal instances, not
  a true credential login. A real browser session should load normally; if a
  Cloudflare-style interstitial appears, wait it out rather than treating it
  as an auth wall.
- **codepublishing.com/CA/MenloPark/:** Also returned HTTP 403 to automated
  fetch. Unclear if this is a stale/duplicate host or actively bot-gated —
  verify live before relying on it; eCode360 is the city's own confirmed
  canonical link.
- **Granicus video viewer (menlopark.granicus.com):** No login wall observed,
  but `view_id` parameters are per-body and were only confirmed for City
  Council (`view_id=6`). Do not reuse that `view_id` for Complete Streets
  Commission or Planning Commission without checking the actual link on the
  page — click through from menlopark.gov rather than hand-constructing
  Granicus URLs.
- **No CAPTCHA was encountered** on any menlopark.gov page in this research
  pass. No pagination issue noted on the Agendas-and-minutes landing page
  itself (it appears to list a full year per page, not paginate meetings).

---

## Pull Plan

Ordered list of exact pages for a human+browser-extension session to visit
first, to grab the most recent 6–12 months of agendas plus the
adopted-ordinance list:

1. https://www.menlopark.gov/Agendas-and-minutes — start here; grab current
   (2026) Planning Commission and Complete Streets Commission meeting rows
   directly (agenda + minutes + video links for each recent meeting).
2. https://www.menlopark.gov/Agendas-and-minutes/Previous-Planning-Commission-agendas-and-minutes/2025-Planning-Commission-agendas-and-minutes
   — fills in the remainder of the trailing 12 months not shown on the main
   page.
3. Complete Streets Commission equivalent previous-year page (follow the
   "Previous Complete Streets Commission agendas, minutes and staff reports"
   link from step 1's page — exact URL slug not independently confirmed in
   this pass, follow the live link rather than guessing it).
4. https://ecode360.com/ME4536 (or the live link now shown at
   https://www.menlopark.gov/Site-Footer/Footer-Widgets/Quick-links/Municipal-code
   if it has changed) — load the Municipal Code home, confirm the "current
   through Ordinance ___" banner, then drill into:
5. https://ecode360.com/47199918 — Title OL: Ordinance List and Disposition
   Table (chronological ordinance list — the fastest path to "recently
   adopted ordinances").
6. https://ecode360.com/47185712 — Title 16: Zoning (for the housing/density
   chapters, incl. 16.96–16.99 density bonus provisions, to be verified live).
7. https://www.menlopark.gov/files/sharedassets/public/v/1/agendas-and-minutes/city-council/2025-meetings/20251104/j3-20251104-cc-determination-of-action-ec-9515.pdf
   — City Attorney determination re: the downtown parking-lot ballot
   initiative (EC-9515); likely the best primary-source anchor for the
   initiative's operative text/history.
8. https://www.menlopark.gov/files/sharedassets/public/v/1/agendas-and-minutes/city-council/2025-meetings/20251104/j1-20251104-cc-building-standards-code-amend-adoption.pdf
   — companion Nov 4, 2025 Council item adopting a building-standards code
   amendment (housing-adjacent).
9. San Mateo County Registration & Elections site (URL not confirmed in this
   pass — search live) — to obtain the certified ballot-measure letter/number
   and official question text for the Nov. 3, 2026 downtown-parking-lots
   initiative, since this was not locatable via WebSearch/WebFetch alone.
10. https://www.hcd.ca.gov/sites/default/files/docs/planning-and-community/HAU/menlo-park-hau-1138-ta-112624.pdf
    — state HCD technical-assistance letter on the 80 Willow Road Builder's
    Remedy application, for the Builder's-Remedy-response thread.
