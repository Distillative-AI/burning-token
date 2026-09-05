# East Palo Alto, CA — Source Map

Researched via WebSearch/WebFetch only (no live browser). Confirmed URLs are marked;
anything I could not directly confirm is flagged explicitly rather than guessed.

**Context note:** East Palo Alto is the INVERSE CASE relative to the estate-town
cities in this project (Atherton/Woodside/Menlo Park). It is historically
majority-renter, has an incorporated (1983) history rooted in redlining and
disinvestment, and sits adjacent to Palo Alto and the Meta/Facebook HQ campus —
so its structural housing pressures run toward tenant displacement, rent
stabilization, and redevelopment/gentrification rather than large-lot
exclusionary zoning. Section 3 below surfaces this contrast explicitly.

---

## 1. Planning Commission — Agendas & Minutes

- **Name:** City of East Palo Alto Planning Commission
- **URL (current, primary):** https://www.cityofepa.org/bc-pc (confirmed live
  page). This page hosts a "Supporting Documents" list of recent meeting
  summaries and links out to an external meeting portal
  ("Click here for Planning Commission Meetings") pointed at
  `eastpaloalto.iqm2.com`.
- **Platform:** **Mixed / multi-platform, more fragmented than Menlo Park.**
  - The city's own site (cityofepa.org) footer reads "a municode design" —
    i.e. the *website theme/template* is a Municode (CivicPlus-adjacent)
    product, not to be confused with the separate **Municode Library**
    codified-ordinances platform (see Section 3).
  - Live meeting agendas/minutes are managed through an **IQM2** portal
    (`eastpaloalto.iqm2.com`), which is itself Granicus-affiliated (Granicus
    acquired iCompass/IQM2's legacy meeting-management line). WebFetch on
    `eastpaloalto.iqm2.com` confirmed a "Log in" control is present in the
    interface, but the page did not clarify whether login is required for
    public read access or only for staff/admin functions — **treat as
    unconfirmed whether a login wall blocks public agenda/minutes viewing**.
  - The city ALSO publishes video/agenda content on **Granicus** directly at
    `cityofepa.granicus.com` (confirmed via search hit:
    `https://cityofepa.granicus.com/MinutesViewer.php?view_id=1&clip_id=109&doc_id=...`
    for City Council; Planning Commission `view_id` not confirmed).
  - A **legacy CivicPlus AgendaCenter** also exists/existed at
    `ca-eastpaloalto.civicplus.com` and `cityofepa.org/AgendaCenter/Planning-Commission-4/`
    per search snippets — one search snippet explicitly says the AgendaCenter
    page "is for past (historical) agenda materials only," with current
    materials redirected elsewhere. Treat AgendaCenter as a **legacy/archival
    mirror**, not the live source.
  - There is also a **second live domain**, `ci.east-palo-alto.ca.us`, which
    mirrors much of `cityofepa.org` (e.g.
    `https://www.ci.east-palo-alto.ca.us/agenda`,
    `https://www.ci.east-palo-alto.ca.us/AgendaCenter`). I could not confirm
    which of the two domains (`cityofepa.org` vs `ci.east-palo-alto.ca.us`) is
    canonical/primary vs. a parallel mirror — both resolved live in this pass
    and Wikipedia's infobox cites `cityofepa.org` as "official website." Treat
    `cityofepa.org` as primary and `ci.east-palo-alto.ca.us` as a
    confirmed-live parallel/mirror domain, not yet verified as
    deprecated-or-not.
- **Archive depth:** Not confirmed. The "Supporting Documents" list on the
  live `bc-pc` page showed meeting summaries from roughly **February 2026
  through July 2026** only (i.e., recent months, not a deep archive) —
  deeper history should live on the IQM2 portal or the legacy AgendaCenter,
  but neither was fetched deeply enough in this pass to state a firm start
  year. **Flag: archive floor year for Planning Commission is unconfirmed.**
- **Access notes:** No CAPTCHA encountered. A "Staff Login" control exists on
  the main `bc-pc` page but appears distinct from general public read access
  (public content — commissioner rosters, supporting documents — loaded
  without a login prompt). The IQM2 portal's login control purpose is
  **unconfirmed** (could be public-vs-staff gating, or could be inert/unused
  for read access — needs a live click-through to resolve).
- **Est. pull effort:** **Medium.** Unlike Menlo Park's single clean
  Granicus/OpenCities structure, East Palo Alto's agenda ecosystem is split
  across at least three platforms (municode-themed city site, IQM2 meeting
  portal, Granicus video/minutes viewer) plus a legacy CivicPlus AgendaCenter
  and two parallel domains — a live browser session will need to determine
  which portal is authoritative for which time range before pulling.

---

## 2. Transportation-Equivalent Commission

- **Name:** City of East Palo Alto **Public Works & Transportation
  Commission (PWTC)** — East Palo Alto DOES have a named
  transportation-equivalent body (unlike Menlo Park, where "Transportation
  Commission" was absorbed into the Complete Streets Commission in 2017).
- **URL (current, primary):** https://www.cityofepa.org/bc-pwtc (confirmed
  live page) — mirrored at https://www.ci.east-palo-alto.ca.us/bc-pwtc.
- **Mandate (confirmed from page text):** "advising the City Council on
  matters related to the adequacy and improvement of all types of public and
  private transportation within and across the City, including the
  coordination of motor vehicle, bicycle, mass transit, and pedestrian
  traffic facilities," and it also "serv[es] as an appeals board for appeals
  from staff determinations concerning establishment of traffic signs,
  pavement markings, speed zones, parking regulations, traffic signals, bike
  lanes, bus stops, etc." So bicycle/pedestrian matters are folded into this
  single commission rather than split out — there is **no separate
  Bicycle/Pedestrian Commission**; PWTC is the sole functional equivalent.
- **Meeting schedule:** Confirmed as "Third Wednesday of the month," with a
  2026 schedule PDF linked from the page (specific meeting dates surfaced in
  search: 06/17/2026, 07/15/2026, 09/16/2026, consistent with the
  third-Wednesday cadence).
- **Agendas/minutes location:** The PWTC page does not host agendas/minutes
  directly — it links out to the same centralized
  "[Agendas/Minutes](https://www.cityofepa.org/citycouncil/page/agenda-and-minutes)"
  hub used city-wide, which in turn routes to the IQM2/Granicus ecosystem
  described in Section 1. No PWTC-specific Granicus `view_id` was confirmed
  in this pass.
- **Archive depth:** Not confirmed — only the 2026 schedule document was
  directly surfaced; historical agendas/minutes depth needs a live
  click-through into the Agendas/Minutes hub.
- **Bicycle planning artifact (confirmed primary PDF):**
  https://www.cityofepa.org/sites/default/files/fileattachments/planning/page/2801/reso_4905_adopting_2017_bicycle_transportation_plan.pdf
  — Resolution 4905 adopting the 2017 Bicycle Transportation Plan.
- **Est. pull effort:** **Medium**, same platform-fragmentation caveats as
  Section 1 — PWTC agendas live in the same multi-platform ecosystem, not a
  self-contained page.

---

## 3. Recently Adopted Ordinances / Housing-Related Municipal Code Updates

### Housing Element compliance status — CONFIRMED COMPLIANT (not Builder's-Remedy-exposed)

- East Palo Alto's 6th Cycle (2023–2031) Housing Element was **initially
  adopted February 21, 2023**, found by HCD to need revisions, then the
  **Revised Housing Element was adopted by City Council March 19, 2024** and
  **certified/approved by HCD on April 29, 2024** as substantially compliant
  with Housing Element Law (confirmed via secondary reporting —
  Palo Alto Online / Almanac News — cross-referenced against the primary
  adopted document below).
- **Primary source (confirmed PDF):**
  https://www.cityofepa.org/sites/default/files/fileattachments/housing/page/23793/adopted_2023-2031_east_palo_alto_housing_element_.pdf
  — "REVISED 2023-2031 EAST PALO ALTO HOUSING ELEMENT."
- **RHNA allocation (confirmed via secondary reporting, cross-referenced
  against housing element structure):** 829 additional units for the 2023–
  2031 cycle (165 very low-income, 95 low-income, 159 moderate-income, 410
  above-moderate-income). Reporting also states the city's development
  pipeline already totaled ~1,001 units and identified ~817 more in
  "opportunity sites" including the Ravenswood Business District/Four
  Corners (~200-acre mixed-use redevelopment area) — this opportunity-site
  framing is itself evidence of the redevelopment-pressure dynamic distinct
  from estate-town exclusionary zoning.
  - Secondary sources: https://www.paloaltoonline.com/housing/2024/02/26/east-palo-alto-nears-state-approval-of-housing-element/
    and https://www.almanacnews.com/east-palo-alto/2024/02/26/east-palo-alto-nears-state-approval-of-housing-element/
- **Builder's Remedy status:** Because HCD certified the Revised Housing
  Element on April 29, 2024, East Palo Alto is **not currently
  Builder's-Remedy-exposed** (compliant status shields the city from
  Builder's Remedy applications that noncompliant neighboring cities, e.g.
  Menlo Park re: 80 Willow Road, have faced). This is a confirmed structural
  DIFFERENCE from at least one neighboring estate-adjacent city in this
  project's comparison set. Not independently re-verified against a live
  HCD compliance-status page in this pass — treat as accurate as of the
  cited February/April 2024 reporting, but confirm no post-2024 non-compliance
  finding exists before final publication.

