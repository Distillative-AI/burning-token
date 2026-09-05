# Daly City, CA — Civic Data Sources

Compiled via WebSearch/WebFetch only (no live browser session). Where a URL or fact could
not be independently confirmed by fetch, this is stated explicitly rather than guessed.

---

## 1. Planning Commission — Agendas & Minutes

- **Name:** Daly City Planning Commission
- **URL (current portal):** https://dalycityca.portal.civicclerk.com/
  - Direct commission landing page: https://www.dalycity.org/369/Planning-Commission
  - General agenda index page: https://www.dalycity.org/942/Agendas-Meetings (dropdown includes
    "Planning Commission")
  - A specific CivicClerk event example surfaced in search: https://dalycityca.portal.civicclerk.com/event/2609/files
    (WebFetch could not resolve full page contents for this event — only the bare portal title
    was retrievable via WebFetch, likely because CivicClerk renders via client-side JS that a
    non-browser fetch can't execute. **Confirm live in a real browser session.**)
  - Underlying CivicClerk API observed in search results (used by agenda-report PDF links):
    `https://dalycityca.api.civicclerk.com/v1/Meetings/GetMeetingFileStream(fileId=...,plainText=false)`
- **Legacy/historical portal:** https://www.dalycity.org/1067 — the Planning Commission page states
  verbatim: *"For Agendas older than 08/2021 please visit Historical Agendas"* linking to this page.
  This means the CivicClerk portal's practical archive depth is **from ~August 2021 to present**;
  anything older lives on the separate legacy CivicEngage/CivicPlus document page at `/1067`.
- **Platform:** CivicClerk (current, ~2021–present) backed by CivicPlus-hosted `dalycity.org`
  (CivicEngage) for the legacy archive and general site chrome.
- **Archive depth:** Confirmed ~August 2021 onward on CivicClerk; older minutes/agendas archived
  separately at dalycity.org/1067 (depth beyond that unconfirmed — not fetched).
- **Access notes:** No login was reported as required to browse CivicClerk agenda listings in
  search-result summaries. WebFetch (non-browser) could not render actual CivicClerk event
  content — pages appear to be JS-rendered SPAs — so a live/human-in-the-loop browser session is
  required to actually read agenda items and download minutes, not just search-snippet text.
  Agenda report PDFs (e.g. `dalycityca.api.civicclerk.com/v1/Meetings/GetMeetingFileStream(...)`)
  are directly linkable and appear to be plain PDF downloads once you have the correct `fileId`.
- **Est. pull effort:** Medium. Need a live browser to enumerate `event/{id}/files` pages (IDs are
  sequential/opaque, not calendar-addressable from outside), then bulk-download PDF file streams.
  Plan on 1 browser session to walk the meeting list + collect fileIds for 6–12 months, then
  script the PDF fetches by fileId once IDs are known.

## 2. Transportation Commission (or equivalent)

- **Finding: Daly City does NOT appear to have a standing "Transportation Commission" as a
  distinct body.** Multiple targeted searches (site-scoped to dalycity.org and the CivicClerk
  portal) surfaced no dedicated Transportation Commission page, agenda index, or sitemap entry.
  The boards/commissions actually enumerated on the city's "Meetings & Agendas" dropdown
  (https://www.dalycity.org/942/Agendas-Meetings) are:
  - Arts and Culture Commission
  - City Council (Regular / Closed Session / Special Meetings)
  - Personnel Board
  - Planning Commission
  - Library Board of Trustees
  - Recreation Commission
  - Small Business Commission
  - (Separately, the Agenda Center at dalycity.org/agendacenter also lists: Daly City Youth
    Advisory Committee, Housing Development Finance Agency, HR Personnel Board)
- **Closest equivalent found:** Transportation-related governance in Daly City appears to run
  through regional/interagency bodies rather than a local commission:
  - City/County Association of Governments of San Mateo County (C/CAG) — regional transportation
    planning body Daly City participates in (see Daly City Community-Based Transportation Plan,
    published via C/CAG: https://ccag.ca.gov/wp-content/uploads/2024/06/Daly_City_CBTP_9-14-2023_Optimized_Accessible.pdf)
  - City's own "Transportation" informational/resource page (not a commission, no agendas):
    https://www.dalycity.org/743/Transportation and https://www.dalycity.org/553/Transportation
- **Do NOT fabricate a Transportation Commission URL.** If a Transportation Commission exists
  under a different name (e.g. folded into Planning Commission agenda items, or a defunct/renamed
  body), that was not found in this pass — **flag for a live-browser confirmation pass** (try the
  CivicClerk portal's own "Boards" filter directly, which a non-JS fetch could not enumerate).
- **2026-09-05 follow-up search (targeted "proposed"/"dissolved" city council minutes query):**
  turned up nothing — no city council minutes, agenda item, or news mention of a Transportation
  Commission ever being proposed, created, or dissolved in Daly City. Results were generic
  city-meeting/agenda-portal links only (dalycity.org/129, dalycity.org/agendacenter,
  dalycity.org/942, dalycity.org/409, LAFCo's county page, YouTube channel, Facebook page) — none
  referencing a Transportation Commission by name in either direction. This session's WebSearch
  budget was exhausted before a `site:dalycity.org "Transportation Commission"` scoped query
  could also be run — that specific query is still outstanding and worth one more try in a fresh
  session, but on current evidence (board-dropdown enumeration in §1 above + this negative
  search) **the "no standing Transportation Commission" finding stands, upgraded from
  "not found" to "actively searched for evidence of creation/dissolution and found none."**
- **Est. pull effort:** Low-to-none until existence is confirmed; if it turns out transportation
  items are handled as Planning Commission agenda line items, fold this into source #1's pull.

## 3. Recently Adopted Ordinances — Ch. 17.45 Design Review & 5-Year Permit Validity

- **Name:** Zoning Code Amendments — Chapters 17.44 (Use Permits), 17.45 (Design Review), and
  related sections (building-height definitions, landscaping/triangular sight-area requirements,
  condominium use-permit exemption under 17.37.030)
- **Status — RESOLVED 2026-09-05 via direct PDF text extraction (`pdftotext`, not WebFetch's
  markdown pipeline — WebFetch itself still cannot decode these PDFs; `curl` + `pdftotext` worked
  cleanly on all three source PDFs below).**
  - **Application / case number (confirmed, primary source):** Zoning Change **ZC-02-26-017000**,
    Citywide (all City parcels), Project Planner Sam Fielding, Associate Planner.
  - **Planning Commission public hearing:** **March 3, 2026** (not March 4 — the staff report's
    own header says "Meeting Date: March 3, 2026"; the March 4 date in earlier secondary
    reporting appears to be an off-by-one error in that source, or a hearing continued to a
    second night — flag as the corrected date per the primary staff report).
  - **Ordinance introduced by City Council:** **March 23, 2026** (confirmed directly from the
    Ordinance Summary PDF's own certification block, signed by City Clerk K. Annette Hipona,
    dated March 23, 2026).
  - **Second reading / adoption:** **scheduled for April 13, 2026** — stated verbatim in the
    Ordinance Summary: *"This ordinance was introduced by the Daly City City Council on March 23,
    2026 and scheduled for second reading and adoption on April 13, 2026."* This is a *scheduled*
    date confirmed from the primary summary document itself, not secondary reporting — but it is
    still a forward-looking schedule statement as of the document's March 23, 2026 dateline, not
    a post-hoc adoption confirmation. **A council minutes/agenda check for April 13, 2026 (or the
    next regular meeting) is still needed to confirm the ordinance actually passed second reading
    on that date and to capture the assigned ordinance number** (the Ordinance PDF itself has
    "ORDINANCE NO." left blank — numbers are typically assigned only upon final adoption).
  - **No ordinance number has been assigned/published as of this pass** — both source PDFs show
    a blank "ORDINANCE NO." field. Do not cite a number; it does not yet exist in the sourced
    documents.
- **Key substantive changes — CONFIRMED against full ordinance text (§17.44.010, §17.34.050,
  §17.37.030, §17.44.100, §17.45.150 all read verbatim from the ordinance PDF):**
  - **Use Permit (Ch. 17.44.100) and Design Review (Ch. 17.45.150) expiration extended to
    5 YEARS from date of approval** (confirmed from the ordinance's own operative text: *"A use
    permit granted...shall be automatically terminated if not used within five years from the
    date of approval"*). This resolves the earlier ambiguity between the staff report's originally
    *proposed* 3-year figure and secondary reporting's "5-year" headline: **the final ordinance
    text as drafted for the March 23, 2026 introduction reflects 5 years, not 3** — i.e. the
    Planning Commission's amendment (extending staff's 3-year proposal to 5 years) was carried
    into the drafted ordinance.
  - Time-extension window: confirmed via staff report as a proposed change from 6 months to
    **2 years** for a City-Council-granted extension after expiration (staff-report language;
    the operative ordinance text extracted did not repeat this specific clause verbatim in the
    portion captured, so treat the 2-year figure as staff-report-confirmed but not yet
    cross-checked against the final codified extension clause).
  - Condominium subdivisions: Ch. 17.37.030 amended to require use permit + subdivision map only
    for "conversions, stock cooperatives, community apartments of communal ownership" — new
    section title explicitly reads "(not including condominiums)," confirming condominiums
    allowed by-right without a use permit, per the ordinance text itself.
  - Ch. 17.34.050 (front-yard paving): triangular-shaped landscaping requirement for paving that
    adds a parking space, and a new prohibition on side-yard paving on corner lots — both
    confirmed verbatim in the ordinance text.
  - Ch. 17.04.010: building-height definition re-added for all buildings NOT in the Commercial
    Mixed-Use (C-MU) zone (inadvertently dropped when C-MU was created in the 2025 General Plan
    amendment, per staff report's own explanation) — confirmed verbatim.
  - Framed explicitly (staff report's own "Discussion" section) as implementing the City's 2024
    Housing Element commitment to reduce discretionary-review barriers to residential
    development — this causal link is now primary-source-confirmed, not inferred.
- **Primary-source URLs — CONFIRMED READABLE (2026-09-05) via `curl -A "<browser UA>" | pdftotext`:**
  - Ordinance summary PDF (fully extracted, human-readable):
    https://dalycity.org/DocumentCenter/View/12946/Amending-Ch-17-of-Municode-Zoning-Change-Ordinance-Sum1?bidId=
  - Full ordinance text PDF (fully extracted, human-readable — deflate-compressed PDF, opaque to
    WebFetch's markdown pipeline but trivial for `pdftotext`):
    https://www.dalycity.org/DocumentCenter/View/12902
  - Planning Commission agenda/staff report for the March 3, 2026 hearing (fully extracted via
    the same `curl`/`pdftotext` approach, NOT via WebFetch which reported it as
    undecodable binary):
    https://dalycityca.api.civicclerk.com/v1/Meetings/GetMeetingFileStream(fileId=5220,plainText=false)
  - Secondary reporting (unchanged, still useful for narrative context, still not the record of
    adoption): https://citizenportal.ai/articles/7619983/california/san-mateo-county/daly-city/daly-city-planning-panel-backs-minor-zoning-code-changes-extends-permit-life-to-five-years
    — re-fetched 2026-09-05: confirms the March 4, 2026 Planning Commission vote to recommend
    approval, but does not itself state an ordinance number, adoption date, or chapter list
    (those all now come from the primary PDFs above instead).
- **Tooling note for future pulls:** WebFetch's markdown-conversion pipeline could NOT decode any
  of these three Daly City PDFs (reports "binary/compressed data"), but a plain `curl` (with a
  standard browser `User-Agent` header — required, a bare `curl` without one may be blocked/
  redirected) piped to `pdftotext` decoded all three cleanly with zero manual intervention. This
  is a superior alternative to a live-browser session for any DocumentCenter/CivicClerk PDF that
  WebFetch reports as undecodable — try this BEFORE escalating to human-in-the-loop browser time.
- **Municode current codified text (for Ch. 17.45 as currently published — will NOT yet reflect
  the 2026 amendment until/unless the April 13, 2026 second reading passes and Municode's
  update cadence catches up):**
  https://library.municode.com/ca/daly_city/codes/code_of_ordinances?nodeId=TIT17ZO_CH17.45DERE
  — still returns HTTP 403 to WebFetch (2026-09-05 retry not attempted again this pass since the
  ordinance number/dates question is now resolved via the primary PDFs above); still requires a
  live/human browser session if codified-text cross-check is wanted.
- **Remaining explicit gap:** (a) the ordinance number itself (not yet assigned in any sourced
  document — will only exist post-adoption), (b) confirmation that the April 13, 2026 second
  reading actually occurred and passed (the summary PDF only states it was *scheduled*), and
  (c) the effective date (California general-law cities: ordinances typically take effect 30 days
  after adoption, i.e. ~May 13, 2026 if adopted April 13 — this is a standard-pattern inference,
  NOT confirmed against Daly City's own municipal code effective-date provision in this pass).
- **Est. pull effort:** LOW now for the substantive ordinance content (fully resolved via
  `curl`+`pdftotext`, no browser needed). Still LOW-MEDIUM for the one remaining gap — a single
  City Council agenda/minutes check for April 13, 2026 (or whatever meeting the second reading
  actually happened at) to get the ordinance number and confirm final adoption.

## 4. Login Walls, CAPTCHA, Pagination Quirks (for human-in-the-loop browser session)

- **dalycity.org (CivicEngage/CivicPlus, legacy + general site):** No login required to browse
  agendas/minutes or DocumentCenter PDFs. A Google reCAPTCHA was observed on at least one public
  **comment-submission form** (not on read-only agenda browsing) at dalycity.org/942 — irrelevant
  unless a form is submitted.
- **dalycityca.portal.civicclerk.com (current agenda/minutes system, Planning Commission and
  presumably other current bodies):** No login was indicated as required for public viewing.
  However, the site is a JavaScript-rendered SPA — plain WebFetch could not extract meeting
  content, only the bare page title ("Public Portal • CivicClerk"). A **live browser session is
  mandatory** to walk event lists, open `event/{id}/files`, and download individual PDFs.
  Event IDs (e.g. `2609`, `1892` seen in search) appear to be opaque sequential integers, not
  calendar/date-addressable — pagination through the meeting list itself (likely infinite-scroll
  or a "load more"/date-range picker) will need to be walked by the browser session; no direct
  date-to-URL mapping was discoverable via search/fetch alone.
- **dalycityca.api.civicclerk.com (underlying API):** Direct `GetMeetingFileStream(fileId=...)`
  URLs return raw PDF and appear fetchable without a browser once the numeric `fileId` is known
  (this pattern was returned directly in search results) — useful as a bulk-download shortcut
  IF fileIds can be enumerated from the portal UI first.
- **library.municode.com (codified ordinance text):** Returned **HTTP 403 Forbidden** to the
  automated WebFetch tool — Municode appears to actively block non-browser user agents. This
  absolutely requires the live/human-in-the-loop browser session; do not rely on automated
  fetch for Municode.
- **PDF text-extraction limitation (tooling, not a site quirk):** Several DocumentCenter PDFs
  (ordinance text, ordinance summaries) returned as compressed/binary PDF streams that the
  WebFetch markdown-conversion pipeline could not decode into readable text. This is a tool
  limitation, not a site access wall — a live browser (or a dedicated PDF-text extraction step)
  will read these fine.
- **No CAPTCHA was observed gating read-only agenda/minutes/ordinance access anywhere** in this
  pass; the only reCAPTCHA found was on the public-comment submission form.

---

## Pull Plan (ordered, for the live-browser human-in-the-loop session)

1. **dalycityca.portal.civicclerk.com** → Planning Commission board filter → list meetings for
   the last 6–12 months → open each meeting's `event/{id}/files` page → download agenda + minutes
   PDFs (or note fileIds for bulk API pull via `GetMeetingFileStream`).
2. **dalycity.org/369/Planning-Commission** → confirm the "Historical Agendas" link
   (dalycity.org/1067) only needs to be visited if the 6–12 month window crosses the ~Aug 2021
   CivicClerk cutover (it will not, for a 6–12 month window from 2026).
3. **dalycity.org/942/Agendas-Meetings** → open the board/commission dropdown live to get the
   authoritative current list of bodies (confirm/deny the Transportation Commission finding from
   this pass; check specifically whether transportation matters route through Planning Commission
   agenda items or a body not surfaced by search).
4. ~~**dalycity.org/DocumentCenter/View/12946** (ordinance summary PDF)~~ — **DONE 2026-09-05**,
   resolved via `curl` (browser User-Agent) + `pdftotext`, no browser needed. Full text extracted;
   see §3 above. Confirms introduction March 23, 2026 / second reading scheduled April 13, 2026.
5. ~~**dalycity.org/DocumentCenter/View/12902** (ordinance PDF)~~ — **DONE 2026-09-05**, same
   `curl`+`pdftotext` approach; full operative ordinance text extracted (5-year expiration,
   condominium use-permit exemption, front-yard paving, building-height definition — all
   confirmed verbatim). See §3 above.
6. ~~**dalycityca.api.civicclerk.com/v1/Meetings/GetMeetingFileStream(fileId=5220,plainText=false)**~~
   — **DONE 2026-09-05**, same approach; confirms case number ZC-02-26-017000, March 3, 2026
   hearing date (not March 4), staff's original 3-year proposal (superseded by 5-year in the
   final ordinance text per Planning Commission's amendment). See §3 above.
7. **library.municode.com/ca/daly_city/codes/code_of_ordinances?nodeId=TIT17ZO_CH17.45DERE**
   (and the 17.44 Use Permits chapter) — STILL OUTSTANDING, still 403 to WebFetch. Open in a live
   browser (Municode blocks automated fetch) once the April 13, 2026 second reading has occurred,
   to check whether the codified text has been updated and capture the assigned ordinance number
   from Municode's own amendment-history footer if City Clerk records lag.
8. **City Council agenda/minutes** (via dalycity.org/942, "City Council" filter) for the
   **April 13, 2026** meeting specifically (per the ordinance summary's own stated second-reading
   schedule — corrected from this plan's earlier guess of "~2 weeks after March 23") — this is
   now the single highest-priority remaining pull: confirms whether second reading passed as
   scheduled, and yields the assigned ordinance number (blank in both source PDFs pre-adoption).
9. **NEW:** `site:dalycity.org "Transportation Commission"` — a scoped WebSearch query that was
   planned but not run this pass (session WebSearch budget was exhausted); run this first in the
   next research session before assuming the "no Transportation Commission" finding is final —
   current confidence is "actively searched, found no creation/dissolution evidence" rather than
   "exhaustively ruled out."
