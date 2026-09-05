# Half Moon Bay, CA — Source Map

Researched via WebSearch/WebFetch only (no live browser). Confirmed URLs are marked;
anything I could not directly confirm is flagged explicitly rather than guessed.

---

## 1. Planning Commission — Agendas & Minutes

- **Name:** City of Half Moon Bay Planning Commission
- **URL (current, primary):** https://www.halfmoonbay.gov/314/Planning-Commission-Agendas
  (confirmed via search and fetch). There is also a general
  https://www.halfmoonbay.gov/313/Meeting-Agendas landing page and an
  https://www.halfmoonbay.gov/AgendaCenter "Agenda Center" hub, both confirmed
  via search results.
- **Legacy domain note:** The city appears to have migrated domains from
  `half-moon-bay.ca.us` (older CivicEngage-branded pages, e.g.
  `https://www.half-moon-bay.ca.us/314/Planning-Commission-Agendas` and
  `https://www.half-moon-bay.ca.us/193/CommunicationsCity-Clerk`) to
  `halfmoonbay.gov` (current, confirmed via fetch — footer reads "Government
  Websites by CivicPlus®"). Both domains resolve to similar page-ID paths
  (`/314/...`, `/193/...`), suggesting `half-moon-bay.ca.us` may 301-redirect
  or mirror `halfmoonbay.gov` — **this redirect relationship was not
  independently confirmed** in this pass; treat `halfmoonbay.gov` as
  canonical and `.ca.us` as a legacy/possibly-redirecting alias.
- **Platform:** **CivicPlus** front-end CMS (confirmed via fetch — page
  footer) for the agenda-listing pages themselves, backed by **Granicus**
  for actual document hosting and video/minutes viewers — confirmed via
  multiple `halfmoonbay.granicus.com` URLs surfaced in search, e.g.
  `https://halfmoonbay.granicus.com/AgendaViewer.php?view_id=1&clip_id=1221`,
  `https://halfmoonbay.granicus.com/MinutesViewer.php?view_id=1&clip_id=1226&doc_id=...`,
  and `https://halfmoonbay.granicus.com/MediaPlayer.php?view_id=4&clip_id=364`
  (this last one's page title returned as "Planning Commission" in search,
  suggesting `view_id=4` may be the Planning Commission's Granicus channel —
  **not independently re-fetched to confirm**, treat as
  unverified-but-plausible). This is a **CivicPlus+Granicus hybrid**, not
  Legistar, not CivicClerk, not eCode360.
- **Archive depth:** Not confirmed in this pass. The `/314/Planning-Commission-Agendas`
  page did not render a visible year-by-year archive list or date range in
  the fetched content (the fetch tool returned only top-level nav/login
  elements, not the agenda table body — likely JS-rendered or paginated
  content not captured by the markdown-conversion fetch). A live browser
  session will be needed to determine actual archive depth in years.
- **Access notes:** The city site (`halfmoonbay.gov`) offers "Create a
  Website Account" / "Website Sign In" links in its header (confirmed via
  fetch), but this is the **standard CivicPlus optional-notification-account
  pattern**, not a hard login wall gating agenda content — no evidence found
  that agenda/minutes viewing itself requires login. Flagged for live
  verification since the fetch did not reach the actual document list.
  `halfmoonbay.granicus.com` documents (PDFs, video) appeared publicly
  linked in search results with no login indicated.
- **Est. pull effort:** **Medium.** The CivicPlus agenda-listing page did not
  yield its document table via automated fetch (likely JS/AJAX-loaded
  listing), so a live browser session is needed to enumerate individual
  meeting dates; once a specific meeting's Granicus `clip_id` is known, the
  underlying agenda/minutes PDFs and video are straightforward to pull.

---

## 2. Transportation-equivalent Commission

