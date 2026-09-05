# Redwood City, CA — Source Map

Research method: WebSearch/WebFetch only (no live browser). Several city pages
(`redwoodcity.org/...`) return HTTP 403 to automated fetch tools, so structural
details below are inferred from search snippets and from the two backing
platforms (OnBase AgendaOnline, Granicus) which did respond. Anything not
independently confirmed is flagged explicitly.

---

## 1. Planning Commission

**Name:** Redwood City Planning Commission — Agendas & Minutes

**URL(s):**
- Landing page (current pointer, returned 403 to WebFetch, found via search):
  `https://www.redwoodcity.org/city-hall/advisory-bodies-and-committees/regulatory-and-advisory-boards-commissions-and-committees/planning-commission/agendas-minutes`
- Current agenda system (OnBase Agenda Online, Hyland Software) — confirmed live:
  `https://meetings.redwoodcity.org/AgendaOnline/`
  - Direct meeting view pattern: `https://meetings.redwoodcity.org/AgendaOnline/Meetings/ViewMeeting?id=<meetingId>&doctype=1`
  - Agenda packet PDF pattern: `https://meetings.redwoodcity.org/AgendaOnline/Documents/Downloadfile/<Name>.pdf?documentType=5&meetingId=<id>&isAttachment=True`
  - Staff report pattern: `https://meetings.redwoodcity.org/AgendaOnline/Documents/ViewDocument/STAFF%20REPORT.PDF.pdf?documentType=Agenda&isSection=false&itemId=<id>&meetingId=<id>&publishId=<id>`
- Legacy/video archive (Granicus) — confirmed live, this is where minutes/video for the last several years live:
  `https://redwoodcity-ca.granicus.com/ViewPublisher.php?view_id=3`
  - **`view_id=3` reconfirmed this pass as Planning-Commission-specific** (not the top-level portal) — multiple independent hits this pass: `MinutesViewer.php?view_id=3&clip_id=3564&...` (titled "CITY OF REDWOOD CITY PLANNING COMMISSION REGULAR MEETING MINUTES"), `MediaPlayer.php?view_id=3&clip_id=3409` ("Planning Commission Meeting"), and `player/clip/1231?view_id=3` ("Planning Commission - Redwood City"). By contrast, City Council content uses `view_id=2` (seen this pass on `player/clip/3074?view_id=2` "June 28, 2021 City Council Meeting" and `player/clip/3635?view_id=2` "December 8, 2025 City Council... Regular Meeting"). So: **Planning Commission = view_id 3, City Council = view_id 2** on Granicus — `view_id=3` already lands directly on the right list, no further disambiguation needed.
  - Also found this pass: `https://www.redwoodcity.org/pc` is referenced as a short-link/redirect ("Planning Commission Streaming Media Archive") that likely forwards into this same `view_id=3` Granicus view — not independently fetched to confirm the redirect target (still 403-prone host), but worth trying directly in a live session as a shorter URL.
  - Minutes PDF viewer pattern: `https://redwoodcity-ca.granicus.com/DocumentViewer.php?file=redwoodcity-ca_<hash>.pdf&view=1`
  - Minutes viewer (HTML): `https://redwoodcity-ca.granicus.com/MinutesViewer.php?view_id=3&clip_id=<id>&doc_id=<guid>`
  - Video/media player: `https://redwoodcity-ca.granicus.com/MediaPlayer.php?view_id=3&clip_id=<id>`
- Static pre-2009 archive page (title found via search, not fetched):
  `https://www.redwoodcity.org/city-hall/advisory-bodies-and-committees/regulatory-and-advisory-boards-commissions-and-committees/planning-commission/2002-2008-agendas-minutes`

**Archive depth:**
- Granicus (`view_id=3`) confirmed spanning **2009 through the present** (fetched page showed meetings organized by year 2009–2026, earliest individual meeting record surfaced Nov 16, 2021, latest scheduled Dec 1, 2026 — the "2009" year-bucket label was visible but individual pre-2021 items were not enumerated in the fetch, so treat 2009 start as a page-label claim, not a per-meeting-verified one).
- A separate static page exists specifically for **2002–2008** agendas/minutes (title only, confirmed to exist via search result, content not fetched).
- Current/upcoming meetings (last ~4 months plus near-future) are served fresh from **OnBase AgendaOnline**, not Granicus.
- Net: functional continuous coverage from ~2009–present via Granicus, older 2002–2008 via the separate static page. Nothing before 2002 found.

