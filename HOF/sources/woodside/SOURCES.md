# Woodside, CA — Source Map

Researched via WebSearch/WebFetch only (no live browser). Confirmed URLs are marked;
anything I could not directly confirm is flagged explicitly rather than guessed.

---

## 1. Planning Commission — Agendas & Minutes

- **Name:** Town of Woodside Planning Commission
- **URL (current, primary):** https://www.woodsideca.gov/280/Planning-Commission
  — landing page; agendas/minutes surfaced through the town's **AgendaCenter**
  module, e.g. https://www.woodsideca.gov/AgendaCenter (general index) and
  the commission-specific node
  https://www.woodsidetown.org/AgendaCenter/Planning-Commission-11 (note the
  numeric suffix `-11` — CivicPlus AgendaCenter assigns one numeric ID per
  body, mirroring the pattern seen on Menlo Park's legacy CivicEngage mirror
  and Atherton's Archive.aspx AMID scheme).
- **Dual domain situation (important, unresolved which is canonical):**
  Woodside appears to run content on **both** `woodsidetown.org` and
  `woodsideca.gov` — both returned live, current search hits for the same
  Planning Commission material (e.g. a Sept. 17, 2025 minutes PDF at
  `woodsidetown.org/AgendaCenter/ViewFile/Minutes/_09172025-512` and a May
  2025 Circulation Committee minutes PDF at
  `woodsideca.gov/AgendaCenter/ViewFile/Minutes/_05152025-462`). Unlike Menlo
  Park (where `.org` is a clearly legacy/stale mirror of `.gov`) or Atherton
  (where `.gov` and `ci.atherton.ca.us` mirror each other), **it was not
  possible to determine from search alone whether `woodsidetown.org` or
  `woodsideca.gov` is the current canonical domain, or whether both are
  live in parallel** — both hosted 2025-dated documents. Treat both as
  live and check for a canonical-redirect banner on first live visit.
- **Platform:** **CivicPlus AgendaCenter** (`/AgendaCenter/...` URL
  structure, `ViewFile/Agenda/` and `ViewFile/Minutes/` sub-paths with
  date-coded filenames like `_04022025-589` and `_09172025-512`) — same
  vendor family as Atherton, distinct from Menlo Park's Granicus.
- **Archive depth:** Confirmed individual documents back to at least
  **April 2024** (e.g. Planning Commission minutes at
  https://www.woodsidetown.org/AgendaCenter/ViewFile/Minutes/_04172024-248
  ) and forward through **November 2025**
  (https://www.woodsidetown.org/AgendaCenter/ViewFile/Minutes/_11192025-550).
  CivicPlus AgendaCenter pages typically expose a "View Archived Agendas and
  Minutes" link for years prior to what's shown by default — **the actual
  floor year was not confirmed** in this pass; assume it goes back further
  than 2024 and verify live via that archive link.
- **Access notes:** No CAPTCHA encountered. Application-materials review
  contact given as **Sarah Filipe, SFILIPE@WOODSIDECA.GOV** (per FAQ page) —
  this is a human contact point for records not posted online, not a login
  requirement for the agenda/minutes archive itself.
- **Est. pull effort:** **Low–Medium**, standard CivicPlus AgendaCenter
  navigation; the main friction is the unresolved dual-domain question above
  — confirm which domain to standardize on before scripting any pull.

---

## 2. Transportation-equivalent Body

- **Confirmed: Woodside has TWO separate relevant bodies, split by function**
  — unlike Atherton's single combined committee, Woodside splits roadway/
  traffic policy from trails policy:
  - **Circulation Committee** — the roadway/traffic-safety body.
    URL: https://www.woodsideca.gov/254/Circulation-Committee (agendas/minutes
    also appear under `/AgendaCenter/Circulation-Committee-9`, confirmed
    numeric AgendaCenter ID **9**). Per its confirmed charter language: "The
    Committee advises Town staff and the Town Council about ways to make the
    roadway system safer for all users, to encourage effective traffic
    enforcement, and to promote safe, convenient access to school, town
    businesses, public and private institutions, and neighborhoods." It also
    reviews special-event roadway permits, participates in the **C/CAG
    Bicycle and Pedestrian Advisory Committee** (a countywide body — City/
    County Association of Governments of San Mateo County), and reviews
    bike/ped grant applications. The Committee's charter explicitly requires
    it to **confer with the Trails Committee** on matters of mutual interest
    — confirming the two committees are formally coordinated, not siloed.
  - **Trails Committee** — the equestrian/pedestrian trail-network body,
    distinct from roadway circulation. URL:
    https://www.woodsideca.gov/283/Trails-Committee (also referenced at
    https://www.woodsidetown.org/townmanager/trails-committee-0). Confirmed
    minutes example: https://www.woodsidetown.org/AgendaCenter/ViewFile/Minutes/_01092025-381
    (Jan. 9, 2025). Given Woodside's equestrian-community character (part of
    the large-lot estate zoning fabric), this committee is a meaningfully
    active body, not a token one — do not skip it if the research angle
    touches road/trail right-of-way disputes tied to large-lot subdivision.
