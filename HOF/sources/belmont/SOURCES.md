# Belmont, CA — Source Map

Researched via WebSearch/WebFetch only (no live browser). Confirmed URLs are marked;
anything I could not directly confirm is flagged explicitly rather than guessed.
Note: most belmont.gov and library.municode.com pages returned **HTTP 403** to the
automated WebFetch tool in this pass (see Section 4) — URLs below were confirmed to
exist via WebSearch result titles/snippets and, in a few cases, via a successful
WebFetch (e.g. the GoCodebook secondary aggregator), but the underlying belmont.gov
and Municode page *content* was largely not independently re-rendered by this pass.

---

## 1. Planning Commission — Agendas & Minutes

- **Name:** City of Belmont Planning Commission
- **URL (current, primary):** https://www.belmont.gov/departments/meetings-agendas-minutes
  (general "Meetings, Agendas & Minutes" hub; per search-result titles there is also
  a dedicated commission landing page at
  https://www.belmont.gov/our-city/city-government/council-commissions-committees-boards/planning-commission).
  Both URLs surfaced directly in search results with matching titles; **neither could
  be rendered by WebFetch in this pass (HTTP 403)** — treat as confirmed-to-exist,
  content-unverified.
- **Platform:** Video/meeting archive is hosted on **Granicus**, confirmed via the
  distinct `belmont-ca.granicus.com` domain surfacing in search results (e.g.
  `https://belmont-ca.granicus.com/ViewPublisher.php?view_id=1`,
  `https://belmont-ca.granicus.com/MetaViewer.php?view_id=1&clip_id=...`). The main
  belmont.gov site itself appears to run on a CMS that paginates meeting lists with
  a `-npage-NN-` URL segment pattern (e.g.
  `.../meetings-agendas-minutes/-npage-35/-sortd-asc/-item-1942`), which is **not**
  a pattern associated with Legistar, CivicClerk, eCode360, or CivicEngage — this
  looks like a Vision Internet / CivicPlus-style "list-detail" component (the search
  snippet literally names the page type "List of Meetings & Events" /
  "List-Detail Pages"), separate from the Granicus video backend. **The exact CMS
  vendor for belmont.gov's page-rendering layer was not confirmed** in this pass —
  treat "Vision/CivicPlus-style list-detail CMS + Granicus video backend" as
  unverified-but-plausible pending a live browser session.
- **Archive depth:** Search results show pagination indices up to at least
  `-npage-139-` on one list-detail variant and `-npage-35-`/`-npage-11-` on others,
  which implies a substantial multi-year archive, but **no specific origin year was
  confirmed** in this pass (unlike Menlo Park's confirmed ~2002–2003 floor). Treat
  archive depth as "at least several years, exact floor unconfirmed."
- **Access notes:** Meeting schedule confirmed via search snippet: Planning
  Commission meets the **1st and 3rd Tuesday of each month, 7:00 PM, City Council
  Chambers, One Twin Pines Lane, Belmont, CA 94002**. No login wall was mentioned in
  any search snippet; belmont.gov pages returned HTTP 403 to the automated WebFetch
  tool specifically (see Section 4) — this is very likely a bot/WAF block on the
  automated fetch client, not a true credentialed login wall, but this is
  **unverified-but-plausible** absent a live browser session.
- **Est. pull effort:** **Medium.** URLs and meeting cadence are confirmed via
  search, but the belmont.gov site blocked automated content fetch outright (403),
  so a human/live-browser session will be needed to actually enumerate and download
  agenda/minutes PDFs — more friction than Menlo Park's Granicus/OpenCities site,
  which was fetchable directly.

---

## 2. Transportation-equivalent Commission

- **Name:** Belmont does **not** appear to have a standalone "Transportation
  Commission" or a dedicated Bicycle/Pedestrian Advisory Committee (BPAC). Based on
  search-result summaries, the functional equivalent is split across two bodies:
  - **Parking and Traffic Safety Committee (PTSC)** — evaluates policies relating to
    traffic and driving safety (per search-result summary; **exact PTSC URL not
    independently confirmed** in this pass — follow the commissions/boards index at
    https://www.belmont.gov/our-city/city-government/council-commissions-committees-boards
    live to locate it).
  - **Park and Recreation Commission** — one search snippet referenced a report
    being "presented to and discussed [by] the Park and Recreation Commission/BPAC,"
    suggesting bicycle/pedestrian topics are folded into this commission's agenda
    rather than a standalone BPAC. **Not independently confirmed as a standing
    dual-purpose body** — treat as unverified-but-plausible.
  - Bicycle/pedestrian planning itself is staff-driven, not commission-driven: the
    City's **Comprehensive Pedestrian & Bicycle Plan** is administered by Public
    Works/Transportation staff
    (https://www.belmont.gov/departments/public-works/transportation/comprehensive-pedestrian-bicycle-plan),
    parallel to a countywide effort — CCAG (City/County Association of Governments
    of San Mateo County) runs a countywide **Bicycle and Pedestrian Advisory
    Committee (BPAC)** that Belmont participates in rather than running its own
    (https://ccag.ca.gov/wp-content/uploads/2020/03/CCAG_BPAC_Public-Member_Call-for-Applicants.pdf).
- **Platform:** Unconfirmed for PTSC/Park and Recreation Commission specifically —
  presumed same belmont.gov list-detail + Granicus pattern as Planning Commission,
  but not verified live in this pass.
- **Archive depth / access notes:** Not independently assessed in this pass —
  flagged as a gap needing a live-session check of the commissions/boards index
  page.
- **Est. pull effort:** **Medium-High** — the functional-equivalent body is less
  clear-cut here than in cities with a named Transportation Commission; a live
  session should start at the commissions/boards index page to positively identify
  which body (PTSC vs. Park and Recreation Commission vs. something else) actually
  owns transportation/mobility agenda items.

---

## 3. Recently Adopted Ordinances / Housing-Related Municipal Code Updates — Housing Element Compliance Status

- **Municipal code platform:** Belmont's Code of Ordinances is hosted on
  **Municode** (`library.municode.com`), **not eCode360**. Confirmed via multiple
  matching search-result titles:
  - Main code: https://library.municode.com/ca/belmont/codes/code_of_ordinances
  - Zoning: **Chapter 35 — ZONING USE REGULATIONS**,
    https://library.municode.com/ca/belmont/codes/code_of_ordinances?nodeId=CICO_CH35ZOUSRE
  - Planning: **Chapter 17 — PLANNING**,
    https://library.municode.com/ca/belmont/codes/code_of_ordinances?nodeId=CICO_CH17PL
  - Recent ordinance entries surfaced directly by search title (evidence the code is
    actively maintained into 2025): "Ordinance No. 2025-1184" and
    "Ordinance No. 2023-1171" under
    `https://library.municode.com/CA/belmont/ordinances/code_of_ordinances?nodeId=...`.
  - **All `library.municode.com` URLs returned HTTP 403 to WebFetch in this pass** —
    confirmed to exist via search-result titles/URLs only; page **content was not
    independently rendered**. The exact "current through Ordinance ___" banner text
    was **not confirmed** — treat "current through at least Ordinance 2025-1184" as
    unverified-but-plausible, not a directly-read fact.

- **Cross-reference to the San Mateo County structural-moats report — slope-based
  FAR/height caps (R-1 zones):**
  The companion report (`reports/san-mateo-housing-structural-moats.md`) cites
  GoCodebook (https://gocodebook.com/us/california/belmont/development-standards)
  for: "Slope-based FAR caps (0.533 on flat lots), gross floor area capped at
  3,500-4,500 sq ft, height capped at 28 ft in R-1 zones."

  **Attempted independent primary-source verification:**
  - A WebFetch of the GoCodebook page itself (successful, unlike the Municode/
    belmont.gov fetches) returned a more detailed breakdown that **matches and
    refines** the report's figures: height 28 ft for primary structures (15 ft
    accessory); floor area is "the lesser of" a slope-based FAR (from a "Table 4,"
    ranging ~0.533 at 0–10% slope down to 0.267 at 45%+ slope) or a lot-size-based
    gross floor area cap (from a "Table 5," generally 3,500 sf up to a 10,000 sf
    lot, sliding up to a 4,500 sf maximum). GoCodebook's own page explicitly cites
    **"Belmont Zoning Code §4.2.3–4.2.6, Tables 4–6"** and names
    **library.municode.com** as the primary source it draws from.
  - I located what is very likely the **primary source PDF**: a belmont.gov-hosted
    document titled **"City of Belmont Zoning Ordinance 4-1 SECTION 4 – RESIDENTIAL"**
    at https://www.belmont.gov/home/showpublisheddocument/15634/637387871000130000
    — the "Section 4" title and "4-1" pagination is consistent with GoCodebook's
    cited §4.2.3–4.2.6 range. **However, this URL returned HTTP 403 to WebFetch and
    I could not read its actual text content in this pass.** I also found a second
    belmont.gov Granicus-hosted candidate,
    https://belmont-ca.granicus.com/MetaViewer.php?view_id=1&clip_id=48&meta_id=4672
    (titled "City of Belmont Zoning Ordinance 13-1 ORDINANCE NO. ___"), which is
    likely a full/consolidated zoning ordinance PDF (Ordinance 360, per one search
    snippet) but was **not fetched/confirmed** either.
  - **Verdict: PARTIALLY corroborated, not independently confirmed against primary
    code text.** The 28 ft height figure, the "lesser of slope-FAR or lot-size GFA"
    mechanism, the ~0.533 slope-FAR ceiling, and the 3,500–4,500 sf floor-area range
    all appear consistently across two aggregator-level sources (GoCodebook's own
    page, and the WebFetch summary of it) that both explicitly cite a specific
    municipal code section (§4.2.3–4.2.6, Tables 4-6) and a document title
    ("Zoning Ordinance ... SECTION 4 – RESIDENTIAL") that lines up with that
    citation. But **I was not able to directly open and read the primary
    belmont.gov PDF or the Municode zoning chapter text myself** — both returned
    HTTP 403 to the automated fetch tool. State this finding as **"corroborated by
    a specific, checkable primary-source citation, but not independently
    fetched/confirmed in this research pass"** rather than as directly verified.

- **Housing Element compliance status — CONFLICTING SIGNALS, explicitly flagged:**
  The companion report's premise (Belmont among 8 non-compliant SMC jurisdictions as
  of Sept 2024, Builder's-Remedy-exposed) is **not confirmed as Belmont's current
  status** — and the sources found in this pass actively disagree with each other:
  - One WebSearch AI-summary pass (search-engine-side synthesis, not a direct page
    read) stated: "The City Council adopted Belmont's 2023-2031 Housing Element on
    September 10, 2024, and... HCD recently certified it as compliant." A second,
    similarly search-engine-synthesized pass repeated "Belmont's Housing Element is
    In Compliance."
  - However, a **direct WebFetch of the primary tracker page itself**
    (https://cities.fairhousingelements.org/cities/belmont) returned content stating
    Belmont's housing element is **"out of compliance,"** on pace to meet only
    **43%** of its RHNA target, with Builder's Remedy listed as **"Does not
    apply"** for Belmont specifically (i.e., the tracker's own schema treats
    Builder's Remedy as not currently triggered for this city, independent of the
    compliance question) — and noted a **November 2024** watchdog finding that HCD
    identified deficiencies in Belmont's rezoning approach but "only required small
    changes," with re-certification "expected soon" as of that note.
  - **This is a direct contradiction between two evidence layers found in the same
    research pass**: search-engine AI summaries say "compliant," the fetched
    tracker-page content says "out of compliance" (as of whatever date that tracker
    page was last updated — page's own "as of" date was not visible in the fetched
    excerpt). I could not resolve this discrepancy against a primary HCD compliance
    letter in this pass (HCD's own compliance-tracking page,
    https://www.hcd.ca.gov/housing-element/compliance, was surfaced by search but
    not fetched/confirmed for Belmont's specific row).
  - **Do not treat Belmont's compliance status as settled by this pass.** Flag
    explicitly: Belmont's Housing Element compliance status as of September 2026 is
    **unconfirmed and contested between sources found**, and its Builder's-Remedy
    exposure (implied by the companion report's Sept 2024 8-jurisdiction list) may
    have changed since — or the tracker's "out of compliance" read may itself be
    stale. A live check of HCD's official compliance list
    (https://www.hcd.ca.gov/housing-element/compliance) is the correct next step,
    not a repeat of either secondary source above.
  - Belmont's own Housing Element hub:
    https://www.belmont.gov/departments/community-development/housing/housing-element
    and document set:
    https://www.belmont.gov/departments/administrative-services/city-manager/housing/housing-element-documents
    (both confirmed to exist via search-result titles; **content not fetched**, 403
    risk applies as with other belmont.gov URLs).
  - Draft Housing Element document (HCD-hosted, not belmont.gov — this one is a
    plausible non-403 target since it's on hcd.ca.gov, not belmont.gov, though not
    fetched in this pass):
    https://www.hcd.ca.gov/sites/default/files/docs/planning-and-community/housing-element/smaBelmontDraftout112222.pdf

- **Est. pull effort:** **Medium–High.** Municode returned 403 to automated fetch,
  same friction class as Menlo Park's eCode360; the zoning-ordinance primary PDF is
  now specifically identified (URL above) but likewise blocked; and the housing
  element compliance question needs a live, single-source-of-truth check against
  HCD's own compliance tracker rather than relying on either secondary source found
  here.

---

## 4. Login Walls / CAPTCHA / Pagination Notes for a Human+Browser Session

- **belmont.gov:** Every belmont.gov URL fetched in this pass (meetings-agendas-
  minutes hub, Planning Commission page, and the Zoning Ordinance Section 4 PDF at
  `/home/showpublisheddocument/15634/...`) returned **HTTP 403 Forbidden** to the
  automated WebFetch tool. This is consistent with a bot/WAF block (Cloudflare- or
  Akamai-style challenge, or a referer/user-agent check) rather than a true
  credentialed login — no search snippet or prior knowledge suggests belmont.gov
  requires a login for public meeting documents. **Unverified-but-plausible**: a
  live browser session should load these pages normally; if an interstitial
  challenge appears, wait it out rather than treating it as an auth wall.
- **library.municode.com:** Also returned HTTP 403 to WebFetch on every attempted
  page (main code index, Chapter 35 Zoning, Chapter 17 Planning). Municode
  generally serves public code text without login, so this is most likely the same
  class of automated-fetch block as belmont.gov, not a real paywall — but this is
  **unverified-but-plausible**, not confirmed live.
- **gocodebook.com:** By contrast, this secondary aggregator's page **fetched
  successfully** with no block — useful as a working fallback/cross-check source
  when the primary belmont.gov/Municode pages are unreachable by automated tooling,
  though it should not replace primary-source verification in a live session.
- **belmont-ca.granicus.com:** Not fetched directly in this pass (only surfaced via
  search-result titles/URLs), so no login/CAPTCHA behavior was directly observed;
  Granicus instances on other cities (e.g. Menlo Park) were previously observed to
  have no login wall, and there is no evidence suggesting Belmont's instance
  differs — treat as likely-open but unconfirmed here.
- **Pagination:** belmont.gov's meetings list uses a `-npage-NN-` URL segment (e.g.
  `-npage-35-`, `-npage-11-`, `-npage-139-` were all observed in different search
  snippets for what appear to be different list views/filters), suggesting a
  numbered-page pagination scheme on the "Meetings, Agendas & Minutes" and
  "List of Meetings & Events" views. Exact items-per-page and total page count were
  **not confirmed** since the pages could not be fetched directly.
- **cities.fairhousingelements.org:** Fetched successfully, no login wall or
  CAPTCHA encountered.

---

## Pull Plan

Ordered list of exact pages for a human+browser-extension session to visit first,
given that automated WebFetch was blocked (403) on both of Belmont's primary
document hosts (belmont.gov and library.municode.com) in this research pass:

1. https://www.belmont.gov/our-city/city-government/council-commissions-committees-boards/planning-commission
   — start here to confirm the Planning Commission's current agenda/minutes links
   and identify the correct commissions/boards index for step 3.
2. https://www.belmont.gov/departments/meetings-agendas-minutes — general meetings
   hub; use to pull the trailing 6-12 months of Planning Commission (and any other
   relevant commission) agendas/minutes once the 403 block is bypassed by a real
   browser session.
3. https://www.belmont.gov/our-city/city-government/council-commissions-committees-boards
   (commissions/boards index — exact slug not independently confirmed in this pass,
   navigate from belmont.gov's main nav if this exact URL 404s) — to positively
   identify whether the Parking and Traffic Safety Committee or the Park and
   Recreation Commission (or another body) is the actual transportation/mobility-
   equivalent commission, per Section 2's open question.
4. https://library.municode.com/ca/belmont/codes/code_of_ordinances — Municode
   home; confirm the "current through Ordinance ___" banner live.
5. https://library.municode.com/ca/belmont/codes/code_of_ordinances?nodeId=CICO_CH35ZOUSRE
   — Chapter 35, Zoning Use Regulations; drill to R-1 district standards
   (§4.2.3–4.2.6 per GoCodebook's citation) to **directly verify** the slope-based
   FAR (~0.533), gross floor area cap (3,500–4,500 sf), and 28 ft height figures
   against the actual code text, closing the verification gap flagged in Section 3.
6. https://www.belmont.gov/home/showpublisheddocument/15634/637387871000130000 —
   candidate primary-source PDF, "Zoning Ordinance 4-1 SECTION 4 – RESIDENTIAL";
   open directly in a real browser to read the residential development-standards
   tables.
7. https://belmont-ca.granicus.com/MetaViewer.php?view_id=1&clip_id=48&meta_id=4672
   — candidate full/consolidated Zoning Ordinance (Ordinance 360) document; useful
   as a fallback if step 6's PDF is partial or superseded.
8. https://www.hcd.ca.gov/housing-element/compliance — state HCD's own official
   compliance tracker; use this to resolve the Section 3 contradiction between
   "compliant" (WebSearch AI-summary claims) and "out of compliance, 43% of RHNA
   pace" (direct fetch of cities.fairhousingelements.org) for Belmont specifically.
9. https://cities.fairhousingelements.org/cities/belmont — re-check for an "as of"
   timestamp on the page (not visible in this pass's fetched excerpt) to date the
   "out of compliance" finding relative to the Sept 2024 8-jurisdiction list in the
   companion county report.
10. https://www.belmont.gov/departments/administrative-services/city-manager/housing/housing-element-documents
    — Belmont's own housing element document set, for the adopted 2023-2031
    Housing Element and any subsequent HCD correspondence/re-certification letters.
