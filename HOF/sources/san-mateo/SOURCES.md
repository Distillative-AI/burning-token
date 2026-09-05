# City of San Mateo — Source Portals & Access Notes

Research method: WebSearch/WebFetch only (no live browser). All URLs below were located via
search or fetched and summarized by a lightweight fetch model — treat exact archive-depth
figures and platform identification as **best-effort, not directly observed by a human**.
Anything not independently confirmed is flagged explicitly rather than guessed.

---

## 1. Planning Commission

- **Name:** City of San Mateo Planning Commission
- **URL(s):**
  - Landing/info page: `https://www.cityofsanmateo.org/100/Planning-Commission`
  - Central "Agendas & Minutes Public Meeting Portal" (hub page, links out to the live system):
    `https://www.cityofsanmateo.org/3971/Agendas-Minutes-Public-Meeting-Portal`
  - Live meeting documents are hosted on **PrimeGov**, e.g.:
    `https://sanmateo.primegov.com/Portal/Meeting?compiledMeetingDocumentFileId=1373`
    (a specific July 23, 2019 Planning Commission agenda — found via search, confirms PrimeGov
    is the document host)
  - A **Legistar** instance also exists for the city (`cosm.legistar.com`) — referenced from the
    Sustainability & Infrastructure Commission page as the calendar/minutes system "old
    Public Works Commission and Sustainability Commission minutes" live on. It is UNCONFIRMED
    whether Planning Commission agendas/minutes are also indexed there; direct fetch of
    `https://cosm.legistar.com/` returned an "Invalid parameters!" error page (it requires a
    specific query string / is a JS-driven calendar app, not browsable by bare fetch).
  - Video archive (older, pre-current-portal): meetings **Nov 3, 2014 – Apr 23, 2019** are on a
    separately named "previous video platform" (name not confirmed by fetch).
- **Access notes:**
  - No login wall or CAPTCHA observed on any City of San Mateo page fetched.
  - The city appears to run (at least) two systems concurrently: **PrimeGov** (current agenda/
    packet hosting, `sanmateo.primegov.com`) and **Legistar** (`cosm.legistar.com`, older
    minutes/calendar and possibly still in use for some boards). This dual-system setup is a
    real quirk to expect in a live session — the "Agendas & Minutes Public Meeting Portal" hub
    page routes to both depending on date range.
  - PrimeGov meeting URLs use non-sequential opaque IDs (`compiledMeetingDocumentFileId=NNNN`,
    `meetingTemplateId=NNNN`) — there is no simple date-based URL pattern; a human/browser
    session will need to use the portal's own meeting list/calendar UI to page through months,
    not guess IDs.
  - Exact current-portal archive depth (how many months/years back the PrimeGov listing goes)
    was **not directly confirmed** by fetch — the fetched single-meeting page did not expose
    the calendar/list view. Needs live-session confirmation.
- **Est. pull effort:** **Medium** — no auth barrier, but two overlapping systems and opaque
  meeting IDs mean a human/browser pass is needed to enumerate the last 6–12 months rather than
  URL-guessing.

---

## 2. Transportation Commission / Equivalent

San Mateo does **not** appear to have a standalone "Transportation Commission" or a dedicated
Bicycle/Pedestrian Advisory Committee at the **city** level (that BPAC exists at the **County**
level — see below, a different jurisdiction). The city-level equivalent body is the:

- **Name:** Sustainability & Infrastructure Commission (formed 2018 by ordinance, merging the
  former Public Works Commission and Sustainability Commission; handles transportation/
  infrastructure/sustainability policy advisory functions for the City)
- **URL(s):**
  - Landing page: `https://www.cityofsanmateo.org/3910/Sustainability-Infrastructure`
  - Agendas/minutes routed through the same portal hub:
    `https://www.cityofsanmateo.org/3971/Agendas-Minutes-Public-Meeting-Portal`
  - Legistar reference (per city page): `cosm.legistar.com` calendar, said to also hold legacy
    Public Works Commission and Sustainability Commission minutes pre-2018 merger.
- **Meeting cadence:** 2nd Wednesday of each month, 7:00 PM, City Hall Council Chambers.
- **Access notes:** No login wall/CAPTCHA observed. Same PrimeGov/Legistar dual-system caveat
  as Planning Commission applies. Archive depth for pre-2018 legacy commissions is implied to
  be accessible via Legistar but was **not independently confirmed** (Legistar page did not
  load content on direct fetch — needs a live session with the calendar UI, not a bare URL).
  - **Not to be confused with:** County of San Mateo's Bicycle and Pedestrian Advisory
    Committee (`https://sanmateocounty.granicus.com/boards/w/1adda2d08e9b063b/boards/17264`,
    Granicus-hosted) — that is a **County** body covering unincorporated county areas, not
    City of San Mateo. Flagging this because it surfaced prominently in search and could be
    mistaken for a city source.