### Rent Stabilization / Just Cause Eviction — THE STRUCTURAL INVERSE-CASE SIGNAL

- **Name:** City of East Palo Alto **Rent Stabilization and Just Cause for
  Eviction Ordinance** (residential rental units) — **this is the marquee
  structural difference from the estate towns** (Atherton/Woodside/Menlo
  Park have no equivalent rent-control apparatus; their exclusionary
  pressure runs through large-lot zoning, not landlord-tenant regulation).
- **Two distinct ordinances confirmed (via city program page + secondary
  legal-practice summaries, cross-referenced):**
  1. **Rent Stabilization and Eviction for Good Cause Ordinance**, adopted by
     **voter initiative in 1988**, applicable to **mobile home park spaces**.
  2. **Rent Stabilization and Just Cause for Eviction Ordinance**, adopted by
     **voter initiative in 2010**, applicable to most **residential rental
     units** city-wide (single-family homes and condos are exempt under the
     state Costa-Hawkins Act, though they retain protection under the
     statewide Tenant Protection Act / AB 1482).
  3. **2016 amendment:** in November 2016, **72.5% of East Palo Alto voters**
     amended the 2010 ordinance — simplifying administration, defining
     "maximum allowable rent," revising registration-fee pass-through,
     eliminating annual registration, streamlining annual general-adjustment
     calculations, and authorizing Council to revise the ordinance when in
     conflict with federal/state law.
