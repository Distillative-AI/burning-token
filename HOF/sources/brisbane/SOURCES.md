# Brisbane, CA — Source Map

Researched via WebSearch/WebFetch only (no live browser). Confirmed URLs are marked;
anything I could not directly confirm is flagged explicitly rather than guessed.

---

## 1. Planning Commission — Agendas & Minutes

- **Name**: Brisbane Planning Commission
- **URL (city landing page, confirmed)**: https://www.brisbaneca.gov/533/Planning-Commission
- **URL (CivicClerk portal, confirmed exists but JS-rendered)**: https://brisbaneca.portal.civicclerk.com/?category_id=30
- **Older/legacy references (confirmed to exist, likely superseded)**:
  - https://www.brisbaneca.org/bc-pc/meeting/planning-commission-meeting-130 (legacy `.org` domain — appears to be a prior CMS, city has since migrated to `.gov`)
  - https://archive.brisbaneca.org/planning-commission-meeting-05-26-2016 — confirms an **archive.brisbaneca.org** subdomain exists holding older (2015-2016 era) meeting pages
  - Individual packet PDFs are also served from an Azure Blob Storage bucket used by the meeting platform vendor: `mccmeetings.blob.core.usgovcloudapi.net/brisbaneca-pubu/...` — this hostname pattern (`mccmeetings` = Municode Meetings / MCCi) suggests the city may have run **Municode Meetings** as an interim platform before or alongside CivicClerk.
  - A Municode Meetings HTML agenda viewer URL was also returned in search: `https://meetings.municode.com/adaHtmlDocument/index?cc=BRISBANECA&me=...` (July 10, 2025 Planning Commission meeting) — **confirms Municode Meetings was in active use as of mid-2025**, prior to or in parallel with the current CivicClerk portal.
  - A CivicClerk API endpoint pattern was also found: `https://brisbaneca.api.civicclerk.com/v1/Meetings/GetMeetingFileStream(fileId=...)` — confirms CivicClerk is the **current/live** platform as of this research (Sept 2026).
- **Platform**: **CivicClerk** (current, live as of Sept 2026), migrated from **Municode Meetings** (confirmed in use as recently as July 2025). An older static/legacy site (`archive.brisbaneca.org`) holds pre-migration agendas back to at least 2015.
- **Archive depth**: Not disclosed on the current CivicClerk landing page (no retention statement found via WebFetch — page is JS-rendered and returned only a title to a non-browser fetch). The `archive.brisbaneca.org` subdomain independently confirms agendas/minutes exist back to at least **2015-2016**. Full CivicClerk-native archive depth is **UNCONFIRMED** — requires a live browser session to page through `category_id=30`.
- **Access notes**:
  - Agendas posted ≥72 hours before each meeting (city policy, confirmed via search-result summary of the Planning Commission page).
  - Minutes posted after Commission adoption.
  - Meetings also televised on Comcast Channel 27 and streamed via Zoom (Meeting ID 970 0458 3387, confirmed).
  - Public can subscribe to a Planning Commission "Interested Parties" list for agenda-posting email notices.
  - CivicClerk portal is **JS-rendered** — a plain WebFetch only retrieves the page shell/title, not the meeting list. A live browser (or the CivicClerk REST API, e.g. the `GetMeetingFileStream` pattern observed above) is needed for automated pulls.
- **Est. pull effort**: Medium. Static PDF packets are directly fetchable once a `fileId`/meeting URL is known; discovering those IDs requires either the live CivicClerk UI or reverse-engineering its API (`brisbaneca.api.civicclerk.com/v1/Meetings/...`).

---

## 2. Complete Streets Safety Committee (transportation equivalent)