**Access notes:**
- `redwoodcity.org` city pages returned HTTP 403 to the WebFetch tool on every attempt (Planning Commission landing page, Transportation Advisory Committee page, Housing Services page) — this looks like bot-blocking on the CMS front end, not a real login wall. A live browser / human-in-the-loop session should load normally.
- `meetings.redwoodcity.org/AgendaOnline` and `redwoodcity-ca.granicus.com` both loaded fine for the automated fetch tool — no login, no CAPTCHA observed on either.
- OnBase AgendaOnline groups meetings into "Upcoming" / "Recent" collapsible sections rather than classic numbered pagination; a "Meetings" top-nav link reportedly exposes a fuller search/filter UI (not exercised here).
- Granicus `ViewPublisher.php?view_id=3` lists meetings bucketed by year; no pagination controls observed, just a long year-sectioned list.

**Est. pull effort:** Low-medium. Two platforms to walk (OnBase for last ~4 months, Granicus for 2009+), no auth, but PDF-per-meeting means many individual document fetches for 6–12 months of packets/minutes (roughly 12–24 meetings if biweekly).

---

## 2. Transportation (Transportation Advisory Committee / Complete Streets Advisory Committee)

**Name:** Redwood City has **two related bodies** — confirm which one the user means before pulling:
- **Transportation Advisory Committee** (meets ~quarterly, 2nd Tuesday)
- **Complete Streets Advisory Committee** (appears to be a related/renamed or sibling body — separate agendas/minutes page)

**IMPORTANT — naming/identity finding (this pass):** "Transportation Advisory Committee" and "Complete Streets Advisory Committee" appear to be **the same body under two labels**, not two sibling committees. Evidence: the city's own "Transportation Advisory Committee Members" page is served at the URL slug `.../complete-streets-advisory-committee/members`, and a Council item states "On April 22, 2019 City Council adopted a resolution approving formation of a Transportation Advisory Committee" — i.e. the Complete Streets Advisory Committee was apparently renamed/reconstituted as the Transportation Advisory Committee in 2019, and the city's CMS still carries the old `complete-streets-advisory-committee` URL segment for at least some sub-pages (members, agendas-and-min) while the on-page title has been updated to "Transportation Advisory Committee." Treat this as one committee for pull purposes unless a live session shows two genuinely distinct rosters/agendas. Chair per search snippet: Sophie Mintier. Cadence: quarterly, 2nd Tuesday (per city page snippet, not independently re-verified this pass).

**URL(s):**
- Transportation Advisory Committee landing page (still 403 on WebFetch this pass, found via search):
  `https://www.redwoodcity.org/city-hall/advisory-bodies-and-committees/regulatory-and-advisory-boards-commissions-and-committees/transportation-advisory-committee`
- Complete Streets Advisory Committee agendas/minutes page (still 403 on WebFetch this pass, found via search):
  `https://www.redwoodcity.org/city-hall/advisory-bodies-and-committees/regulatory-and-advisory-boards-commissions-and-committees/complete-streets-advisory-committee/agendas-and-min`