- **Primary source (confirmed PDF, city-hosted):**
  https://www.cityofepa.org/sites/default/files/fileattachments/rent_stabilization/page/10871/rsp_booklet_-_english_-_january_2017.pdf
  — "Rent Stabilization and Just Cause for Eviction Guide" (January 2017
  edition, post-amendment).
- **Program landing page (confirmed live, both domains):**
  https://www.cityofepa.org/rent-stabilization/page/rent-stabilization-program
  and https://www.ci.east-palo-alto.ca.us/rent-stabilization/page/rent-stabilization-program
- **Just Cause guide page (confirmed live):**
  https://www.ci.east-palo-alto.ca.us/rent-stabilization/page/guide-just-cause-eviction
- **Secondary legal-practice summaries** (useful for plain-language
  cross-check, not primary): https://www.tobenerlaw.com/the-city-of-east-palo-alto-rent-stabilization/
  and https://tenantlawgroupsf.com/rent-control-palo-alto/ — **not
  independently verified against current ordinance text in this pass**;
  treat as directionally accurate but not authoritative for exact current
  figures (e.g. current allowable annual rent-increase percentage was not
  independently confirmed here).
- **Redevelopment/gentrification pressure context:** Search results
  reference the Ravenswood Business District/Four Corners ~200-acre
  mixed-use opportunity-site redevelopment as the city's own
  Housing-Element-identified growth area — directly adjacent to Palo Alto
  and within a few miles of the Meta/Facebook Menlo Park HQ campus. This
  proximity/redevelopment dynamic (displacement risk from adjacent-market
  spillover) is the plausible "why" behind the rent-stabilization apparatus,
  but I did not find a primary source explicitly stating a causal link
  between Facebook/Meta HQ proximity and the ordinance's 1988/2010 adoption
  — **treat that causal linkage as a reasonable inference for the project's
  own analysis, not a confirmed sourced claim.**

