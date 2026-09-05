# Hillsborough, CA — Source Map

Researched via WebSearch/WebFetch only (no live browser). Confirmed URLs are marked;
anything I could not directly confirm is flagged explicitly rather than guessed.

---

## 1. Planning Commission — Agendas & Minutes

**CONFIRMED STRUCTURAL FACT: Hillsborough has no Planning Commission.** Unlike most
California cities, land-use/design review is split across two smaller bodies under
direct Planning Division staff supervision:

- **Architecture and Design Review Board (ADRB)** — Hillsborough's de facto planning-commission
  equivalent for substantial development (new houses, additions, subdivisions, landscaping,
  fencing/gates, tennis courts). 5-member volunteer board appointed by Town Council.
  - URL (current/most recent agenda): `https://www.hillsborough.net/AgendaCenter/MostRecent/Architecture-Design-Review-Board-1-1` — CONFIRMED
  - URL (full archive): `https://www.hillsborough.net/AgendaCenter/Architecture-Design-Review-Board-1` — CONFIRMED
  - Board info page: `https://www.hillsborough.net/243/Architecture-and-Design-Review-Board` — CONFIRMED
  - Platform: **CivicEngage** (Granicus-family CMS product line; not Legistar, not Granicus
    "Legistar Agenda Management" specifically, not CivicClerk) — CONFIRMED via page branding/URL structure
  - Archive depth: back to **2004** on the Agenda Center listing for this board — CONFIRMED
    (deepest archive of any Hillsborough body found)
  - Meeting schedule: first Monday of each month, Town Hall, 1600 Floribunda Ave — CONFIRMED
  - Access notes: no login wall observed on agenda/minutes pages; PDFs served directly under
    `/AgendaCenter/ViewFile/...` paths
  - Est. pull effort: low — direct PDF links, straightforward pagination by year in the Agenda Center UI

- **Housing Element Advisory Committee (HEAC)** — ad-hoc, 17-member staff advisory committee
  specific to the 2023-2031 Housing Element cycle; not a standing land-use approval body.
  - Page: `https://www.hillsborough.net/612/Housing-Element-Advisory-Committee-HEAC` — CONFIRMED
  - Agendas: routed through the same Agenda Center (`/agendacenter`) — CONFIRMED
  - Most recent documented activity found: **December 2022** (6 numbered meetings + a "Meeting 4.5"
    from Feb–Dec 2022); unclear if still active post-adoption — **UNCONFIRMED** whether HEAC has met
    since the Housing Element's 2022/2023 adoption cycle
  - Est. pull effort: low; small archive, likely fully containable in one session

- **Planning Division** (staff function, not a hearing body): `https://www.hillsborough.net/241/Planning-Division` — CONFIRMED
  - Confirms two-tier review: Administrative Review (minor projects) and ADRB Review (substantial projects)
  - Contact: Planning Division, (650) 375-7422, VGrundmann@hillsborough.net

- **Town-wide Agenda Center root**: `https://www.hillsborough.net/AgendaCenter` — CONFIRMED
  - Bodies with published agendas here: City Council, Architecture and Design Review Board,
    Administrative Hearing Panel, Citizens Communication Advisory Committee, Financial Advisory
    Committee, City Council Subcommittee for the Town Hall Complex Project, FAC Subcommittee for
    the Long-Term Financial Funding Plan, Hillsborough Public Improvement Corporation
  - Most bodies' archives run **2019–2025**; ADRB is the outlier reaching back to 2004
  - City Council meets 2nd Monday of each month, 6:00 PM, Council Chambers, Town Hall

---

## 2. Transportation Commission (or equivalent)

**UNCONFIRMED / LIKELY DOES NOT EXIST as a standing public body.** Targeted search for a
Hillsborough, CA (San Mateo County) transportation/traffic-safety commission returned no
results — all matches were for the unrelated Hillsborough County, Florida Transportation
Planning Organization (Plan Hillsborough / TPO), which is a different jurisdiction entirely
and out of scope.

- No town.net page, Agenda Center entry, or news reference found for a Hillsborough (CA)
  Traffic Safety Committee, Transportation Commission, or equivalent.
- Given the town's small size (~11,000 residents) and its committee list above (City Council,
  ADRB, Administrative Hearing Panel, Citizens Communication Advisory Committee, Financial
  Advisory Committee, HPIC), it is plausible transportation/traffic matters are handled directly
  by Town Council or by Public Works staff without a dedicated citizen commission — but this is
  an inference, **not confirmed**. Flag for live-browser check of the full committee/commission
  list at `https://www.hillsborough.net` (Government > Boards & Commissions, or similar nav path)
  before concluding no such body exists.

---

## 3. Recently Adopted Ordinances / Housing-Related Municipal Code Updates

