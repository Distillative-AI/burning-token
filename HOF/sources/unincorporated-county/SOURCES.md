# Sources — Unincorporated San Mateo County (Planning & Building Dept.)

Compiled via WebSearch/WebFetch only (no live browser session used). Confirmed URLs are
marked; anything not directly verified by fetch/search is flagged **UNCONFIRMED**.

---

## 1. Planning Commission — Agendas & Minutes

**Name:** San Mateo County Planning Commission
**URL (current/landing page):** https://www.smcgov.org/planning/planning-commission
**URL (per-hearing pages, pattern):** `https://www.smcgov.org/planning/event/planning-commission-hearing-<month>-<day>-<year>` (confirmed live examples: `.../planning-commission-hearing-january-28-2026`, `.../planning-commission-hearing-february-11-2026`, `.../planning-commission-hearing-october-22-2025`, `.../planning-commission-hearing-november-12-2025`, `.../planning-commission-hearing-may-14-2025`)
**URL (current-year schedule):** https://www.smcgov.org/planning/current-years-schedule-planning-commission-hearings
**URL (archive landing, redirects):** `https://planning.smcgov.org/planning-commission-meeting-archive` — this legacy subdomain URL now issues a **301 redirect to `https://www.smcgov.org/planning`**, so the exact archive index page is not directly resolvable at that address anymore.
**URL (archive landing, CONFIRMED this pass, 2026-09-05):** `https://www.smcgov.org/planning/planning-commission-meeting-archive` — resolved by fetching the live `smcgov.org/planning/planning-commission` page directly and extracting the actual href behind the "Archive of Past Hearings" link text ("View past agendas, staff report packets, and minutes for hearings older than the current year and starting from 2013"). This is the current host (`www.smcgov.org`, not the legacy `planning.smcgov.org` subdomain) — use this URL going forward. Not independently re-fetched as a standalone page in this pass (only extracted as a link target from the parent page), so treat the page's own HTTP 200 status as still to be double-checked, but the URL/host itself is confirmed correct and current.
**Secondary system (Legistar):** https://sanmateocounty.legistar.com/ (Calendar), Planning Commission department page: `https://sanmateocounty.legistar.com/DepartmentDetail.aspx?ID=36449&GUID=67477201-FF07-4F9A-89C4-F947BBE329E5` — Legistar holds legislative/board items referencing Planning Commission actions (e.g. appeals of PC decisions), not necessarily PC's own agenda/minutes packets — treat as a supplementary cross-reference, not the primary PC agenda source.
**Secondary system (Granicus, board roster/member info):** https://sanmateocounty.granicus.com/boards/w/1adda2d08e9b063b/boards/17378

**Access notes:** Public, no login/paywall observed on `smcgov.org` pages fetched. Individual hearing pages carry both the Agenda and the prior meeting's Minutes as linked PDFs (`/media/<id>/download` pattern). No CAPTCHA encountered on fetch. Pagination is by individual event page (one URL per hearing date) rather than a single scrollable table — a bulk pull means enumerating hearing-date URLs, either from the current-year schedule page or the pre-2013+ archive index.

**Archive depth:** Per the Planning Commission landing page text (as fetched): archive of "past agendas, staff report packets, and minutes for hearings older than the current year" **starting from 2013** — i.e. ~13 years of historical PC hearing records, assuming the archive index (currently redirect-obscured) is reachable in a live browser session.

**Est. pull effort:** Low-medium for 6–12 months (12–24 individual hearing pages at 2/month cadence — 2nd/4th Wednesday, 9:00 AM, 500 County Center Board Chambers); medium-high if going deeper into the 2013+ archive since each year requires index navigation once the archive page's real (post-redirect) URL is confirmed live.

---

## 2. Transportation-Relevant Commission — San Mateo County Transportation Authority (SMCTA)