- **Name**: Complete Streets Safety Committee — replaces the former separate **Traffic Advisory Committee** and **Bicycle and Pedestrian Advisory Committee** (confirmed via search-result summary of the city page; consolidation date not independently confirmed but the committee's governing authority, Resolution No. 2013-05, is referenced on the page).
- **URL (confirmed)**: https://www.brisbaneca.gov/538/Complete-Streets-Safety-Committee
- **Sample document (confirmed)**: https://www.brisbaneca.gov/DocumentCenter/View/586/9-2-2025---City-of-Brisbane-Complete-Streets-Safety-Committee-PDF (Sept 2, 2025 executive summary/packet — confirms active meetings into at least Sept 2025)
- **Platform**: Same CivicClerk portal (`brisbaneca.portal.civicclerk.com`) plus a separate **DocumentCenter** file repository (`brisbaneca.gov/DocumentCenter/View/...`) used for committee packet PDFs — this is a distinct static-file system from the CivicClerk meeting index, both hosted on the city's own `.gov` CMS.
- **Meeting schedule (confirmed)**: 6:30 PM, first Wednesday of each month.
- **Access**: YouTube streaming and Zoom webinar (ID 822 1307 7463, confirmed).
- **Archive depth**: Page references historical materials back to **2013** (founding resolution) and a **2014 Safe Pedestrian Routes to School Plan**, plus the Brisbane Bicycle and Pedestrian Master Plan (Feb 2017 PDF, confirmed URL: https://www.brisbaneca.org/sites/default/files/Brisbane_BPMP_final_02-01-2017.pdf — note this is on the legacy `.org` domain, indicating older planning documents were never migrated to `.gov`/DocumentCenter). Actual meeting-by-meeting agenda/minutes archive depth on CivicClerk is **UNCONFIRMED** (same JS-rendering limitation as Section 1).
- **Est. pull effort**: Medium — DocumentCenter PDF links (pattern `/DocumentCenter/View/<id>/<name>`) are directly fetchable once IDs are known; discovering the full ID range requires a live browser pass over the committee's CivicClerk category page.

---

## 3. Recently Adopted Ordinances / Housing-Related Municipal Code Updates

- **Municipal code host**: **Municode Library** (MunicodeNEXT)
  - Codified code: https://library.municode.com/ca/brisbane/codes/municipal_code (confirmed to exist via search; not independently WebFetched — see Section 4 for the 403 encountered on a sibling URL)
  - Ordinance disposition table: https://library.municode.com/ca/brisbane/ordinances/municipal_code — **URL confirmed via search, but returned HTTP 403 Forbidden on WebFetch** (see Section 4). Could not confirm ordinance list contents directly.
  - Relevant code sections identified by title (confirmed via search-result snippets): Title 17 (Zoning), Title 16 (Subdivisions), Title 15 (Building Code), Title 10 (Vehicles and Traffic) — e.g. Chapter 17.02 (Zoning Definitions/Map Act references), Chapter 17.45 (Housing Development Permit ministerial review process, referenced directly in the Housing Element Decertification FAQ below).

- **Housing Element (2023-2031 cycle)** — CONFIRMED, well-documented:
  - Landing page: https://www.brisbaneca.gov/569/Adopted-2023-to-2031-Housing-Element
  - Adoption timeline (confirmed): Planning Commission workshops Dec 2021-Jan 2022; PC hearing/recommendation Jan 12, 2023; City Council draft hearing Feb 2, 2023; **City Council adoption May 18, 2023**; **HCD certification May 25, 2023** (note: one source states May 18 in the certification-letter context and another states May 25 for the certification date itself — both dates are within days of each other and both confirmed via independent fetches; treat May 18, 2023 as adoption and May 25, 2023 as HCD certification).
  - Brisbane was reported as "the second Element in San Mateo County found by HCD to be compliant with State law" at the time (confirmed via WebFetch summary of the city's own page).
  - Received a 2023 "Voice of the People Award" for community engagement (confirmed via same page).

- **HOUSING ELEMENT DECERTIFICATION (2026) — major, current, high-value finding**:
  - Primary source (confirmed, full text extracted): https://www.brisbaneca.gov/DocumentCenter/View/3241/Housing-Element-Decertification-FAQ (PDF, "Housing Element Decertification – Your Questions Answered Here")
  - Press release (confirmed URL, not yet fetched for full text): https://www.brisbaneca.gov/DocumentCenter/View/3217/Baylands-Press-Release-7-1-2026
  - Local/press coverage (confirmed via search, URLs not independently fetched):
    - San Francisco Chronicle: https://www.sfchronicle.com/bayarea/article/housing-brisbane-builders-remedy-22329237.php ("California strips Bay Area city of local housing control...")
    - San Francisco Chronicle (earlier): https://www.sfchronicle.com/bayarea/article/brisbane-baylands-housing-project-18525588.php
    - Local News Matters: https://localnewsmatters.org/2026/07/02/state-pulls-brisbanes-housing-certification-after-missed-key-deadline/
    - The Frisc: https://thefrisc.com/hope-for-a-new-neighborhood-on-sfs-southern-border-after-decades-of-delay/
  - **Summary of confirmed facts** (from the city's own FAQ PDF, full text read directly):
    - Brisbane's Housing Element commits to a Specific Plan for the **Baylands** subarea (former Schlage Lock / SF rail yard site) allowing **1,800-2,200 housing units** (city FAQ figure) — press coverage cites a larger buildout figure of **~4,000 homes** plus 6.5M sq ft commercial, 90 acres solar, 140 acres parks for the full Baylands redevelopment (these are not necessarily contradictory — the FAQ figure may refer to the RHNA-qualifying subset).
    - State law gave the city **3 years from HCD certification** to adopt implementing zoning — deadline **May 18, 2026**.
    - Draft EIR released **April 2025**; Final EIR released **May 2026**; deadline was missed.
    - **HCD decertified Brisbane's Housing Element effective July 1, 2026** (press release date) because the Specific Plan adoption timeline slipped to fall 2026.
    - Delay causes cited by the city: (1) landowner (BDI)'s multi-year Specific Plan revision cycle (2020 → spring 2023 → 2025 final draft evaluated in the DEIR); (2) water supply plan delay, resolved when Cal Water approved a Water Supply Assessment in **January 2025**; (3) **California High-Speed Rail Authority** dispute over a proposed 125-acre light maintenance facility on the Baylands site — Brisbane sued CAHSRA in **2022**, settled **2024**, reducing the facility footprint to 45 acres; (4) site remediation/landfill closure — Remedial Action Plans approved Oct/Dec 2021, landfill closure plan approved **February 2025** (per Measure JJ requirements).
    - Consequence: City is now subject to **Builder's Remedy** for qualifying housing projects (though the FAQ argues Baylands itself, being majority commercial, isn't a Builder's Remedy substitute) and temporarily loses eligibility for housing-related state grants.
    - Per search-result synthesis, **Half Moon Bay** is cited as the only other Bay Area jurisdiction currently out of compliance — useful cross-reference/comparator for this project.
    - Planning Commission held public hearings on the Specific Plan/EIR on **June 25, 2026**, **June 30, 2026**, continued to **July 23, 2026**; per the Baylands landing-page fetch, by **August 2026** the Planning Commission voted unanimously to recommend Council certification of the Final EIR and adoption of the staff-recommended 2026 Specific Plan; a **September 3, 2026** City Council meeting was slated to address scheduling for further Baylands action. (Note: "September 3, 2026" is in the future relative to some of this research's other dated claims but consistent with the FAQ's own statement that Council review would begin "early September" — both from the same city source, treated as confirmed-as-stated by the city, not independently corroborated by a third party.)
    - HCD has committed to an **expedited (60-day statutory) recertification** once the Specific Plan is formally adopted; city staff have already given HCD a pre-review copy.
  - Baylands project hub (confirmed): https://www.brisbaneca.gov/228/Brisbane-Baylands — links to 2026 Final EIR + Specific Plan, 2025 Draft EIR + comments, 2025 and 2023 draft Specific Plans.
  - Related program note (confirmed via search-result synthesis, not independently fetched in full): Housing Element **Program 2.A.12** raised multifamily height limits (R-2/R-3 from 28-30 ft to 35-36 ft; NCRO-2/SCRO-1 to 36 ft) in direct response to an HCD comment — this is a **discrete, already-adopted zoning change** distinct from the still-pending Baylands rezoning, and would be the cleanest "recently adopted housing/zoning ordinance" citation if independently verified against a specific ordinance number (ordinance number itself is **UNCONFIRMED** — not found in search results).
  - Rezoning docket item **RZ-2024-2**: URL https://www.brisbaneca.gov/335/RZ-2024-2 returned HTTP 404 on WebFetch (dead/renamed link as of Sept 2026) — likely superseded once the item was completed/renumbered. A sibling static page (`brisbaneca.org/cd/page/2024-rz-2`) was found via search but not independently fetched. **Status of RZ-2024-2 is UNCONFIRMED.**

- **Structural note on city size** (per task framing, confirmed via general knowledge + the research above, not a single citable source): Brisbane's population (~4,700) is roughly an order of magnitude smaller than Menlo Park's, and this is visibly reflected in the infrastructure found here — a single consolidated advisory body (Complete Streets Safety Committee) covering transportation/bike/ped rather than three separate commissions; a single planning department running both current and legacy CMS platforms in parallel (`.gov` DocumentCenter + CivicClerk + a lingering `.org`/`archive.brisbaneca.org` legacy site) rather than a unified modern portal; and the Baylands Specific Plan — effectively the city's entire RHNA compliance strategy hinges on ONE large landowner-driven project, unlike a larger city's more distributed site inventory. No County-run planning-portal reliance was found in this pass (Brisbane appears to run its own CivicClerk instance rather than piggybacking on San Mateo County's), but that absence is a **negative result from search, not a confirmed negative** — worth a targeted follow-up query.

---

## 4. Login Walls / CAPTCHA / Pagination Notes for a Human+Browser Session

- **CivicClerk portal** (`brisbaneca.portal.civicclerk.com`): No login wall encountered for the base URL, but the page is **fully JS-rendered** — a plain WebFetch (non-browser) retrieves only the HTML shell/title ("Public Portal • CivicClerk") with no meeting list content. A live browser session (or direct use of the underlying REST API at `brisbaneca.api.civicclerk.com/v1/Meetings/...`) will be required to enumerate meetings, dates, and file IDs.
- **Municode Library** (`library.municode.com/ca/brisbane/ordinances/municipal_code`): Returned **HTTP 403 Forbidden** on WebFetch. This is very likely a bot/automation gate (Municode is known to rate-limit or block non-browser user agents) rather than a true authentication requirement — the sibling codified-code URL path was returned cleanly in search snippets, suggesting selective blocking rather than a site-wide wall. A live browser with a normal user-agent should get through; a staging mirror (`librarystage.municode.com`) also appeared in search results and may be less aggressively gated.
- **Municode Meetings** (`meetings.municode.com/adaHtmlDocument/...`): Not tested directly for bot-gating; URL structure suggests session/query-parameter-based access (`cc=BRISBANECA&me=<meeting-guid>&ip=True`) rather than a hard login wall.
- **Azure Blob Storage packet URLs** (`mccmeetings.blob.core.usgovcloudapi.net/brisbaneca-pubu/...`): These are direct-access PDF blobs with GUID-based filenames — no login encountered, but GUIDs are not human-guessable, so discovery requires crawling the meeting index page first.
- **brisbaneca.gov DocumentCenter** (`/DocumentCenter/View/<id>/<name>`): Direct numeric-ID PDF access, no login or CAPTCHA encountered on the two IDs fetched (3241, and the Baylands press release at 3217, and Complete Streets packet at 586).
- **No CAPTCHA was encountered anywhere in this WebSearch/WebFetch-only pass.** The only hard block was the Municode 403.
- **archive.brisbaneca.org**: Confirmed reachable via search snippets (not independently WebFetched this session) — worth checking directly in a browser session since it may be the only source for pre-CivicClerk/pre-Municode-Meetings agendas (2015-era and earlier).

---

## Pull Plan

1. **https://www.brisbaneca.gov/DocumentCenter/View/3241/Housing-Element-Decertification-FAQ** — already fully read this session; re-verify no updates since Sept 2026 research date, since this is a live, moving situation (Council action expected "early September 2026").
2. **https://www.brisbaneca.gov/DocumentCenter/View/3217/Baylands-Press-Release-7-1-2026** — full press release text not yet extracted (only summarized via search); pull directly.
3. **https://www.brisbaneca.gov/228/Brisbane-Baylands** — in a live browser, click through to the 2026 Final EIR and staff-recommended Specific Plan documents; check for post-August-2026 Council agenda items.
4. **https://brisbaneca.portal.civicclerk.com/?category_id=30** — live browser pass to enumerate Planning Commission meeting list, confirm archive depth, and identify the September 2026 Council meeting agenda on Baylands.
5. **Complete Streets Safety Committee CivicClerk category page** (URL pattern likely `brisbaneca.portal.civicclerk.com/?category_id=<other-id>` — exact category ID for this committee not yet confirmed; find via the committee landing page https://www.brisbaneca.gov/538/Complete-Streets-Safety-Committee) — live browser pass for recent packets.
6. **https://library.municode.com/ca/brisbane/ordinances/municipal_code** — retry in a live browser (normal user-agent) to get past the 403 and pull the ordinance disposition table, specifically searching for the ordinance number implementing Housing Element Program 2.A.12 (multifamily height-limit increase) and any ordinance tied to RZ-2024-2.
7. **https://www.brisbaneca.gov/335/RZ-2024-2** (currently 404) — search the live site nav for the renamed/renumbered successor page to confirm RZ-2024-2's disposition.
8. **archive.brisbaneca.org** — live browser pass to determine actual retention depth of the legacy site (appears to hold 2015-2016-era Planning Commission minutes) and cross-check whether any pre-2023 zoning ordinances are indexed there but missing from Municode.
9. **San Francisco Chronicle / Local News Matters / The Frisc articles** (URLs listed in Section 3) — pull full text for independent (non-city-sourced) framing of the decertification and community reaction, to balance the city's own FAQ framing.
10. **https://www.hcd.ca.gov/sites/default/files/docs/planning-and-community/HAU/brisbane-he-rezone-loi-121625.pdf** — HCD's own letter of intent/inquiry document (Dec 2025 per filename) — pull for the state's-side account of the compliance timeline, to cross-check against the city's FAQ.