- **Est. pull effort:** **Medium** — same reasoning as Planning Commission; body name is not
  the obvious "Transportation Commission" so a human session should confirm no separate/newer
  transportation-specific body has since been created (not found in this research pass).

---

## 3. Recently Adopted Housing Ordinances / Municipal Code Updates

- **Name:** City of San Mateo Municipal Code Law Library (hosted, appears to be a General Code /
  Code Publishing-style platform)
- **URL(s):**
  - Ordinances index (by year): `https://law.cityofsanmateo.org/us/ca/cities/san-mateo/ordinances`
    — lists years **2010 through 2026**, with a per-year sub-list (e.g.
    `https://law.cityofsanmateo.org/us/ca/cities/san-mateo/ordinances/2023`,
    `.../2022`, etc.), 8–27 ordinances per year. No single flat/full-text-searchable list of
    "housing ordinances" was found — housing-relevant ordinances must be identified by title
    within each year's list.
  - Codified Two-Unit Development (SB 9) Overlay District:
    `https://law.cityofsanmateo.org/us/ca/cities/san-mateo/code/27.21`
    (Chapter 27.21, "TWO-UNIT DEVELOPMENT RESIDENTIAL OVERLAY DISTRICT – R1 DISTRICTS"), with
    sub-sections e.g. `.../code/27.21.070` (development standards).
  - **Ord. No. 2022-10** — SB 9 implementing ordinance:
    `https://law.cityofsanmateo.org/us/ca/cities/san-mateo/ordinances/2022/10`
  - **Ord. No. 2022-02** — ADU Ordinance Amendments:
    `https://law.cityofsanmateo.org/us/ca/cities/san-mateo/ordinances/2022/2`
  - **Ord. No. 2023-12** — New Objective Design Standards for Multi-Family and Residential
    Mixed-Use Development (relevant to CARLA v. City of San Mateo follow-on / HAA objective
    standards compliance): `https://law.cityofsanmateo.org/us/ca/cities/san-mateo/ordinances/2023/12`
    — introduced Nov 20, 2023, adopted Dec 4, 2023, effective Jan 3, 2024 (confirmed by fetch
    of the ordinance page itself).
  - **CARLA v. City of San Mateo** litigation background/settlement (not the ordinance text
    itself, but city-published context):
    `https://www.cityofsanmateo.org/DocumentCenter/View/86251/101421-City-Reaches-Settlement-Agreement-in-CARLA-Housing-Lawsuit`
    (City press release/document on the Oct 2021 settlement — $450,000 in fees to CARLA/
    petitioners; City agreed not to appeal to CA Supreme Court after the First District Court
    of Appeal's Sept 10, 2021 published decision affirming the Housing Accountability Act's
    "objective standards" requirement). Secondary reporting: San Mateo Daily Journal
    (`https://www.smdailyjournal.com/news/local/san-mateo-won-t-appeal-housing-ruling/article_eb01606a-2d4b-11ec-9639-2bd0b5af5af9.html`)
    and CaRLA's own case page
    (`https://calhdf.org/legal-case/4-w-santa-inez-san-mateo/`).
  - **Measure T / Measure Y** — **CONFIRMED as of 2026-09-05** (superseding the earlier "NOT
    CONFIRMED" note below, kept for history). Measure T is the Nov 5, 2024 City of San Mateo
    General Plan Amendment ballot measure (passed ~59%) that amends/repeals Measure Y, the
    1991 voter-initiative height/density cap, to allow higher limits in 10 specified areas
    (downtown, El Camino Real) toward the ~7,000-unit 2023–31 RHNA cycle. See the Pull Plan
    section's step 8 for full sourcing and the still-open gap (exact primary ballot-text URL
    not yet fetched — Ballotpedia fetch attempts returned no content this pass; needs live
    browser retry).
    <details><summary>Original unconfirmed note (superseded)</summary>
    NOT CONFIRMED in the initial research pass. No search result surfaced a specific "Measure T"
    or "Measure Y" tied to City of San Mateo housing policy with a confirmable implementing
    ordinance URL. Do not treat these ballot-measure names as verified for San Mateo without a
    follow-up targeted search/live session — flagging explicitly per instructions rather than
    fabricating a citation.
    </details>
  - **SB 9 general guidance page** (city-authored FAQ, links to the overlay ordinance):
    `https://www.cityofsanmateo.org/4598/Senate-Bill-9-SB-9-Guidance`