**Name:** San Mateo County Transportation Authority (Board of Directors) — the county-level transportation-relevant authority; operates jointly with SamTrans/San Mateo County Transit District governance.
**URL (main site):** https://www.smcta.com/
**URL (meeting info, could not be fetched — returned 404 on this attempt):** https://www.smcta.com/whats-happening/meeting-information — still 404s on direct fetch as of this pass, but the link target itself was independently confirmed by fetching the parent `https://www.smcta.com/whats-happening` page, whose nav links to this exact same path (`/whats-happening/meeting-information`) under both "Meeting Information" and "Meeting Calendar" link text — so the path is real (linked from the current live site), the 404 is likely a fetch-tool/redirect quirk (e.g. JS-rendered content, or requires a session/referrer) rather than a stale/moved URL. Re-verify in a live browser session.
**URL (agenda-management platform — CONFIRMED and RESOLVED this pass, 2026-09-05):** `https://smctd.hylandcloud.com/ta` — this is the Hyland Cloud "OnBase Agenda Online" platform referenced as "our agenda management platform" for 2023+ Board agendas. Directly fetched and **confirmed publicly accessible with no login wall** — the live page displayed real upcoming/recent SMCTA Board of Directors meetings (10/7/2026 upcoming; 9/3/2026 and 8/6/2026 recent, each with downloadable agenda + full packet PDFs). This resolves the previously-unconfirmed "Hyland Cloud" auth question: **no auth required for public agenda/packet viewing.**
**URL (individual meeting pages, pattern, confirmed live):** `https://www.smcta.com/meetings/<year>/<month>/ta-board-directors` (example confirmed: `.../meetings/2025/11/ta-board-directors`) and `https://www.smcta.com/meetings/2019/09/smcta-board-meeting`
**URL (agenda PDFs, confirmed live examples):** `https://www.smcta.com/media/4120/download`, `https://www.smcta.com/media/37413/download`, `https://www.smcta.com/media/4357/download`
**URL (legacy Granicus mirror, confirmed live):** `https://samtrans.granicus.com/AgendaViewer.php?view_id=2&clip_id=103` and `...&clip_id=1428` — SMCTA/SamTrans agendas were historically hosted on Granicus under the SamTrans account before smcta.com's own platform.

**Access notes:** TA Board meets first Thursday of the month, 5:00 PM, San Mateo County Transit District Administrative Building, 1250 San Carlos Ave., San Carlos. TA Citizens Advisory Committee (CAC) meets the preceding Tuesday, 4:30 PM, same location. No CAPTCHA/login observed on public pages fetched. **Archive-platform transition — RESOLVED this pass:** the 2023+ agenda-management platform is `https://smctd.hylandcloud.com/ta` (Hyland Cloud "OnBase Agenda Online"), confirmed publicly accessible with no login wall (see Section 2 URL list above) and showing live 2026 meeting agendas/packets. Pre-2023 materials remain on the main smcta.com site and older records are mirrored on the legacy `samtrans.granicus.com` Granicus instance. A 6–12 month pull should use the Hyland Cloud platform directly as the primary current source.
**Note on C-CAG:** City/County Association of Governments of San Mateo County (C-CAG) is the other transportation/land-use-adjacent joint powers body named in the task; **not independently verified in this pass** — no URL fetched or confirmed for C-CAG's own agenda portal. Flagging as **UNCONFIRMED / needs separate lookup** (likely `ccag.ca.gov`, unverified).

**Est. pull effort:** Low for 6–12 months if the 2023+ agenda-management platform is a plain public list (needs live confirmation); medium if it turns out to gate behind the Hyland Cloud portal's own auth.

---

## 3. Recently Adopted Ordinances / Zoning Text Amendments — Housing-Related