- **Name:** Half Moon Bay does **not** have a standalone body called
  "Transportation Commission." The closest functional equivalent is the
  **Bicycle/Pedestrian Advisory Committee (BPAC)** — confirmed via
  https://www.halfmoonbay.gov/390/BicyclePedestrian-Advisory-Committee-BPA.
  BPAC is a 7-member advisory committee (walking enthusiasts, cyclists, a
  senior rep, a youth rep, and a Cabrillo Unified School District appointee)
  that advises the City Council, Planning Commission, and Parks and
  Recreation Commission on circulation-system issues, implementing the
  City's General Plan Complete Streets Policy and Bicycle & Pedestrian
  Master Plan. There is also a full list of city bodies at
  https://www.halfmoonbay.gov/345/City-Commissions-and-Committees (not
  individually fetched in this pass to confirm every listed body).
- **Note on scope:** Unlike Menlo Park's Complete Streets Commission (a
  merged, empowered commission with independent agenda/minutes archives),
  Half Moon Bay's BPAC is explicitly **advisory-only** to other bodies
  (Council, Planning Commission, Parks and Rec) rather than a
  decision-making commission in its own right — treat its agenda/minutes
  archive (if any) as thinner and lower-priority than Planning Commission.
  A secondary/independent Granicus or CivicPlus page specifically for BPAC
  agendas was **not confirmed** in this pass — check
  https://www.halfmoonbay.gov/345/City-Commissions-and-Committees live for
  a direct link.
- **Access notes / archive depth:** Not confirmed in this pass — flagged for
  live verification.
- **Est. pull effort:** **Low priority, effort unknown** pending live
  confirmation of a dedicated agenda archive for BPAC specifically.

---

## 3. Recently Adopted Ordinances / Housing-Related Municipal Code Updates — Housing Element Compliance & Coastal Program Overlay

### 3a. Municipal Code / Zoning Ordinance

- **Name:** City of Half Moon Bay Municipal Code, Title 18 (Zoning)
- **URL (official code host):** http://www.codepublishing.com/CA/HalfMoonBay/
  — confirmed as the link target from the city's own
  https://www.halfmoonbay.gov/384/Municipal-Code page (fetch confirmed the
  link structure `codepublishing.com/CA/HalfMoonBay/`). This is **General
  Code's "codepublishing.com" platform, not eCode360, not Municode**.
- **Relevant sub-page found by search:**
  https://www.codepublishing.com/CA/HalfMoonBay/html/HalfMoonBay18/HalfMoonBay1820.html
  — **Chapter 18.20, "Local Coastal Development Permits"** (title confirmed
  via search result, content not independently re-fetched in this pass).
  This chapter is the direct zoning-code implementation of the LCP/CDP
  regime described in 3c below.
- **Access notes:** No login wall mentioned or observed for
  codepublishing.com in this pass (unlike Menlo Park's eCode360, which
  returned HTTP 403 to automated fetch — codepublishing.com was not
  fetch-tested directly here, only confirmed as the link target via the
  city page fetch; treat "no login wall" as unverified-but-plausible pending
  a direct fetch attempt).

### 3b. Housing Element (2023–2031, Cycle 6) — Compliance Status