### Municipal Code / Zoning platform

- **Name:** City of East Palo Alto Code of Ordinances (Title 18: Development
  Code covers zoning)
- **URL (confirmed via search, NOT independently fetched — see below):**
  https://library.municode.com/ca/east_palo_alto/codes/code_of_ordinances
- **Platform:** **Municode Library (MunicodeNEXT)** — confirmed distinct
  from Menlo Park's eCode360 (both are General Code/Municode-family products
  but are different platform instances; do not conflate "a municode design"
  website theme, mentioned in Section 1, with this separate Municode Library
  codification product).
  - WebFetch on the Municode Library URL returned **HTTP 403 Forbidden** in
    this pass — same bot/JS-challenge pattern encountered with Menlo Park's
    eCode360. **Not independently verified for content in this pass**; a
    live browser session should load normally.
- **City-hosted alternate (confirmed live PDF-based path):**
  https://www.cityofepa.org/planning/page/title-18-development-code — "Title
  18: Development Code" city page (zoning-relevant chapter).
  https://www.ci.east-palo-alto.ca.us/planning/page/adopted-general-plan-development-code
  — "Adopted General Plan & Development Code" mirror page.
- **"Current through Ordinance ___" banner date:** **Not confirmed** — the
  403 on Municode Library prevented reading the currency banner in this
  pass; needs live verification.
- **Access notes:** Municode Library 403'd automated fetch (bot-challenge,
  not a true credentialed login, consistent with the Menlo Park eCode360
  pattern). City-hosted PDF pages loaded without barriers.
- **Est. pull effort:** **Medium.** City-hosted Housing Element and rent
  stabilization PDFs are directly reachable; the codified zoning ordinance
  text itself sits behind the same bot-hostile Municode Library front end
  encountered elsewhere in this project.

---

## 4. Login Walls / CAPTCHA / Pagination Notes for a Human+Browser Session

- **cityofepa.org / ci.east-palo-alto.ca.us (dual live domains):** No
  CAPTCHA encountered. Public content (commission rosters, PDFs, program
  pages) loaded without a login prompt in this pass. A "Staff Login" control
  exists on commission pages but did not block general content in fetches.
  **Unresolved question for a live session:** confirm which domain
  (`cityofepa.org` vs `ci.east-palo-alto.ca.us`) is currently canonical —
  both resolved live and serve overlapping/mirrored content; do not assume
  one is stale without checking live.
- **eastpaloalto.iqm2.com (IQM2 meeting portal, Granicus-affiliated):** A
  "Log in" control is present in the interface. **Not confirmed** whether
  this gates public agenda/minutes viewing or is staff-only — treat as a
  possible soft-wall and verify live; do not assume it blocks public read
  access, but don't assume it's fully open either.