- **Access notes:** No login wall or CAPTCHA observed on the law library. Pages render full
  ordinance text directly (no PDF-only barrier seen on the pages fetched). The site explicitly
  discourages scraping and instead offers **bulk HTML/XML downloads via a GitHub repository**
  per the fetched ordinances-index summary — worth locating that repo link directly in a live
  session, as it may be a much lower-effort pull path than paging through per-year lists.
  No pagination controls on the year-index page were observed (each year is its own page,
  not paginated within a year in the fetched content) but sub-page counts (8–27 items/year)
  were not enumerated item-by-item in this pass.
- **Est. pull effort:** **Low–Medium** — text is directly renderable and there's a stated bulk
  export option, but per-year manual review is needed to find "housing-related" items since
  there is no dedicated housing-tag filter confirmed.

---

## 4. Login Walls / CAPTCHA / Pagination — Summary for Human-in-the-Loop Session

- **No login wall or CAPTCHA was observed** on any City of San Mateo page fetched in this pass
  (main city site, PrimeGov meeting pages, Legistar landing attempt, law library). This is
  based on automated fetch/summarization, not a live browser session — verify on first live
  visit, especially for PrimeGov (some PrimeGov deployments gate document downloads or video
  behind a click-through, not a real auth wall).
- **Two overlapping meeting-document systems** (PrimeGov + Legistar) are the main quirk:
  expect to need both, and expect the "Agendas & Minutes Public Meeting Portal" hub page
  (`.../3971/`) to be the routing point that decides which system a given date range or board
  lives in.
- **PrimeGov URLs are opaque/ID-based** (`compiledMeetingDocumentFileId`, `meetingTemplateId`)
  with no observed date-in-URL pattern — plan to navigate via the portal's own list/calendar
  UI rather than constructing URLs.
- **`cosm.legistar.com` returned "Invalid parameters!"** on a bare root fetch — it is very
  likely a query-string-driven or JS-rendered calendar (typical of Legistar deployments) and
  will need a live browser session (not raw fetch) to enumerate meetings; do not assume it is
  broken.
- **Law library ordinances index has no full cross-year housing filter** — pagination is by
  year-page, not by topic; a live session should also look for the GitHub bulk-export link
  mentioned in the platform's own site copy, which could shortcut this entirely.
- **Measure T / Measure Y**: **now confirmed** (2026-09-05 pass) — Measure T (Nov 2024, passed)
  amends the 1991 Measure Y height/density cap. Exact primary ballot-text URL still not
  directly fetched; secondary sourcing (Ballotpedia, Greenbelt Alliance, SM Daily Journal) is
  in hand. See Pull Plan step 8.
- **CARLA case number**: still unresolved — the city's own settlement PDF
  (DocumentCenter/View/86251) is a scanned/image PDF that WebFetch cannot extract text from;
  no San Mateo County Superior Court case number or First District Court of Appeal citation
  was found via search this pass. See Pull Plan step 7 for live-session leads (court's own
  case index, Trellis.law, or the appellate opinion's procedural history).

---

## Pull Plan (ordered, for the next human-in-the-loop browser session)

**Updated 2026-09-05** — one level deeper on the three named primary portals via WebSearch/
WebFetch only (no live browser this pass). Tightened URLs and confirmations below; anything
still requiring a live/browser session is marked **NEEDS LIVE CONFIRMATION**.

1. Open `https://www.cityofsanmateo.org/3971/Agendas-Minutes-Public-Meeting-Portal` first —
   this is the routing hub; identify from there whether current agendas resolve to PrimeGov,
   Legistar, or both, and get the live calendar/list UI (not a single meeting URL) for:
2. Planning Commission — use the portal's board/committee filter (starting point:
   `https://www.cityofsanmateo.org/100/Planning-Commission`) to pull the last 6–12 months of
   agendas + minutes. Confirm 2nd/4th Tuesday cadence and note any canceled meetings.
   - **PrimeGov exact meeting-list URL, tightened but still not a direct current-list landing
     page:** `https://sanmateo.primegov.com/public/portal?committee=12&fromiframe=true` was
     located (title "Search - PrimeGov Portal") and confirmed by fetch to be a real, live
     **"Boards And Commissions" search/filter interface** (not a dead link) — it exposes
     "Current And Upcoming Meetings" and "Archived Meetings" sections plus a committee-name
     filter, subscribe, speaking-request, and comment-submission functionality. However, the
     fetched (non-JS-rendered) HTML did NOT expose the actual populated dropdown values, so it
     is **UNCONFIRMED whether `committee=12` specifically means "Planning Commission"** — that
     query param was found already attached to this URL via search, not verified by content.
     **NEEDS LIVE CONFIRMATION**: open this exact URL in a live browser, then read the
     "Boards And Commissions" dropdown to (a) confirm/correct which numeric `committee=` ID
     maps to Planning Commission, and (b) capture the equivalent ID for Sustainability &
     Infrastructure Commission for step 3.
   - PrimeGov meeting IDs remain confirmed **opaque and non-guessable** — do not construct
     `compiledMeetingDocumentFileId=` or `meetingTemplateId=` values. Example real IDs found
     this pass span a huge, non-sequential range (`1373`, `4824`, `6815`, `6862`, `7774`,
     `7943`, `9473`, `16121`), confirming there is no date-derivable pattern. Use the
     `public/portal?committee=NN` search UI (once the correct `committee=` ID is confirmed
     live) or the portal's own calendar, not ID-guessing.