- **New this pass — confirmed live on OnBase AgendaOnline:** a Transportation Advisory Committee appointment item surfaced directly from `meetings.redwoodcity.org`, e.g. `https://meetings.redwoodcity.org/AgendaOnline/Meetings/ViewMeetingAgenda?meetingId=2044&type=AGENDATYPEVALUE` — however WebFetch on this specific meetingId resolved to a **City Council** meeting (Aug 26, 2019) with a TAC-related agenda item (e.g. TAC vacancy/appointment), not a TAC meeting itself. This confirms TAC-related business is tracked in OnBase, but does NOT confirm TAC holds its own dedicated meetingId series distinct from City Council's — **still needs live-browser confirmation** via the AgendaOnline "Meetings" nav filtered by committee/body.
- A separate staff-report document (`itemId=7364&meetingId=2336`) also surfaced under the OnBase `Documents/ViewDocument` pattern, again consistent with OnBase hosting current material, but body/committee for that meetingId was not independently confirmed this pass.
- Legacy PDF archive on a separate `webapps.redwoodcity.org` host, at least one confirmed live document:
  `https://webapps.redwoodcity.org/meetings/complete/agendas/2019/completeagenda_20190611_Full-Agenda-Packet_Full-Agenda-Packet.pdf`
  — implies a pattern `https://webapps.redwoodcity.org/meetings/complete/agendas/<year>/completeagenda_<YYYYMMDD>_Full-Agenda-Packet_Full-Agenda-Packet.pdf`, **unconfirmed as a general pattern** (only one instance seen, unchanged this pass).
- Related citywide transportation plan (not an agenda portal, but adjacent):
  `https://rwcmoves.com/` (Redwood City Moves — citywide transportation plan site)

**Archive depth:** Unconfirmed — could not fetch either landing page (403, unchanged this pass). The one legacy PDF found dates to 2019, suggesting the `webapps.redwoodcity.org` archive goes back at least to 2019 (consistent with the 2019 committee-formation date found this pass), but earliest year is not confirmed. Meeting cadence is quarterly, so "6-12 months" likely means only 2-4 meetings total for this body.

**Access notes:**
- Both relevant landing pages 403'd for automated fetch again this pass (WebFetch, not just WebSearch) — confirms this is a persistent block, not a one-off. Google cache / cached snapshot was not separately retrievable via WebSearch (no cache: operator support observed); the working substitute is the search-snippet text itself, which is what surfaced the OnBase meetingId links and the naming-collision finding above.
- The `webapps.redwoodcity.org` PDF fetched fine directly (no login/CAPTCHA), but that host's directory listing/index was not located — pulling requires either the committee's agenda page (to get exact meeting dates/IDs) or guessing the filename pattern.
- **Still not confirmed:** whether current (2024-2026) TAC/Complete Streets agendas live on OnBase AgendaOnline (like Planning Commission) or remain on `webapps.redwoodcity.org`. The one OnBase hit found this pass was a City Council meeting merely referencing TAC business, not a TAC meeting agenda itself — this needs a live-browser session on the AgendaOnline "Meetings" nav, filtering explicitly for "Transportation Advisory Committee" as the meeting body/type, to resolve.

**Est. pull effort:** Medium — lower volume (quarterly meetings) but platform/URL pattern is still less certain than Planning Commission; needs a human-in-the-loop pass on the landing page (or AgendaOnline body-filter UI) first to confirm which system currently hosts agendas, and to confirm whether TAC and Complete Streets Advisory Committee are truly one body (see naming finding above) before pulling duplicate content.

---

## 3. Recently adopted ordinances / housing-related municipal code updates

**a) Affordable Housing Impact Fee Ordinance — CONFIRMED**
- **Ordinance No. 2417**, adopted **December 7, 2015** (original). Adds Article XVII (Affordable Housing Impact Fee) to Chapter 18 of the Redwood City Municipal Code (Housing Impact Fee §18.269, Exemptions §18.270, Alternatives to Payment §18.271, Development Standards §18.272).
- Amended by City Council **December 20, 2021**, amendments effective **February 18, 2022**.
- Signed ordinance PDF (third-party host, confirmed live but not fully text-extracted by the fetch tool — contains scanned/image content):
  `https://21elements.org/wp-content/uploads/2024/04/Final-Signed-Ordinance.pdf`
- City program summary page (403 on fetch, exists per search):
  `https://www.redwoodcity.org/departments/city-manager/housing-services/developers/affordable-housing-ordinance-and-impact-fees`