- **Municipal code host**: **Municode Library** — CONFIRMED
  - Root: `https://library.municode.com/ca/hillsborough/codes/code_of_ordinances`
  - Zoning title: `https://library.municode.com/ca/hillsborough/codes/code_of_ordinances?nodeId=TIT17ZO` (Title 17 — Zoning)
  - Sub-chapter example: `https://library.municode.com/ca/hillsborough/codes/code_of_ordinances?nodeId=TIT17ZO_CH17.04GEPR` (17.04 General Provisions)
  - Ordinance list/disposition table: `https://library.municode.com/ca/hillsborough/ordinances/code_of_ordinances` — URL found via search, **not fetch-confirmed** (see §4 — Municode blocked the automated fetch with HTTP 403)
  - Search snippet indicated the code is "currently codified through Ordinance No. 799, enacted
    December 9, 2025" — **PARTIALLY CONFIRMED** (from search result summary text only, not a direct
    page fetch; treat the exact ordinance number/date as needing live-browser verification)
  - Town's own code landing page: `https://www.hillsborough.net/132/Codes` — CONFIRMED URL exists, content not fetched

- **eCode360**: NOT used by Hillsborough — no eCode360 results returned; Municode is the confirmed host.

- **ADU Ordinance No. 787** (adopted December 12, 2022) — HCD found this ordinance
  **non-compliant** with State ADU/JADU law:
  - HCD findings letter, dated **May 30, 2024**: `https://www.hcd.ca.gov/sites/default/files/docs/policy-and-research/ordinance-review-letters/hillsborough-adu-findings-053024.pdf` — CONFIRMED to exist (URL located directly in HCD's ordinance-review-letters directory); **full text not readable** — WebFetch returned only raw/garbled PDF binary structure, so specific findings below are drawn from a WebSearch result summary, not a direct read of the source, and should be re-verified with a live browser or PDF-native tool
  - Per that search summary: HCD cited noncompliance under Government Code §66326(a), specifically
    flagging Hillsborough Municipal Code §17.52.020(C)(1)(b) (Unit Allowance — restricting
    combining an ADU created under one provision with an ADU under another). Town had until
    **June 30, 2024** to respond.
  - Related public comment on record: CalHDF (California Housing Defense Fund) comment letter re:
    the Town's proposed ADU ordinance ahead of a **December 9, 2024** Council meeting —
    `https://www.hillsborough.net/DocumentCenter/View/5987/CalHDF-comment-re-proposed-ADU-ordinance-for-12_9_24-Council-meeting` — CONFIRMED URL, content not fetched
  - **UNCONFIRMED**: whether the Town has since adopted a corrected/compliant ADU ordinance and
    whether HCD has issued a follow-up compliance letter. This is a live open thread worth checking
    first in a browser session.

- **Housing Element (2023–2031, RHNA Cycle 6)** — the single most load-bearing/newsworthy item
  for this town, and the intended structural contrast case:
  - Town's Housing Element Update hub: `https://www.hillsborough.net/553/2023-2031-Housing-Element-Update` — CONFIRMED
  - News flash summary page: `https://www.hillsborough.net/m/newsflash/Home/Detail/115` — CONFIRMED,
    fetched directly. Confirms:
    - RHNA allocation: **554 units** for the 2023–2031 cycle
    - HCD **did certify** Hillsborough's Housing Element as compliant with state housing law
      (the fetched page states this plainly) — this **CONTRADICTS the research brief's assumption**
      that Hillsborough's housing element was found non-compliant; based on everything found in
      this pass, **no non-compliance finding, builder's remedy application, lawsuit, or state
      enforcement action specific to the Housing Element itself was located** — only the separate
      ADU-ordinance non-compliance finding above (a narrower, ADU-specific issue, not a whole-Housing-Element
      rejection)
    - Strategy leans almost entirely on ADUs (~400 anticipated units) and rezoning of **two
      town-owned parcels** to permit multi-unit housing (rezoned at the **January 8, 2024** Council
      meeting) — explicitly **no rezoning of privately-held estate-zoned parcels** was required to
      meet the RHNA number
    - A separate detail surfaced in search (not yet confirmed via direct fetch): **13 parcels of
      10+ acres** in town were reportedly proposed for rezoning to a new "RD-2" zoning district —
      **UNCONFIRMED**, needs primary-source (staff report or ordinance text) verification
    - Certification appears to trace to a **December 2022** Special Meeting environmental
      certification vote, with the exact HCD certification letter date **not confirmed** in this
      pass (multiple searches for the specific 2023/2024 HCD certification letter PDF did not
      surface a direct hillsborough-specific certification letter URL, unlike the ADU findings
      letter which was directly located)
  - Draft housing element on HCD's own site (6th draft, Oct 2022): `https://www.hcd.ca.gov/housing-elements/docs/hillsborough-6th-draft101222.pdf` — CONFIRMED URL exists
  - Housing Element FAQ (Aug 2022): `https://www.hillsborough.net/DocumentCenter/View/5151/Final-FAQ--HE-Update--08-17-22` — CONFIRMED URL exists

- **Structural contrast note** (per research brief): Hillsborough is overwhelmingly large-lot
  single-family estate zoning (1-acre minimum in most of the town, historically no multifamily
  zoning). Despite this profile — which made Hillsborough a plausible target for the same kind of
  state RHNA/builder's-remedy conflict seen in places like Woodside, Atherton, or Beverly Hills —
  **the evidence found in this pass shows Hillsborough achieved Housing Element certification**,
  primarily by locating multifamily capacity on two town-owned parcels rather than upzoning
  private estate lots, while separately drawing a narrower HCD non-compliance finding on its ADU
  ordinance mechanics. This is a materially different (and less adversarial) posture than towns
  whose *entire* Housing Element was rejected. No builder's remedy project, no lawsuit, and no
  broader state enforcement action targeting Hillsborough's Housing Element was found — **flag this
  explicitly as an open item for live-browser confirmation**, since a builder's remedy project
  triggered by the ADU non-compliance episode (if the Town missed its ADU cure deadline) is
  plausible but unconfirmed.
  - By contrast, Woodside, CA's 2022 attempt to zone itself entirely as mountain lion habitat to
    dodge SB 9 (widely covered nationally) is the closest known "structural moat" analog in this
    peer set — not directly researched in this pass but worth a follow-up search if a cross-town
    comparison section is being built.

---

## 4. Login Walls / CAPTCHA / Pagination Notes for a Human+Browser Session

- **hillsborough.net (CivicEngage/CivicPlus platform)**: No login wall or CAPTCHA encountered on
  any Agenda Center, board info, DocumentCenter, or NewsFlash page during automated WebFetch. PDFs
  under `/DocumentCenter/View/...` and `/AgendaCenter/ViewFile/...` fetched without authentication
  challenges.
- **Municode Library (library.municode.com)**: **HTTP 403 Forbidden** on direct WebFetch of the
  main code_of_ordinances page — CONFIRMED bot-gate behavior. A live browser session (rendering
  JS, carrying normal browser headers/cookies) will very likely be required to read the actual
  code text, ordinance disposition table, and confirm the current codification date/ordinance
  number. Treat all Municode content in §3 above as needing re-verification in a live session.
- **HCD ordinance-review-letters PDFs** (hcd.ca.gov): URLs resolve and download fine (no login
  wall), but the automated tool could not OCR/parse this particular scanned/structured PDF —
  returned raw PDF object stream data instead of extracted text. A live browser or a proper PDF
  text-extraction tool (not the generic WebFetch summarizer) will be needed to read these letters
  directly rather than relying on WebSearch result snippets.
- **Pagination**: Agenda Center archives appeared to be organized by board with "View All
  Agendas and Minutes" links rather than infinite scroll — should paginate cleanly by year/meeting
  in a live session.

---

## Pull Plan

1. `https://www.hillsborough.net/553/2023-2031-Housing-Element-Update` — primary Housing Element
   hub; find the actual HCD certification letter PDF and confirm exact certification date.
2. `https://www.hillsborough.net/m/newsflash/Home/Detail/115` — re-read live for the 13-parcel
   RD-2 rezoning claim and any builder's-remedy or non-compliance language missed by the fetch summarizer.
3. `https://www.hcd.ca.gov/sites/default/files/docs/policy-and-research/ordinance-review-letters/hillsborough-adu-findings-053024.pdf` —
   read directly (PDF viewer, not WebFetch) for the full May 30, 2024 ADU non-compliance findings.
4. `https://www.hillsborough.net/DocumentCenter/View/5987/CalHDF-comment-re-proposed-ADU-ordinance-for-12_9_24-Council-meeting` —
   check whether a corrected ADU ordinance was adopted at/after the Dec 9, 2024 Council meeting, and whether HCD issued a follow-up compliance letter.
5. `https://library.municode.com/ca/hillsborough/ordinances/code_of_ordinances` — ordinance
   disposition table; confirm most recent ordinance number/date (search snippet suggested Ord. No.
   799, Dec 9, 2025 — needs live confirmation past the 403 bot-gate).
6. `https://www.hillsborough.net/AgendaCenter/Architecture-Design-Review-Board-1` — full ADRB
   archive (back to 2004); pull recent 2023-2026 minutes for any Housing-Element-linked multi-unit
   project reviews on the two rezoned town-owned parcels.
7. `https://www.hillsborough.net` (main nav — Government > Boards & Commissions or similar) —
   confirm definitively whether any transportation/traffic-safety commission exists; §2 above is
   currently an absence-of-evidence finding, not a confirmed absence.
8. `https://www.hillsborough.net/612/Housing-Element-Advisory-Committee-HEAC` — confirm whether
   HEAC has met since December 2022 or is effectively dissolved post-adoption.
9. `https://www.hillsborough.net/241/Planning-Division` and `https://www.hillsborough.net/389/Building-Planning` —
   confirm current administrative-vs-ADRB review thresholds have not changed since the Housing Element adoption.
10. General news search (SF Chronicle, SM Daily Journal, SFist) for "Hillsborough" + "builder's
    remedy" or "housing element" dated 2025–2026 — the November 2025 SFist "Builder's Remedy
    Baron" piece surfaced in search may reference California towns including peninsula estates
    towns; worth a targeted re-read for any Hillsborough mention.