### 3a. North Fair Oaks Community Plan zoning (R-1/S-73 and related combining districts)
**URL:** https://www.smcgov.org/planning/north-fair-oaks-related-zoning-documents
**Confirmed content:** Page states the final zoning ordinances implementing the North Fair Oaks Community Plan "were adopted by the County Board of Supervisors on July 23, 2019, and took effect on August 23, 2019." Linked ordinance/document PDFs confirmed on the page include CMU-3, M-1/NFO, and M-1/Edison/NFO documents (`/media/104281/download`, `/media/104286/download`, `/media/104291/download`). **The specific "R-1/S-73" combining-district text was NOT directly visible in the fetched page content** — S-73 is referenced in County zoning-regulations PDFs (e.g. section 6300.4.13/6300.4.15 per search-result summaries of the county's Zoning Regulations document) but the exact adopting-ordinance URL for S-73 specifically is **UNCONFIRMED** — needs direct pull of the North Fair Oaks zoning documents page in a live session to enumerate all linked ordinance PDFs (the fetch above only returned a partial list).
**Zoning Regulations reference doc (contains S-73 combining district text):** https://www.smcgov.org/planning/zoning-regulations (also historically at `http://www.co.sanmateo.ca.us/Attachments/planning/PDFs/Regulations/2012_ZoneRegs[FINAL].pdf` — legacy domain, may be dead).

### 3b. Midcoast (R-1/S-17 combining district)
**URL:** https://www.smcgov.org/planning/get-zoning-information and https://www.smcgov.org/planning/zoning-regulations
**Confirmed content:** S-17 combining district ("Midcoast") is referenced at section 6300.2 of the County's Zoning Regulations document per search results, applying to Montara/Moss Beach/El Granada. **No specific recent (adoption-dated) ordinance amendment to S-17 was found or confirmed** in this pass — only static regulation-section references turned up. Any recent S-17 amendment URL is **UNCONFIRMED — not fabricated, simply not located.**

### 3c. Residential Hillside District (RH) changes
**Confirmed content (from search results only, not independently fetched):** An ordinance adopted by the Board of Supervisors on **October 8, 2024** repealed and replaced Division VI (Planning and Subdivision Regulations), Division VII (Building Regulations), and Division VIII (Natural Resources Protection) of the County Ordinance Code with a new **Title 8 – Development Code, Title 9 – Subdivision Regulations, Title 10 – Building Regulations** structure; the Residential Hillside District is now Title 8, Chapter 8.110, and explicitly allows ADUs subject to the ADU chapter.
**Likely landing pages (not directly fetched/confirmed in this pass):**
- https://www.smcgov.org/planning/county-ordinance-code
- https://www.smcgov.org/planning/county-ordinance-code-update
- https://www.smcgov.org/planning/zoning-regulations
**Ordinance text (Legistar, confirmed live link from search):** `https://sanmateocounty.legistar.com/View.ashx?GUID=F815FDBA-8FBF-4F83-9FB6-B26332B57FCD&ID=13559974&M=F` — this appeared directly in search results as an "ORDINANCE NO. ... BOARD OF SUPERVISORS, COUNTY OF SAN MATEO" document; **not independently opened/verified in this pass**, flagging as likely-correct-but-unconfirmed.

### 3d. Housing Element Update (2023–2031 cycle)
**URL (main landing):** https://www.smcgov.org/planning/san-mateo-county-housing-element-update
**URL (2023-2031 specific page):** https://www.smcgov.org/planning/san-mateo-county-housing-element-update-2023-2031
**URL (March 2024 revised draft):** https://www.smcgov.org/planning/san-mateo-county-housing-element-update-march-2024-revised-draft
**URL (current adopted-element pointer):** https://www.smcgov.org/planning/housing-element (per one fetch) / https://www.smcgov.org/housing/housing-element (per search result) — **two different paths surfaced for what may be the same or different pages; needs live disambiguation.**

**RESOLVED this pass (2026-09-05)** — the apparent conflict was NOT a hallucination; it is a
**third round** that postdates the earlier 2024/2025 sources (today's date is 2026-09-05, so an
April 2026 event is a real past event, not a future/garbled one). Confirmed via a direct
WebFetch of the primary page `https://www.smcgov.org/planning/san-mateo-county-housing-element-update-2023-2031`,
which was prompted to extract every date on the page in chronological order (not just a
snippet), yielding this full sequence:
- **January 20, 2023** — County submits draft Housing Element to HCD.
- **April 20, 2023** — HCD comment letter (requested modifications).
- **May 3 – June 9, 2023** — Public comment period (Initial Study / Negative Declaration).
- **January 2024** — Updated draft completed in response to HCD comments.
- **April 10, 2024** — Planning Commission recommends adoption.
- **April 23, 2024** — Board of Supervisors adopts (first round).
- **July 5, 2024** — HCD second comment letter requesting further changes.
- **February 5, 2025** — County resubmits to HCD.
- **March 7, 2025** — HCD determines the Housing Element "consistent with State law."
- **March 25, 2025** — Board of Supervisors re-adopts the updated Housing Element.
- **(public review through March 19, 2026)** — March 2026 draft amendments (a further round of
  amendments, not previously known to this file).
- **April 21, 2026** — Board of Supervisors adopts the further-**amended** Housing Element and
  directs submittal to HCD.
- **May 18, 2026** — HCD responds confirming the adopted Housing Element "meets the
  requirements of State law" — this is the CURRENT/latest compliance milestone as of today.
**Working conclusion:** both date chains in the original flag were correct for their own round —
2024/2025 was the original adoption/compliance cycle; April/May 2026 is a subsequent amendment
cycle (likely rezoning-program or site-inventory amendments layered onto the already-certified
2023-2031 element) that has now also been Board-adopted and HCD-certified. This was confirmed
via the primary smcgov.org page itself (not a secondary summarizer), but the specific SUBJECT
of the March 2026 amendments (what changed) was not yet extracted — that's the next open item
if downstream work needs to know what the 2026 amendment covers.
**Rezoning program of note (from Housing Element):** Program HE 11.2 — increases max density from 120 to 150 units/acre for non-coastal sites, with expedited rezoning timelines (coastal-zone sites on a separate timeline). Exact ordinance URL implementing HE 11.2 rezonings **not located/confirmed** in this pass.
**Contact for ordinance specifics (from fetched page):** William Gibson, San Mateo County Planning, 455 County Center, Redwood City, CA 94063, wgibson@smcgov.org.

### 3e. General ordinance code reference
**County Ordinance Code:** https://www.smcgov.org/planning/county-ordinance-code
**Municode mirror (confirmed live in search results):** https://library.municode.com/CA/San%20Mateo%20County/codes/code_of_ordinances?nodeId=SAN_MATEO_COORCO

---

## 4. Login Walls / CAPTCHA / Pagination Quirks — Summary for Human-in-the-Loop Browser Session

- **smcgov.org (Planning & Building pages):** No login or CAPTCHA encountered on any page fetched in this pass. Content is plain server-rendered HTML with PDF links (`/media/<id>/download` pattern) — should be scriptable/browsable without special handling.
- **planning.smcgov.org (legacy subdomain):** Issues a hard 301 redirect to `www.smcgov.org/planning` — do not hardcode this legacy host; always resolve through the redirect or use the new host directly.
- **Legistar (`sanmateocounty.legistar.com`):** Public, no login observed for viewing legislation/agenda detail pages, but the site is a heavier legacy ASP.NET app (`.aspx` endpoints with GUID/ID query params) — pagination is via search/browse forms rather than clean REST-like URLs; expect to need a live browser session (not simple WebFetch) to page through search results, since result URLs embed session-specific GUIDs.
- **Granicus (`sanmateocounty.granicus.com`, `samtrans.granicus.com`):** Public agenda/minutes viewer, no login observed; URLs embed `view_id`/`clip_id` params that must be enumerated (no simple date-based URL pattern) — a live session paging through the AgendaViewer index is needed to harvest more than the handful of `clip_id`s already confirmed.
- **smcta.com:** No login/CAPTCHA on the pages successfully fetched. The **2023+ "agenda management platform"** is `https://smctd.hylandcloud.com/ta` (Hyland Cloud "OnBase Agenda Online") — **CONFIRMED this pass to require no login** for public agenda/packet viewing; this was the single highest-priority open item and is now resolved.
- **No CAPTCHA of any kind was encountered** on any smcgov.org, smcta.com, samtrans.granicus.com, sanmateocounty.granicus.com, or sanmateocounty.legistar.com page reachable via WebFetch/WebSearch in this pass. This does not rule out a CAPTCHA appearing on a live-rendered (JS-heavy) version of a page that a text-fetch tool wouldn't trigger — flag for confirmation once a live browser session is used.
- **Pagination:** Both the County's Planning Commission hearings and SMCTA board meetings are organized as **one page per meeting date**, not a single infinite-scroll or numbered-pagination list — a 6–12 month pull is essentially "visit N known/derivable dated URLs" rather than "page through a list."

---

## Pull Plan — Ordered List of Exact Pages to Visit First (6–12 months of agendas + adopted-ordinance list)

1. `https://www.smcgov.org/planning/planning-commission-meeting-archive` — **CONFIRMED live this pass** (2026-09-05): loads successfully, shows paginated 2025 hearings (Dec 10, Nov 12, Oct 22, Oct 8 [canceled], Sep 24, Sep 10, Aug 27 [canceled], Aug 13, Jul 23, ≥5 pages of pagination), states 2013+ depth. Use this URL directly going forward (supersedes the legacy `planning.smcgov.org` 301-redirect host).
2. `https://www.smcgov.org/planning/current-years-schedule-planning-commission-hearings` — get the canonical current-year hearing-date list to construct/verify each `.../planning/event/planning-commission-hearing-<date>` URL.
3. Individual hearing pages for the target window, e.g. `https://www.smcgov.org/planning/event/planning-commission-hearing-january-28-2026`, `...-february-11-2026`, `...-november-12-2025`, `...-october-22-2025`, `...-may-14-2025` (confirmed live examples) — pull each page's linked Agenda + prior-Minutes PDFs.
4. `https://smctd.hylandcloud.com/ta` — **CONFIRMED live and public this pass** (2026-09-05): this IS the 2023+ agenda-management (Hyland Cloud "OnBase Agenda Online") platform; no login required; showed real 2026 SMCTA Board meetings with downloadable agenda + packet PDFs. Use this directly as the primary current source rather than `/whats-happening/meeting-information` (which still 404s on direct fetch, though the link target was confirmed real from the parent nav page).
5. `https://www.smcta.com/meetings/2025/11/ta-board-directors` and sibling monthly pages (pattern: `/meetings/<year>/<month>/ta-board-directors`) — pre-2023 / legacy-format pages; use only if the Hyland Cloud platform (step 4) doesn't cover the target window.
6. `https://sanmateocounty.granicus.com/boards/w/1adda2d08e9b063b/boards/17378` — Planning Commission member roster/board detail (secondary, for context only).
7. `https://www.smcgov.org/planning/north-fair-oaks-related-zoning-documents` — re-pull live (this pass only got a partial extract) to enumerate ALL linked ordinance PDFs including any that specifically implement R-1/S-73.
8. `https://www.smcgov.org/planning/zoning-regulations` — pull current Zoning Regulations PDF; locate sections 6300.2 (S-17 Midcoast) and 6300.4.13/6300.4.15 (S-73 North Fair Oaks) directly rather than relying on secondary summaries.
9. `https://www.smcgov.org/planning/county-ordinance-code` and `https://www.smcgov.org/planning/county-ordinance-code-update` — confirm and pull the October 8, 2024 Title 8/9/10 restructuring ordinance (Residential Hillside District is now Title 8 Ch. 8.110).
10. `https://sanmateocounty.legistar.com/View.ashx?GUID=F815FDBA-8FBF-4F83-9FB6-B26332B57FCD&ID=13559974&M=F` — verify this is in fact the October 8, 2024 restructuring ordinance text.
11. `https://www.smcgov.org/planning/san-mateo-county-housing-element-update-2023-2031` — **RESOLVED this pass**: full chronological date list extracted directly from this primary page confirms BOTH the 2024/2025 cycle AND the April/May 2026 cycle are real, sequential events (see §3d above) — not a hallucination. Still need to pull: the actual adopted-Housing-Element PDF, the HCD March 7 2025 and May 18 2026 certification letters, and the substantive content of the "March 2026 draft amendments" (what changed) — none of these underlying documents were opened in this pass, only the page's own date-timeline text.
12. `https://library.municode.com/CA/San%20Mateo%20County/codes/code_of_ordinances?nodeId=SAN_MATEO_COORCO` — cross-reference / fallback source for current in-force ordinance text if smcgov.org PDFs are stale or missing a section.

---

## Explicit Non-Fabrication Notes

- C-CAG's own agenda portal URL was found via WebSearch this pass: `https://ccag.ca.gov/committees/bicycle-and-pedestrian-advisory-committee` (and paginated variants) confirms `ccag.ca.gov` is real and hosts committee pages, but this was found while researching the SSF/BPAC item, not independently verified as C-CAG's own meeting-agenda portal for San Mateo County transportation/land-use business — still flag the specific C-CAG-for-this-project URL as **not fully confirmed**, though the domain guess (`ccag.ca.gov`) is now corroborated rather than purely speculative.
- The Planning Commission hearing archive index is now **directly confirmed and resolved**: `https://www.smcgov.org/planning/planning-commission-meeting-archive` (current host, not the legacy `planning.smcgov.org` subdomain), fetched live this pass showing real paginated 2025 hearing dates and the stated 2013+ depth claim.
- The SMCTA "agenda management platform" (2023+) is now **directly confirmed**: `https://smctd.hylandcloud.com/ta`, fetched live this pass, publicly accessible with no login required, showing real current (2026) Board meeting agendas/packets.
- The S-17 (Midcoast) and S-73 (North Fair Oaks) *recent amendment* ordinance URLs (as opposed to the underlying zoning-regulations section text) were **still not conclusively located** in this pass either — not re-attempted this round; remains open.
- **RESOLVED:** the Housing Element date discrepancy is not a conflict to pick a winner from — both chains are correct for their own round. Full sequence (confirmed directly from the primary `smcgov.org` page's own text, not a secondary summarizer): draft submitted Jan 20 2023 → HCD comment Apr 20 2023 → updated draft Jan 2024 → Planning Commission recommends Apr 10 2024 → Board adopts Apr 23 2024 → HCD 2nd comment letter Jul 5 2024 → County resubmits Feb 5 2025 → HCD finds consistent Mar 7 2025 → Board re-adopts Mar 25 2025 → March 2026 draft amendments (public review through Mar 19 2026) → Board adopts amended Housing Element Apr 21 2026 → HCD confirms compliant May 18 2026 (current/latest milestone, since today is 2026-09-05). The **substance of the March/April 2026 amendment round** (what specifically changed) was not extracted in this pass and remains open for a follow-up pull of the March 2026 draft-amendment document itself.