3. Sustainability & Infrastructure Commission — same portal, board filter starting point:
   `https://www.cityofsanmateo.org/3910/Sustainability-Infrastructure`. Pull last 6–12 months
   (2nd Wednesday cadence). Note in the pull log that this is the transportation-relevant body,
   not a "Transportation Commission" by that literal name. Use the same
   `https://sanmateo.primegov.com/public/portal?committee=NN&fromiframe=true` search pattern
   once its own `committee=` ID is confirmed live (see step 2).
4. `cosm.legistar.com` — **re-confirmed dead-end by direct fetch this pass**, both
   `https://cosm.legistar.com/` and `https://cosm.legistar.com/Calendar.aspx` return the
   literal error page **"Invalid parameters!"** on bare fetch (no calendar, no error detail,
   no redirect). A secondary/mirror aggregator page,
   `https://legistar.pagaloo.com/d/com/cosm` (titled "CITY OF SAN MATEO - Calendar
   cosm.legistar.com"), was found via search and appears to be a third-party Legistar-listing
   index that might resolve the correct deep-link query string for `cosm.legistar.com/
   Calendar.aspx?...` — **could not confirm its content this pass: WebFetch on it failed with
   a TLS "certificate has expired" error**, not a 403 (a live browser may still be able to
   load it depending on its own cert-check leniency, but this is a genuine technical barrier,
   not just a bot-block). **NEEDS LIVE CONFIRMATION**: try
   `https://legistar.pagaloo.com/d/com/cosm` in a live browser (may show a cert-warning
   interstitial to click through) to see if it exposes a working deep link into
   `cosm.legistar.com`; separately, attempt `cosm.legistar.com` directly in a live browser
   (not raw fetch) since Legistar deployments are typically JS/session-cookie driven and may
   render correctly only with a real browser engine.
5. `https://law.cityofsanmateo.org/us/ca/cities/san-mateo/ordinances` — open the current year
   and prior year pages; look specifically for the site's own bulk HTML/XML/GitHub export
   option before manually paging — this is likely the fastest path to a full adopted-ordinance
   list. (Not re-fetched this pass — no change from prior finding.)
6. Within the ordinance list, prioritize pulling full text for the already-identified housing
   set: Ord. 2022-02 (ADU), Ord. 2022-10 (SB 9 / Two-Unit Overlay), Ord. 2023-12 (Objective
   Design Standards, CARLA/HAA-responsive) — cross-link each to
   `https://law.cityofsanmateo.org/us/ca/cities/san-mateo/code/27.21` (the codified overlay
   chapter) for the current in-force text.
7. Pull `https://www.cityofsanmateo.org/DocumentCenter/View/86251/101421-City-Reaches-Settlement-Agreement-in-CARLA-Housing-Lawsuit`
   for the city's own settlement statement. **Re-fetched this pass: the file is a scanned/
   image-based PDF (144.9KB, font+image encoded) — WebFetch could not extract readable text
   from it, so the San Mateo County Superior Court case number (CIV-xxxxx style) and any First
   District Court of Appeal citation remain UNCONFIRMED.** A general web search for the case
   number (e.g. `"CARLA" "City of San Mateo" superior court case number CIV settlement 2021`)
   returned only secondary sourcing (city press release, generic court-records portals) with
   no case number in the visible excerpts — the session's WebSearch budget was exhausted
   before a targeted follow-up ("CaRLA v. City of San Mateo First District Court of Appeal
   2021 published decision citation") could be run. **NEEDS LIVE CONFIRMATION**: (a) view the
   PDF at the DocumentCenter URL directly (a live browser/PDF viewer, not WebFetch's text
   extraction, may render the scanned text or its metadata may include a case number); (b) if
   still not found, search San Mateo County Superior Court's own case index
   (`https://web.sanmateocourt.org/midx/`) or Trellis.law's San Mateo coverage
   (`https://trellis.law/coverage/california/sanmateo`) for "CaRLA" or "California Renters
   Legal Advocacy" as a party name; (c) alternatively, search Westlaw/Google Scholar for the
   First District Court of Appeal's Sept 10, 2021 published decision by case name (likely
   styled *California Renters Legal Advocacy and Education Fund v. City of San Mateo*) — its
   opinion text typically recites the trial-court case number in its procedural history.
8. Run one dedicated live search for "Measure T" and "Measure Y" + "San Mateo" to confirm or
   rule out their existence/relevance before citing them anywhere downstream.
   **RESOLVED this pass — CONFIRMED, do not treat as unconfirmed going forward:**
   - **Measure T** — City of San Mateo General Plan Amendment Measure, on the ballot
     **November 5, 2024**, **passed with ~59% of the vote**. It **repeals/amends** the
     pre-existing 1991 voter-initiative height/density cap ordinance (**Measure Y**, confirmed
     as the correct name of that 1991 measure — not a separate unrelated item) to allow the
     City to raise height/density limits in **10 specified areas**, concentrated downtown and
     along El Camino Real, explicitly to help meet the **~7,000-unit 2023–31 RHNA allocation**.
     No new taxes; revenue impact framed as developer/impact fees + incremental sales/property
     tax (city estimate up to $15M).
     - Secondary/summary sources found (not the primary ballot-text document — see gap below):
       `https://ballotpedia.org/San_Mateo,_California,_Measure_T,_City_General_Plan_Amendment_Measure_(November_2024)`,
       `https://www.greenbelt.org/blog/yes-measure-t-san-mateo/`,
       `https://www.smdailyjournal.com/news/local/measure-t-would-expand-height-density-caps-in-san-mateo/article_1b10a4d6-69c2-11ef-a607-db99b47c3785.html`
       (WebFetch on this smdailyjournal.com URL returned **HTTP 403 Forbidden** this pass —
       paywalled/bot-blocked, needs live browser), `https://xavd.id/blog/post/2024-voters-guide/`,
       `https://www.sensiblesanmateo.com/` (campaign site, "Yes on T"),
       `https://uwba.org/what-we-do/advocate/2024-greater-bay-area-voter-guide/san-mateo-county/`.
     - **Still NOT found this pass: an exact primary ballot-text URL** (i.e. the official
       City Clerk/San Mateo County Elections resolution or sample-ballot PDF containing the
       verbatim ballot question and full text of the measure). Two WebFetch attempts on the
       Ballotpedia page to extract verbatim ballot text both returned empty/no-content
       responses (tool-side rendering issue, not a confirmed 403 — worth a plain retry).
       **NEEDS LIVE CONFIRMATION**: (a) retry
       `https://ballotpedia.org/San_Mateo,_California,_Measure_T,_City_General_Plan_Amendment_Measure_(November_2024)`
       in a live browser and read its "Text of measure" section directly (Ballotpedia pages
       reliably include this section; the fetch tool simply failed to return page content
       both times here, do not treat this as "text does not exist"); (b) failing that, check
       San Mateo County's official elections office site
       (`https://www.smcacre.org/`) for the Nov 2024 sample ballot / measure text archive, or
       the City of San Mateo Clerk's ballot-measure resolution (likely titled something like
       "Resolution ordering submission of a General Plan Amendment measure to the voters").
   - **Measure Y** — confirmed only by reference (in Measure T reporting) as the 1991 city
     voter initiative that Measure T amends/repeals; no dedicated primary-source URL for
     Measure Y's own original ballot text was located or searched for directly this pass —
     out of scope for the three-portal focus of this update, flagging as a related future gap.