- **cityofepa.granicus.com (video/minutes viewer):** No login wall observed
  on the City Council `MinutesViewer.php`/`player/clip` URLs surfaced by
  search. `view_id` parameters are per-body; only City Council's `view_id=1`
  was evidenced by search snippets — Planning Commission and PWTC `view_id`s
  are **unconfirmed**, do not hand-construct Granicus URLs — click through
  from the city's Agendas/Minutes hub page instead.
- **ca-eastpaloalto.civicplus.com / cityofepa.org/AgendaCenter (legacy
  CivicPlus AgendaCenter):** One search snippet explicitly warns this is
  "for past (historical) agenda materials only" with current materials
  redirected — treat as an archival mirror only, verify it isn't presented
  as the live source by mistake.
- **library.municode.com (Municode Library, codified ordinances):**
  Returned **HTTP 403** to automated WebFetch in this pass — consistent with
  a bot/JS-challenge, not a credentialed login. A real browser session
  should load normally; expect a possible brief interstitial.
- **No pagination issues** were identified on any city page fetched in this
  pass — the "Supporting Documents" list on `bc-pc` appeared to be a short,
  unpaginated list of recent items, not a paginated archive.

---

## Pull Plan

Ordered list of exact pages for a human+browser-extension session to visit
first, to grab the most recent 6–12 months of agendas plus the
adopted-ordinance/rent-stabilization/housing-element paper trail:

1. https://www.cityofepa.org/bc-pc — start here; grab current Planning
   Commission "Supporting Documents" (recent meeting summaries) and follow
   the "Click here for Planning Commission Meetings" link into the IQM2
   portal for the actual agenda/minutes PDFs.
2. https://eastpaloalto.iqm2.com — resolve live whether the "Log in" control
   gates public agenda/minutes access; if open, this is likely the deepest
   available archive for Planning Commission and PWTC.
3. https://www.cityofepa.org/bc-pwtc — grab the 2026 PWTC meeting schedule
   PDF and follow its Agendas/Minutes link (same hub as step 1/2).
4. https://www.cityofepa.org/citycouncil/page/agenda-and-minutes — the
   city-wide Agendas/Minutes hub; use this to find the correct Granicus
   `view_id` for Planning Commission and PWTC rather than guessing.
5. https://cityofepa.granicus.com/MinutesViewer.php?view_id=1&clip_id=109&doc_id=12e835e9-8be4-11ef-ab4b-005056a89546
   — confirmed-live City Council example, useful as a template to locate the
   equivalent Planning Commission/PWTC `view_id` once found via step 4.
6. https://www.cityofepa.org/sites/default/files/fileattachments/housing/page/23793/adopted_2023-2031_east_palo_alto_housing_element_.pdf
   — Revised 2023-2031 Housing Element (HCD-certified April 29, 2024;
   confirms Builder's-Remedy-shielded compliance status).
7. https://www.cityofepa.org/sites/default/files/fileattachments/rent_stabilization/page/10871/rsp_booklet_-_english_-_january_2017.pdf
   — Rent Stabilization and Just Cause for Eviction Guide (primary,
   post-2016-amendment) — the core inverse-case artifact for this project.
8. https://www.cityofepa.org/rent-stabilization/page/rent-stabilization-program
   — Rent Stabilization Program landing page, for current administrative
   status/registration/allowable-increase figures not captured in the 2017
   PDF.
9. https://library.municode.com/ca/east_palo_alto/codes/code_of_ordinances
   — Municode Library Code of Ordinances home; expect a possible bot
   interstitial, then drill into Title 18 (Development Code / zoning) and
   locate the ordinance-adoption "current through" banner.
10. https://www.cityofepa.org/planning/page/title-18-development-code — city
    -hosted alternate path into Title 18 Development Code if Municode
    Library proves unworkable live.