- **VERIFIED UPDATE to the companion SMC structural-moats report's Sept 2024
  snapshot:** Half Moon Bay was listed among 8 non-compliant San Mateo
  County jurisdictions as of Sept 2024. As of this research pass (searched
  September 2026), **the status has partially changed but remains
  effectively Builder's-Remedy-exposed**:
  - On **February 2, 2026**, HCD sent a letter stating the Housing Element
    adopted by City Council on **November 4, 2025** met the statutory
    requirements of state Housing Element law (per city-hosted document,
    https://www.halfmoonbay.gov/775/Housing-Element-Update-2023-2031).
  - However, the City is **not yet in "substantial compliance"** — required
    rezonings to cure a shortfall of RHNA sites are still in progress and
    require **California Coastal Commission review** before they can take
    effect (per the same source).
  - On **March 24, 2026**, HCD issued a **Notice of Violation** specifically
    regarding the timing of those required rezonings (confirmed via city
    page and a KQED-hosted copy of the HCD letter:
    https://cdn.kqed.org/wp-content/uploads/sites/10/2026/04/Half-Moon-Bay-LOS-TA-040926-1-2.pdf).
  - The City responded on **April 20, 2026**
    (https://www.halfmoonbay.gov/DocumentCenter/View/7823/City_Response-Letter_04202026).
  - **Bottom line: Half Moon Bay remains subject to the Builder's Remedy
    until HCD finds the housing element "substantially compliant,"** which
    per the city's own materials had not yet occurred as of this pass — so
    the practical Builder's-Remedy-exposed status from the Sept 2024 SMC
    report is **still effectively current**, just with an adopted (not yet
    fully implemented) Housing Element in between. Treat "substantially
    compliant" as **not yet achieved** pending live re-verification closer
    to publication.
  - Earlier HCD correspondence trail referenced on the same city page (not
    independently re-fetched line-by-line): a **March 1, 2024** HCD "Failure
    to Adopt a Compliant 6th Cycle Housing Element" letter
    (https://www.hcd.ca.gov/sites/default/files/docs/planning-and-community/HAU/half-moon-bay-loi-030124.pdf),
    HCD comments on a 4th draft (May 20, 2025), and HCD responses re: ADU
    ordinance concerns (Nov 5–6, 2024).
  - Also confirmed: California DOJ / AG Bonta pursued legal action against
    multiple non-compliant jurisdictions statewide around this period
    (https://oag.ca.gov/news/press-releases/attorney-general-bonta-newsom-administration-take-legal-action-against-local)
    and Courthouse News reported "California takes five cities to court over
    housing plan failures" — **it was not confirmed in this pass whether
    Half Moon Bay was one of the five cities named in that specific
    litigation** (the headline surfaced adjacent to HMB search results but
    the article's actual city list was not independently fetched/verified).

### 3c. Local Coastal Program (LCP) as the Zoning-Equivalent Overlay

- **(a) Is the LCP the relevant zoning-equivalent overlay? Yes, confirmed.**
  Half Moon Bay's **Local Coastal Land Use Plan (LCLUP)** was comprehensively
  updated, adopted by City Council in **October 2020**, and **certified by
  the California Coastal Commission in April 2021**, superseding a 1996
  LCLUP (per Green Foothills coverage,
  https://www.greenfoothills.org/victory-coastal-commission-hmb-land-use-plan/,
  and the city's own LCP page,
  https://www.halfmoonbay.gov/154/Local-Coastal-Program-Land-Use-Plan).
  Because **Half Moon Bay's entire jurisdiction lies within the California
  Coastal Zone**, the LCP (Land Use Plan + Implementation Plan, which is the
  Zoning/Subdivision Code) functions as the master land-use control layer —
  confirmed via secondary reporting (Planetizen, Coastside Buzz — see below)
  stating "all projects must comply with the City's Local Coastal Program,
  which includes the City's Zoning and Subdivision Code in its entirety."
- **(b) How do Coastal Development Permits (CDPs) interact with/gate new
  housing approvals?** Municipal Code **Chapter 18.20, "Local Coastal
  Development Permits"**
  (https://www.codepublishing.com/CA/HalfMoonBay/html/HalfMoonBay18/HalfMoonBay1820.html)
  is the zoning-code mechanism implementing this — a CDP is a **separate,
  additional permit layer** required for development within the Coastal
  Zone, on top of ordinary zoning/planning entitlements. This chapter's full
  text was **not independently re-fetched** in this pass beyond confirming
  its title/existence via search — a live read is needed to characterize
  exact approval criteria, appeal paths to the Coastal Commission, or any
  housing-specific exemptions (e.g. SB 330/AB 2011 CDP streamlining
  provisions, which exist statewide but whose HMB-specific implementation
  was not confirmed here).
- **(c) Documented HMB-specific RHNA/Housing-Element vs. Coastal Act/LCP
  tension — confirmed, well-documented:**
  - **Planetizen (April 2026):** "California's Half Moon Bay says coastal
    regulations hinder housing development" —
    https://www.planetizen.com/news/2026/04/137286-californias-half-moon-bay-says-coastal-regulations-hinder-housing-development
    (title/framing confirmed via search; full article not independently
    fetched in this pass).
  - **Coastside Buzz (local outlet), multiple relevant pieces:**
    - "If Half Moon Bay Does Not Hit RHNA Housing Element Numbers, Will HCD
      Hold HMB out of Compliance Triggering Builder's Remedy? It is the
      City's Position that BR Does Not Apply in the Coastal Zone" —
      https://coastsidebuzz.com/if-half-moon-bay-does-not-hit-rhna-housing-element-numbers-will-hcd-hold-hmb-out-of-compliance-triggering-builders-remedy-it-is-the-citys-position-that-br-does-not-apply-in-the-coastal-zone/
      — reports Planning Director Leslie Lacko's stated legal position that
      **"[the] builder's remedy does not apply in the coastal zone,"**
      explicitly flagged in the same reporting as a **legally untested
      position**, with Planning Commission members reportedly expressing
      skepticism it would hold up against HCD enforcement.
    - "City of Half Moon Bay Struggles with HCD's Cycle 6 Housing Element
      over ADU Ordinance and Measure D which Act Counter to RHNA Goals" —
      https://coastsidebuzz.com/city-of-half-moon-bay-struggles-with-hcds-cycle-6-housing-element-over-adu-ordinance-and-measure-d-which-act-counter-to-rhna-goals-to-build-more-housing/
      (Measure D is a local slow-growth/growth-management ballot measure —
      not independently researched in depth in this pass, flagged as a
      likely load-bearing local ordinance for the housing/coastal tension
      thread and worth its own dedicated research pass).
    - "California Versus Half Moon Bay: HMB and Green Foothills, Lennie
      Roberts, Rebut the Governor and Attorney General's Unfair Threat of
      Litigation for a City in the Coastal Zone" —
      https://coastsidebuzz.com/california-versus-half-moon-bay-half-moon-bay-and-green-foothills-lennie-roberts-rebut-the-governor-and-attorney-generals-unfair-threat-of-litigation-for-a-city-in-the-coastal-zone/
      — indicates local slow-growth advocacy groups (Green Foothills) have
      **sided with the City** against state housing-mandate enforcement,
      citing coastal-zone status — a notable local political alignment
      worth flagging for the broader structural-moats analysis.
  - **State-side correspondence confirming the tension is administratively
    live, not just rhetorical:** the City's own Housing Element page
    explicitly states required RHNA-cure rezonings require **California
    Coastal Commission review** before taking effect
    (https://www.halfmoonbay.gov/775/Housing-Element-Update-2023-2031),
    meaning HCD compliance is procedurally gated on a second state agency's
    (Coastal Commission's) sign-off — a structural coupling not present in
    inland San Mateo County jurisdictions in this project.
  - **Not confirmed in this pass:** a direct HCD-to-Coastal-Commission (or
    vice versa) interagency letter addressing this tension explicitly (as
    distinct from HCD-to-City letters). Worth a targeted follow-up search of
    coastal.ca.gov's document repository (`documents.coastal.ca.gov`) for
    any staff report explicitly discussing RHNA/Housing-Element conflicts.
- **(d) California Coastal Commission's own agenda/meeting portal (secondary
  source alongside city Planning Commission):**
  - **Main meetings/agenda hub:** https://www.coastal.ca.gov/meetings/agenda/
    and https://www.coastal.ca.gov/mtgcurr.html (both confirmed via search;
    the Commission appears to run parallel/overlapping agenda index pages —
    not fully reconciled in this pass, check both live).
  - **Monthly agenda pattern example (per-month page):**
    https://www.coastal.ca.gov/meetings/mtg-10mm.html (October meeting,
    confirmed via search — URL pattern suggests `mtg-<month-code>mm.html`,
    not independently verified across all months).
  - **Staff report archive (primary source for specific HMB agenda items):**
    `https://documents.coastal.ca.gov/reports/<year>/<month>/...` — confirmed
    functional via multiple hits, e.g.
    https://documents.coastal.ca.gov/reports/2022/2/F14a/F14a-2-2022-report.pdf
    and https://documents.coastal.ca.gov/reports/2022/10/F8a/F8a-10-2022-exhibits.pdf
    (the latter explicitly tied to Half Moon Bay Cycle 6 Housing
    Element/LCP Implementation Plan review per adjacent search result
    context — not independently re-fetched to confirm content in this pass).
  - **Notable fact:** the California Coastal Commission held an **in-person
    meeting in Half Moon Bay itself** (Oceano Hotel & Spa, Feb 4–6, 2026),
    confirmed via a secondary "meeting guide" blog
    (https://southocbeaches.com/2026/02/04/california-coastal-commission-meeting-guide-wednesday-february-4-2026/)
    — the North Central Coast District office (which covers HMB) is at 455
    Market St, Suite 300, San Francisco, phone (415) 904-5260, per the same
    secondary source; **not independently verified against a coastal.ca.gov
    primary staff directory page** in this pass.
  - **Video/live archive:** Coastal Commission meetings are streamed/archived
    via "Cal-Span" per search result text — exact Cal-Span URL for the
    Commission was **not confirmed** in this pass; search live at
    https://www.coastal.ca.gov/meetings/agenda/ for the current link.

---

## 4. Login Walls / CAPTCHA / Pagination Notes for a Human+Browser Session

- **halfmoonbay.gov (CivicPlus):** Optional "Create a Website Account" /
  "Website Sign In" links appear in the header (confirmed via fetch), but no
  evidence found that these gate agenda/minutes/document viewing — this
  matches the standard CivicPlus notify-me-style optional account pattern
  seen elsewhere, not a hard paywall. **Flagged for live confirmation**
  since the automated fetch of `/314/Planning-Commission-Agendas` did not
  surface the actual agenda table (likely JS/AJAX-rendered), so pagination
  behavior of that specific listing (infinite scroll vs. numbered pages vs.
  year dropdown) is **unknown** and must be checked live.
- **half-moon-bay.ca.us (legacy domain):** Older CivicEngage-branded URLs
  were found for the same page IDs (`/314/...`) — likely a legacy alias or
  redirect target for `halfmoonbay.gov`. **Not confirmed** whether it still
  resolves independently or 301-redirects; check both in a live session.
- **halfmoonbay.granicus.com:** No login wall observed in search results —
  agenda/minutes/video viewer URLs (`AgendaViewer.php`, `MinutesViewer.php`,
  `MediaPlayer.php`, keyed by `view_id`/`clip_id`) appeared as directly
  linked, unauthenticated PDF/media pages. `view_id` mapping to specific
  bodies (e.g. `view_id=1` appears to be City Council based on multiple
  hits; `view_id=4` appeared adjacent to a "Planning Commission" page title
  in one search result but **was not independently re-fetched to confirm**)
  — click through from the city's own agenda pages rather than
  hand-constructing Granicus URLs, same caution as the Menlo Park template.
- **codepublishing.com (Municipal Code):** No login wall or CAPTCHA
  encountered in search results referencing this host; unlike Menlo Park's
  eCode360 (which 403'd automated fetch), codepublishing.com was not
  directly fetch-tested in this pass, so bot-gating behavior is
  **unconfirmed** — treat as likely public-read but verify live.
- **coastal.ca.gov / documents.coastal.ca.gov:** No login wall observed;
  these appear to be fully public static/PDF-serving state government
  pages. No CAPTCHA encountered in search results.
- **No CAPTCHA was encountered** on any Half Moon Bay or Coastal Commission
  page in this research pass, though this pass did not include a live
  browser render of the JS-driven agenda listing, so a CAPTCHA or
  bot-interstitial on that specific page **cannot be fully ruled out** —
  verify live.

---

## Pull Plan

Ordered list of exact pages for a human+browser-extension session to visit
first, to grab the most recent Planning Commission activity, the
Housing-Element/Coastal-Program compliance trail, and the Coastal
Commission's parallel agenda surface:

1. https://www.halfmoonbay.gov/314/Planning-Commission-Agendas — start here;
   this is a JS/AJAX-listing page not fully captured by automated fetch, so
   a live browser is needed to enumerate actual meeting dates and confirm
   archive depth in years.
2. https://www.halfmoonbay.gov/345/City-Commissions-and-Committees — confirm
   the full roster of city bodies and locate a direct agenda link (if any)
   for the Bicycle/Pedestrian Advisory Committee (BPAC), the closest
   transportation-equivalent body.
3. https://www.halfmoonbay.gov/390/BicyclePedestrian-Advisory-Committee-BPA
   — BPAC's own page; check for an agenda/minutes archive link.
4. https://www.halfmoonbay.gov/775/Housing-Element-Update-2023-2031 — the
   central hub for the Cycle 6 Housing Element compliance trail; pull the
   linked HCD correspondence documents directly:
   - https://www.halfmoonbay.gov/DocumentCenter/View/7823/City_Response-Letter_04202026
   - https://www.halfmoonbay.gov/DocumentCenter/View/7767/FAQs-HCD-Housing-Element-Response
   - (and the March 24, 2026 HCD Notice of Violation document linked from
     the same page — exact DocumentCenter ID to confirm live)
5. https://www.hcd.ca.gov/sites/default/files/docs/planning-and-community/HAU/half-moon-bay-loi-030124.pdf
   — primary HCD "Failure to Adopt a Compliant 6th Cycle Housing Element"
   letter, March 1, 2024 (earliest confirmed HCD non-compliance
   correspondence found in this pass).
6. https://www.halfmoonbay.gov/154/Local-Coastal-Program-Land-Use-Plan —
   city's own LCP/LCLUP page (Coastal Act overlay, certified April 2021).
7. https://www.codepublishing.com/CA/HalfMoonBay/html/HalfMoonBay18/HalfMoonBay1820.html
   — Municipal Code Chapter 18.20, Local Coastal Development Permits (the
   CDP-gating mechanism for new housing/development approvals).
8. https://coastsidebuzz.com/if-half-moon-bay-does-not-hit-rhna-housing-element-numbers-will-hcd-hold-hmb-out-of-compliance-triggering-builders-remedy-it-is-the-citys-position-that-br-does-not-apply-in-the-coastal-zone/
   — best local-press evidence of the City's explicit "Builder's Remedy
   does not apply in the Coastal Zone" legal position and its contested
   status.
9. https://www.planetizen.com/news/2026/04/137286-californias-half-moon-bay-says-coastal-regulations-hinder-housing-development
   — national planning-press coverage of the RHNA/Coastal Act tension,
   useful as an independent (non-hyperlocal) corroborating source.
10. https://www.coastal.ca.gov/meetings/agenda/ and
    https://documents.coastal.ca.gov/reports/ — Coastal Commission's own
    agenda/staff-report portal; search/browse for Half Moon Bay LCP
    Implementation Plan and Housing Element-related agenda items directly
    (exact per-item URLs will need to be located live, e.g. via the
    `documents.coastal.ca.gov/reports/<year>/<month>/` pattern confirmed
    functional in this pass).