- **Do NOT assume** a "Public Works Commission" or "Complete Streets
  Commission" exists in Woodside — neither surfaced in search; Circulation
  Committee + Trails Committee is the confirmed structure.
- **Platform:** Same CivicPlus AgendaCenter as Planning Commission.
- **Est. pull effort:** **Low**, same CivicPlus structure; two bodies to
  pull instead of one.

---

## 3. Recently Adopted Ordinances / Housing-Related Zoning Updates

Woodside is explicitly named alongside Atherton in the project's
structural-moats framing as large-lot estate zoning; Woodside's Housing
Element saga additionally surfaced a distinctive **mountain-lion-habitat**
argument used to resist state housing law (SB 9), which is a notable
structural/legal angle for this project.

- **Municipal Code host:** **Municode Library**
  (`library.municode.com/ca/woodside/codes/municipal_code`) — confirmed via
  multiple direct search-result page titles (e.g. "TITLE I - GENERAL
  PROVISIONS | Municipal Code | Woodside, CA | Municode Library" and "TITLE
  XV - LAND USAGE | Municipal Code | Woodside, CA"). **This is a different
  platform than both Menlo Park (eCode360/General Code) and Atherton
  (municipal.codes)** — Woodside is on Municode proper. A direct WebFetch of
  `library.municode.com/ca/woodside/codes/municipal_code` returned **HTTP
  403** (same bot-gating class as eCode360 and municipal.codes) — not
  independently content-verified in this pass.
  - **Zoning/land-use title:** **Title XV — Land Usage**, specifically
    Chapter 151 ("SIDE..." truncated in search snippet, likely "Site
    Development" or similar) and a confirmed cross-reference to sections
    **151.55** ("CORERE" truncated — likely "Community Resources" or
    "Conservation/Resource" related section) per the Municode node ID
    `CD_ORD_TITXVLAUS_CH151SIDE_ARTIVOPRE_S151.55CORERE`. **Exact chapter
    titles are truncated/unconfirmed** from search snippets alone — verify
    live.
  - A secondary aggregator (GoCodebook) cites Woodside zoning/development
    standards at **sections 153.200–153.210** — this conflicts with the
    Municode node reference to Chapter 151 above; **do not treat either
    section-number citation as authoritative without a live Municode read**
    — this is exactly the kind of secondary-aggregator drift flagged in the
    Menlo Park template (GoCodebook was similarly unverified there).
  - An older/reference copy of the code (pre-2023 Housing Element cycle) is
    archived by a housing-advocacy nonprofit at:
    https://www.aducalifornia.org/wp-content/uploads/2021/06/Woodside-10-29-2020.pdf
    ("Woodside Municipal Code," dated Oct. 29, 2020 snapshot) — useful as a
    **pre-Housing-Element baseline** for before/after zoning-text comparison,
    but is a third-party PDF mirror, not the live code.
- **SB 9 / mountain lion exemption (2022) — distinctive Woodside angle:**
  Woodside froze SB 9 (state law requiring ministerial approval of duplexes/
  lot splits on single-family parcels) in **February 2022**, citing a
  statutory exemption for habitat of a species protected under state/federal
  law — specifically mountain lion habitat. Confirmed via:
  - https://www.almanacnews.com/news/2022/02/02/woodside-freezes-sb-9-projects-with-town-citing-excemption-for-mountain-lion-habitats/
  - California Attorney General's response letter (primary source, strongly
    worth pulling directly): https://oag.ca.gov/system/files/attachments/press-docs/AG%20Letter%20to%20Woodside%20re%20SB%209.pdf
    — the AG's office publicly disputed Woodside's exemption theory; this is
    a load-bearing primary document for any analysis of large-lot towns
    using habitat/environmental arguments as a zoning-relief mechanism.
- **Housing Element 2023–2031 adoption timeline (cross-checked across
  multiple Almanac articles + CEQAnet):**
  - Woodside **sent** (but did not adopt) a housing plan to the state in
    **February 2023** — an initial non-adopting submission.
  - HCD found the draft still needed work as of **May 16, 2023**.
  - Public hearing process concluded with significant public "outcry" per
    Almanac coverage dated **August 8, 2024**
    (https://www.almanacnews.com/woodside/2024/08/08/woodside-town-council-concludes-housing-element-public-hearing-amid-outcry-over-plans/).
  - Full **Housing Element formally adopted July 23, 2024** (some coverage
    frames the key rezoning vote as **July 30, 2024**, 5-1 — treat late
    July 2024 as the adoption window and confirm exact date live).
  - Rezoning ordinances (to 20 dwelling units/acre) introduced on first
    reading in late July 2024, covering: **two town-owned sites** (Raymundo
    Drive and High Road) and a **privately owned site at 773 Cañada Road**,
    plus a **Cañada College** site referenced in one summary — **the
    "Cañada College" site is not independently corroborated as a 4th
    rezoning parcel distinct from 773 Cañada Road in this pass; it may be a
    duplicate/confused reference to the same Cañada Road corridor** — verify
    live before citing as a separate site.
  - Second-reading/final adoption of the rezoning ordinances expected
    **September 2024** per the July 30 Council action — **not independently
    confirmed with a September 2024 primary document in this pass**.
  - **773 Cañada Road parcel specifically rezoned** per Almanac coverage
    dated **February 19, 2025**
    (https://www.almanacnews.com/woodside/2025/02/19/woodside-town-council-rezones-773-canada-road-parcel/)
    — this is a useful primary-adjacent confirmation that at least this one
    parcel's rezoning concluded in Feb. 2025, later than the original
    September 2024 target; suggests the rezoning process ran longer than
    initially scheduled.
  - **State certification of the Housing Element: January 29, 2025** per
    almanacnews.com (2025-02-04 headline "State certifies Woodside's housing
    element") — note the ~9-day discrepancy between the Jan. 29 certification
    date claim and the Feb. 19 rezoning-completion claim; both are plausible
    (certification can precede final implementing-ordinance completion) but
    were not cross-verified against a single primary HCD letter in this
    pass.
  - RHNA obligation: **328 new units, 2023–2031** (Woodside has been out of
    compliance since **January 31, 2023** per search-aggregated summary).
  - **CEQA record:** Town of Woodside Housing Element Rezoning, SCH#
    2023050549 — confirmed at both
    https://ceqanet.opr.ca.gov/2023050549/7 and
    https://ceqanet.lci.ca.gov/2023050549/7 (same record, two CEQAnet host
    generations — `opr.ca.gov` is the older Office of Planning and Research
    domain, `lci.ca.gov` (Land Use and Climate Innovation) is the renamed
    current one; both may resolve to the same content).
  - **Primary Housing Element document (large PDF, confirmed live):**
    https://woodsideca.gov/DocumentCenter/View/926/Housing-Element-Draft-3-Complete---3-6-24---Clean-Version-PDF
    ("Draft 3... 3-6-24" — a March 6, 2024 draft, pre-adoption; useful for
    site-selection methodology detail even though it predates final
    adoption).
  - **Town Council meeting packet (primary, confirmed live):**
    https://woodsideca.gov/DocumentCenter/View/1112/TC-Meeting-Packet---2024-07-09-PDF?bidId=
    (July 9, 2024 packet — immediately pre-adoption Council meeting).
  - **Trails memo tied to a specific rezoning site (confirmed live):**
    https://www.woodsideca.gov/DocumentCenter/View/1114/773-Canada-Road---Trails-Memo-with-Attachments-07-11-24-PDF
    — directly links the Trails Committee's equestrian/pedestrian-trail
    concerns to the 773 Cañada Road multifamily rezoning site, a good
    example of the Trails Committee's practical role in a live rezoning
    fight (per section 2 above).
- **Large-lot/estate zoning context:** Woodside is one of the most
  large-lot-restrictive towns in San Mateo County (much of the town is
  zoned for multi-acre equestrian estate parcels), which is the direct
  backdrop for both the SB 9 mountain-lion exemption fight and the
  Housing-Element outcry coverage — both are strong evidence threads for a
  structural-moats argument about large-lot zoning being actively defended
  with novel legal theories (habitat exemption) as well as ordinary
  political resistance.
- **Est. pull effort:** **Medium–High**, same Municode 403 bot-gating issue
  as Menlo Park's eCode360; the AG letter and Almanac coverage are
  low-friction, the primary code text is high-friction.

---

## 4. Login/CAPTCHA/Pagination Notes

- **woodsideca.gov / woodsidetown.org (CivicPlus AgendaCenter):** No CAPTCHA
  encountered on either domain. No login wall observed for reading agendas/
  minutes; an optional account may exist for notification subscriptions
  (standard CivicPlus pattern, not independently confirmed for Woodside
  specifically in this pass). **Unresolved: which of the two live domains is
  canonical** — check for a redirect or "this site has moved" banner on
  first live visit and standardize the pull on whichever domain redirects
  to the other.
- **library.municode.com:** Returned **HTTP 403** to WebFetch — same
  bot/JS-challenge class as eCode360 (Menlo Park) and municipal.codes
  (Atherton). Not believed to be a true credentialed login wall based on
  Municode's normal public-read behavior elsewhere; a live browser session
  should load normally, possibly behind a brief interstitial.
- **No pagination issues** identified on AgendaCenter list pages themselves;
  CivicPlus AgendaCenter typically shows a rolling recent list plus an
  explicit "View Archived Agendas and Minutes" link rather than numbered
  pagination.

---

## Pull Plan

Ordered list of exact pages for a human+browser-extension session to visit
first:

1. https://www.woodsideca.gov/280/Planning-Commission — start here; check
   for a canonical-domain redirect banner to resolve the `.gov` vs `.org`
   question before pulling further.
2. https://www.woodsidetown.org/AgendaCenter/Planning-Commission-11 — direct
   AgendaCenter node for Planning Commission; grab the "View Archived
   Agendas and Minutes" link to establish the true floor year.
3. https://www.woodsideca.gov/254/Circulation-Committee (also
   `/AgendaCenter/Circulation-Committee-9`) — roadway/traffic-safety body.
4. https://www.woodsideca.gov/283/Trails-Committee (also
   `/townmanager/trails-committee-0` on the `.org` domain) — equestrian/
   pedestrian trail body, formally coordinated with Circulation Committee.
5. https://woodsideca.gov/DocumentCenter/View/926/Housing-Element-Draft-3-Complete---3-6-24---Clean-Version-PDF
   — most complete Housing Element draft located; check for a final-adopted
   version link from the same DocumentCenter series (nearby document IDs).
6. https://woodsideca.gov/DocumentCenter/View/1112/TC-Meeting-Packet---2024-07-09-PDF?bidId=
   — Council packet for the adoption/rezoning-introduction meeting.
7. https://www.woodsideca.gov/DocumentCenter/View/1114/773-Canada-Road---Trails-Memo-with-Attachments-07-11-24-PDF
   — trails-vs-rezoning memo for the 773 Cañada Road site.
8. https://library.municode.com/ca/woodside/codes/municipal_code — Municipal
   Code home; once past the bot gate, drill into Title XV (Land Usage),
   Chapter 151, to resolve the 151.55 vs. 153.200–153.210 section-numbering
   discrepancy noted above.
9. https://oag.ca.gov/system/files/attachments/press-docs/AG%20Letter%20to%20Woodside%20re%20SB%209.pdf
   — California AG's letter disputing Woodside's mountain-lion SB 9
   exemption theory; high-value primary document for the structural-moats
   angle.
10. https://ceqanet.lci.ca.gov/2023050549/7 (or the `.opr.ca.gov` mirror) —
    CEQA record for the Housing Element Rezoning; likely links to EIR/
    negative-declaration documents and additional staff reports not
    otherwise indexed.
11. San Mateo County HCD compliance correspondence for Woodside (URL not
    confirmed in this pass — search `hcd.ca.gov` live) — to pin down the
    exact January 29, 2025 certification letter and reconcile it against
    the February 19, 2025 773 Cañada Road rezoning-completion date noted
    above.