- Current codified zoning-code version (Municode, 403 on fetch, exists per search):
  `https://library.municode.com/ca/redwood_city/codes/zoning_code?nodeId=ART29REAFHO_29.7AFHOPLAG`
  (Article 29 — Requirements for Affordable Housing; §29.5 Payment of a Housing Impact Fee also mirrored at a third-party codification site: `http://redwoodcity-ca.elaws.us/code/z_art29_sec29.5`)

**b) 603 Jefferson Ave litigation / downtown zoning — PARTIALLY CONFIRMED, ordinance number NOT found**
- Confirmed background (via San Mateo Daily Journal coverage found in search, not independently re-fetched for full text): a citizens group ("Redwood City Residents for Responsible Development") appealed the Planning Commission's approval of an 8-story/91-unit condo project at 603 Jefferson Ave; the City Council denied the appeal and approved a scaled-back 6-story/68-unit version. This project was reported as the **first project subject to** the Dec. 2015 Affordable Housing Impact Fee (Ordinance 2417) — i.e., 603 Jefferson Ave is downstream of the fee ordinance, not itself the origin of a distinct "post-litigation downtown zoning amendment" ordinance.
- **I did not find a specific, separately-numbered "downtown zoning amendment" ordinance explicitly tied to 603 Jefferson Ave litigation.** A general zoning-code-amendments landing page exists:
  `https://www.redwoodcity.org/departments/community-development-department/planning-housing/planning-services/zoning-code-amendments`
  (403 on fetch; per search snippet it currently references 2024 code-maintenance updates, Housing Element implementation, and El Camino Real Corridor Plan implementation — none of these snippets named 603 Jefferson Ave or an ordinance number).
- **RULED OUT this pass:** `https://new.thecity.redwoodcity.org/pub/onbase/siredl.ashx?fileid=154401` was fetched and read in full (18-page PDF, first 5 pages reviewed). It is **ATTY/ORD.408 "Zoning Ordinance Amendment — Hillside"**, adopted following Planning Commission hearings Oct 7 2014 / Jan 20 2015 / Mar 3 2015 and a Council public hearing Apr 13 2015. It amends Articles 4/5 (RH and R-1 hillside/single-family residential zoning districts), Article 2 (definitions — adds "Average Slope"), Article 32.3 (sloping-site lot area), Article 45 (Architectural Permits), and Article 49 (Public Notice). This is a **hillside single-family residential zoning ordinance, entirely unrelated to 603 Jefferson Ave (a downtown mixed-use/multifamily site) or its litigation**. Do not cite this document as the 603 Jefferson answer — it is confirmed to be a different, unrelated ordinance. The ordinance number itself was blank in the template text ("ORDINANCE NO. ____") in the draft/staff-report version fetched; the enacted number was not independently looked up this pass since the document is off-topic.
- **New this pass — found but not resolved:** a Sept 2025 SF YIMBY article on updated development plans specifically for "603 Jefferson Avenue & 750 Bradford Street, Downtown Redwood City" (Sobrato Organization, on behalf of Redwood City School District; office tower to 126 ft / 8 floors, apartments to 109 ft / 10 floors) confirms the site is an active, ongoing downtown redevelopment matter as of 2025 — separate from and much larger than the c.2015-era 8-story/91-unit-then-6-story/68-unit condo project referenced in the original San Mateo Daily Journal coverage. This suggests either (a) the site has been re-entitled/re-proposed since the original litigation, or (b) there are two distinct "603 Jefferson" projects/eras conflated in search results. **This needs disambiguation in a live session** — check whether the 2025 Sobrato project is a successor to the litigated project and whether ITS entitlement required a fresh zoning amendment/ordinance.
- Also found this pass, general (not 603-Jefferson-specific) downtown zoning context: the city has been pursuing broader **"Gatekeeper Projects"** downtown zoning amendments — raising office/residential development caps in the General Plan and Downtown Precise Plan to accommodate six "Gatekeeper Projects" plus a 10% buffer — per CEQA Net records `https://ceqanet.lci.ca.gov/2021090249` ("Downtown Precise Plan Amendments") and `https://ceqanet.lci.ca.gov/2021080554/4` ("Transit District Downtown Precise Plan Amendments"). Neither CEQA Net record was fetched/confirmed to name 603 Jefferson or an ordinance number this pass — flagged as a lead only.
- **Recommendation (updated):** treat the 603 Jefferson-litigation-driven downtown zoning amendment as still unconfirmed/unfound, and treat fileid=154401 as a closed, ruled-out lead (do not re-open without new evidence). Next step for a live-browser session: (1) pull the CEQA Net records above and check for 603 Jefferson / ordinance-number mentions, (2) check Municode's ordinance history list directly, (3) determine whether the 2025 Sobrato 603 Jefferson/750 Bradford project is the same litigated parcel re-proposed, and if so pull its current entitlement/zoning-amendment record (it may be processed under the Downtown Precise Plan / Gatekeeper Projects framework rather than a standalone ordinance).

**Est. pull effort:** Low for (a) — ordinance number, dates, and codified location are all confirmed. Medium-high for (b) — requires live browsing of Municode's ordinance list or the city's zoning-amendments page to confirm whether a discrete post-litigation ordinance exists.

---

## 4. Login walls, CAPTCHA, pagination quirks (summary for human-in-the-loop session)

- **`redwoodcity.org` (main CMS) pages:** returned HTTP 403 to every automated WebFetch attempt in this session (Planning Commission page, Transportation Advisory Committee page, Complete Streets Advisory Committee page, Housing Services/Impact Fee page, Zoning Code Amendments page). No evidence this is an actual login wall — most likely bot/UA filtering (Cloudflare or similar) on the marketing CMS front end. A live browser session should render these normally; if a real login prompt appears there, it was not visible from search-engine cache/snippets.
- **`meetings.redwoodcity.org/AgendaOnline` (OnBase Agenda Online):** loaded cleanly for the fetch tool, no login/CAPTCHA. Uses a collapsible Upcoming/Recent list rather than numbered pagination; a "Meetings" nav link likely exposes a date-range search — not yet exercised, worth checking first in the live session.
- **`redwoodcity-ca.granicus.com` (legacy archive + minutes/video):** loaded cleanly, no login/CAPTCHA. Organized by year in long sections rather than paginated; document/media links use opaque numeric/hash IDs (`clip_id`, `doc_id`, file hash) that must be harvested from the year-listing page rather than guessed.
- **`library.municode.com` (current codified zoning code):** returned 403 to the fetch tool; Municode sites are typically freely browsable in a real browser (no login), so this is very likely the same bot-filtering pattern as above, not a genuine wall.
- **Third-party mirrors** (`21elements.org` PDF, `redwoodcity-ca.elaws.us`) loaded without restriction — useful fallback if a Municode/city fetch is blocked, but treat as secondary/unofficial sources, not the canonical municipal code.
- No CAPTCHA was encountered on any host that actually responded (OnBase, Granicus, third-party mirrors). The 403s look like server-side bot detection on `redwoodcity.org` and `library.municode.com` specifically — a real browser session (per this task's constraint, human-in-the-loop) should very likely clear all of them without credentials.

---

## Pull Plan (ordered)

1. **`https://meetings.redwoodcity.org/AgendaOnline/`** → browse "Meetings" nav / filter for Planning Commission, last 6–12 months. Harvest each `meetingId` and pull the agenda + packet PDFs. (Still needs live session — no Planning-Commission-specific meetingId/department-id filter was found this pass; OnBase AgendaOnline does not appear to expose a stable per-body ID in the URL the way Granicus does.)
2. **`https://redwoodcity-ca.granicus.com/ViewPublisher.php?view_id=3`** → **CONFIRMED this pass as the correct, Planning-Commission-specific view_id** (see reconfirmation note in Section 1 — City Council is `view_id=2` by contrast). For any Planning Commission meetings older than what AgendaOnline covers (i.e., filling back to ~12 months), open each year/month entry and pull the minutes PDF (`DocumentViewer.php` link) and, if needed, video (`MediaPlayer.php`). Optionally try the shortlink `https://www.redwoodcity.org/pc` first (unconfirmed redirect target, same likely destination).
3. **`https://www.redwoodcity.org/city-hall/advisory-bodies-and-committees/regulatory-and-advisory-boards-commissions-and-committees/transportation-advisory-committee`** → **still 403'd on WebFetch this pass** — open in live browser to confirm current agenda-hosting platform (OnBase vs. `webapps.redwoodcity.org`) and get the real agendas/minutes sub-link. Also use this live session to resolve whether "Transportation Advisory Committee" and "Complete Streets Advisory Committee" are the same body (see naming finding, Section 2) — check the page's own cross-references/breadcrumbs.
4. **`https://www.redwoodcity.org/city-hall/advisory-bodies-and-committees/regulatory-and-advisory-boards-commissions-and-committees/complete-streets-advisory-committee/agendas-and-min`** → **still 403'd on WebFetch this pass** — same live-browser confirmation; pull last 2–4 quarterly meetings (6–12 months at quarterly cadence). If step 3 confirms this is the same body as TAC, dedupe the pull (don't fetch twice).
5. **`https://library.municode.com/ca/redwood_city/codes/zoning_code?nodeId=ART29REAFHO_29.7AFHOPLAG`** → confirm current text of Article 29 (Affordable Housing) including §29.5 Housing Impact Fee, in live browser (403'd for automated fetch, unchanged this pass — not re-tested).
6. **`https://www.redwoodcity.org/departments/community-development-department/planning-housing/planning-services/zoning-code-amendments`** → live-browser check for the adopted-ordinance list / any downtown zoning amendment tied to the 603 Jefferson litigation. **Candidate `fileid=154401` is now RULED OUT** (confirmed this pass to be the unrelated 2015 Hillside/R-1/RH zoning ordinance, ATTY/ORD.408 — do not re-check it). Instead: (a) check CEQA Net records `https://ceqanet.lci.ca.gov/2021090249` and `https://ceqanet.lci.ca.gov/2021080554/4` (Downtown Precise Plan / Gatekeeper Projects amendments) for any 603-Jefferson or ordinance-number mention; (b) disambiguate whether the Sept-2025 Sobrato 603 Jefferson Ave/750 Bradford St project (per SF YIMBY, found this pass) is a re-proposal on the same litigated parcel, and if so pull its current entitlement record.
7. **`https://www.redwoodcity.org/departments/city-manager/housing-services/developers/affordable-housing-ordinance-and-impact-fees`** → live-browser pull of the current program page (fee schedule, exemptions) to cross-check against Ordinance 2417 and its Dec. 2021 amendment.
8. (Lower priority, deep archive only) **`https://www.redwoodcity.org/city-hall/advisory-bodies-and-committees/regulatory-and-advisory-boards-commissions-and-committees/planning-commission/2002-2008-agendas-minutes`** — only if project scope needs pre-2009 Planning Commission history.

**This-pass summary of the two originally-flagged unconfirmed items:**
- **(1) TAC/Complete Streets hosting platform — still not fully pinned.** Both landing pages 403 again on WebFetch (not just search). New finding: the two committees may be the same body under two URL slugs/names (see Section 2). One OnBase meetingId was found referencing TAC business but it belonged to a City Council meeting, not a TAC meeting — so OnBase-hosts-TAC-directly is still unconfirmed. Google-cache/`cache:` search operator was not available/supported via WebSearch this pass; no separate cache mechanism was found beyond ordinary search snippets. **Genuinely needs a live browser session** — WebSearch/WebFetch alone cannot get past the CMS's bot-filtering on these two specific pages.
- **(2) 603 Jefferson ordinance number — still not found, but the search space narrowed.** The one candidate document from the prior pass is now definitively ruled out (unrelated Hillside zoning ordinance). A live/current (2025) Sobrato redevelopment proposal at the same address was newly found and should be the next thread to pull — it's plausible no *separate* "post-litigation downtown zoning amendment" ordinance ever existed (the 2015-era project may simply have been processed under existing zoning + the Affordable Housing Impact Fee ordinance, per the original finding), and the real current zoning story for this parcel is the 2025 Sobrato/Gatekeeper-Projects-era entitlement, not a distinct litigation-driven ordinance from a decade ago.
