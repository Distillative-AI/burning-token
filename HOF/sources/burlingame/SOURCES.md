# Burlingame, CA — Source Map

Researched via WebSearch/WebFetch only (no live browser). Confirmed URLs are marked;
anything I could not directly confirm is flagged explicitly rather than guessed.

---

## 1. Planning Commission — Agendas & Minutes

- **Name:** City of Burlingame Planning Commission
- **URL (current, primary):** https://www.burlingame.org/944/Planning-Commission
  (city website landing page; links out to the Granicus archive/viewer below)
- **Platform:** **Granicus** — confirmed via WebFetch of the Granicus viewer.
  - Archive/viewer: https://burlingameca.granicus.com/ViewPublisher.php?view_id=4
  - Individual document examples confirmed to exist:
    - https://burlingameca.granicus.com/GeneratedAgendaViewer.php?view_id=4&clip_id=182
    - https://burlingameca.granicus.com/AgendaViewer.php?view_id=4&clip_id=1663
    - https://burlingameca.granicus.com/MinutesViewer.php?view_id=4&clip_id=1847
    - https://burlingameca.granicus.com/MediaPlayer.php?view_id=4&clip_id=678
    - https://burlingameca.granicus.com/DocumentViewer.php?file=burlingameca_fbe641895c910dee6db0bb60872fbb63.pdf&view=1
      (confirmed a valid PDF, ~180.9KB; text was **not** extractable via WebFetch's
      markdown conversion — it's a compressed/FlateDecode PDF stream, needs a dedicated
      PDF-text-extraction pass, not WebFetch, to read contents)
  - The city's own DocumentCenter also mirrors individual PDFs directly, e.g.
    https://burlingame.org/DocumentCenter/View/6408/April-14-2025-Planning-Commission-Meeting-Agenda
- **Archive depth:** **Confirmed by direct fetch of the Granicus ViewPublisher page** —
  earliest listed meeting **January 9, 2017**, latest listed **August 24, 2026** (i.e.
  the archive spans at least ~9.5 years and is current). This is a directly-fetched
  confirmation, not a search-snippet inference.
- **Structure per entry:** agenda link, minutes link (when available), video playback,
  and RSS feed subscriptions for agendas and minutes. Some entries are marked "Meeting
  Cancelled" or are joint sessions with City Council.
- **Access notes:** No login wall observed on the Granicus viewer pages themselves.
  Individual Granicus PDFs are fetchable as raw binary but their text is not
  machine-readable via a plain WebFetch — plan for a PDF-extraction step. No CAPTCHA
  encountered.
- **Est. pull effort:** **Low–Medium.** The ViewPublisher index page is a clean single
  entry point covering the full ~9.5-year archive; the friction is downstream (PDF text
  extraction), not discovery.

---

## 2. Transportation-equivalent Commission

- **Name:** **Traffic, Safety and Parking Commission (TSPC)** — confirmed to exist.
  Per city site text, its charter is "to provide the general public with a citizen's
  forum for discussing matters pertaining to traffic, parking, and pedestrian safety"
  and to serve as "the City's first-line source" for such concerns.
- **City info page:** https://www.burlingame.org/201/Traffic-Safety-Parking-Commission
- **Municipal code chapter establishing it:** https://ecode360.com/44507659
  (Chapter 3.22: Traffic, Safety and Parking Commission)
- **Platform — split across two systems (a genuine finding, not an error):** unlike
  Planning Commission (Granicus-only), TSPC records are split between Granicus and
  Legistar:
  - **Granicus** media entries exist historically, e.g.
    https://burlingameca.granicus.com/MediaPlayer.php?view_id=9&clip_id=1744
    (June 13, 2024 meeting) and as far back as
    https://burlingameca.granicus.com/MediaPlayer.php?view_id=9&clip_id=453
    (September 8, 2016 meeting) — suggesting the Granicus-side TSPC archive reaches
    back to at least **2016**.
  - **Legistar** is also in use for more recent agendas, e.g.
    https://burlingameca.legistar1.com/burlingameca/meetings/2026/3/2490_A_Traffic_Safety_and_Parking_Commission_26-03-12_Meeting_Agenda.pdf
    (confirmed a valid PDF via WebFetch, March 12, 2026 meeting; text not extractable
    via WebFetch — same binary-PDF caveat as above).
  - Direct city DocumentCenter PDFs also exist independently of both platforms, e.g.
    https://burlingame.org/DocumentCenter/View/9148/TSPC-Agenda-Packet---June-2026
    and https://burlingame.org/DocumentCenter/View/4114/TSPC-Agenda-Packet---May-2024-PDF
  - **This looks like a platform migration in progress or completed (Granicus →
    Legistar) for at least this body, while Planning Commission remains on Granicus.**
    The exact cutover date between the two systems was **not confirmed** in this pass —
    flag as an open question, do not assume a clean date boundary.
- **Access notes:** The Burlingame Legistar meetings **index** page
  (`burlingameca.legistar1.com/burlingameca/meetings`) returned **HTTP 403 Forbidden**
  on WebFetch, but individual deep-linked Legistar PDF files (e.g. the TSPC March 2026
  agenda above) **were** fetchable directly. No CAPTCHA encountered.
- **Est. pull effort:** **Medium.** Two platforms to check per period (Granicus + city
  DocumentCenter + Legistar), and the Legistar index itself is bot-gated even though
  direct PDF links work — need either known direct links or a live browser session to
  enumerate the Legistar-side listing.

---

## 3. Recently Adopted Housing/Zoning Ordinances & Housing Element Compliance

- **6th Cycle Housing Element (2023–2031):** Adopted by City Council **December 18,
  2023** (per SM Daily Journal coverage and city documents).
  - Full adopted PDF:
    https://cms6.revize.com/revize/burlingamecity/document_center/Planning/General%20and%20Specific%20Plans/Burlingame%202023-2031%20Housing%20Element%20-%20Adoption%20Final.pdf
  - EIR Addendum (Nov 2023):
    https://cms6.revize.com/revize/burlingamecity/document_center/Planning/Burlingame%20HEU%20EIR%20Addendum_November%202023.pdf
  - City landing pages: https://burlingame.org/268/Housing-Element and
    https://www.burlingame.org/280/About-the-Housing-Element
  - RHNA allocation reported as **3,257 units** over the 8-year cycle.
  - **HCD post-adoption certification letter was NOT located/confirmed** in this pass —
    only that HCD had found the pre-adoption draft would "substantially comply." The
    only HCD document found by URL is the **5th cycle (2015)** adopted element:
    https://www.hcd.ca.gov/housing-elements/docs/burlingame_5th_adopted011215.pdf —
    this is **not** the 6th cycle and should not be cited as current-cycle compliance
    evidence.
- **North Burlingame/Rollins Road Specific Plan** — confirmed central to the Housing
  Element's site inventory (an 88-acre area near the Millbrae BART/Caltrain station).
  - CEQAnet project record: https://ceqanet.lci.ca.gov/2004062012
    (Mitigated Negative Declaration: https://ceqanet.lci.ca.gov/2004062012/2)
  - ABAG rezoning project profile (PDF):
    https://abag.ca.gov/sites/default/files/documents/2024-07/Rezoning-project-profile-Burlingame-North-Rollins.pdf
  - Dedicated public-facing plan site: https://www.northrollinsspecificplan.com/
    (FAQ: https://www.northrollinsspecificplan.com/faqs)
  - Reported specifics from secondary sources (**not independently verified against a
    primary planning document — treat as claims pending confirmation**): rezoning
    allows conversion from single-story warehouse use to up to six-story apartment
    buildings; plan allows **1,557 units** vs. **1,199** under the prior General Plan;
    densities 25–100 du/acre; heights to 85 ft in places; 10% affordable-to-moderate-
    income minimum.
  - Concrete built example: **30 Ingold Road** — a 320-unit, 7-story mixed-use project
    with 50 affordable units, under construction as of a May 2026 Hoodline report:
    https://hoodline.com/2026/05/ingold-road-shakeup-burlingame-warehouse-strip-trades-wrenches-for-320-new-homes/
- **Density Bonus Ordinance:** Confirmed to exist in the municipal code — "Affordable
  Housing and Density Bonus" chapter, citing compliance with Gov. Code §65915–65918:
  https://ecode360.com/44514834
- **Active zoning-code amendment activity (2024–2026), evidenced via CEQA filings (not
  independently confirmed for final adoption status/date):**
  - Accessory Dwelling Unit ordinance update (Title 25 BMC amendment):
    https://ceqanet.lci.ca.gov/2024120927
  - Zoning Code update (Title 25 BMC) and Condominium Conversion Permits (Ch. 26.32)
    update: https://ceqanet.lci.ca.gov/2026030245
  - These are CEQAnet filing records, evidence of amendment activity in progress — the
    underlying staff reports/ordinance text and final adoption dates were **not**
    fetched/confirmed in this pass.
- **Builder's Remedy:** No Burlingame-specific Builder's Remedy project or dispute was
  found. Only general statewide context on AB 1893/Wicks reform (effective for
  applications submitted after Jan 1, 2025) surfaced via secondary legal-commentary
  sources (Hanson Bridgett, Allen Matkins) — not Burlingame-specific, not cited as fact.
- **Ballot measures:** A **2016 rent-control measure ("Measure R")** surfaced in a
  general secondary-source context — **not independently confirmed via a primary
  source** in this pass. **No evidence found of any 2024 or 2026 Burlingame-specific
  housing/zoning ballot measure.** Treat this as "not found in this search pass," not
  as confirmed non-existence.
- **Municipal code host:** **eCode360 (General Code)**, not Municode. Root:
  https://ecode360.com/BU4910
  - **Ordinance-currency figure is CONTESTED between two sources and unresolved** — one
    search snippet states the code is "current through Ordinance No. 2049, adopted
    April 20, 2026"; a separate search surfaced an apparently older figure ("current
    through Ordinance 1994... August 2021 supplement") from the city's own Codes &
    Regulations page (https://www.burlingame.org/666/Codes-Regulations). **Do not cite
    either number as fact** — this needs live resolution.
  - Alternate/mirror code host found: **QCode** — https://qcode.us/codes/burlingame/
    (currency/completeness not verified).

---

## 4. Login Walls / CAPTCHA / Pagination Notes for a Human+Browser Session

- **burlingame.org (city site):** No login wall or CAPTCHA encountered; Planning
  Commission and TSPC pages fetched normally. No pagination issues surfaced. One
  legacy-tech note: the Planning Commission page mentions **"Silverlight is required to
  view the videos"** — a dead-plugin dependency affecting video playback specifically
  (agendas/minutes/PDFs are unaffected by this).
- **Granicus (burlingameca.granicus.com):** No login wall observed on viewer pages.
  PDFs fetch as valid binary but are not text-extractable via plain WebFetch
  (FlateDecode-compressed streams) — plan for a dedicated PDF text-extraction tool.
- **Legistar (burlingameca.legistar1.com):** The **meetings index page returned HTTP
  403 Forbidden** on WebFetch. Individual deep-linked PDF files under the same domain
  **were** fetchable directly despite the index block — so known/discovered direct
  links work even when the listing page doesn't. A live browser session would likely
  resolve the index-page block.
- **eCode360 (ecode360.com/BU4910):** **Returned HTTP 403 Forbidden** on direct
  WebFetch of the root page — consistent with eCode360's known bot/JS-challenge
  behavior, not a true credentialed login wall. Deep-linked chapter pages (e.g.
  `/44507659`, `/44514834`) appeared indexed/retrievable via search-engine snippets,
  but their live fetchability was **not independently re-confirmed** given the root
  403 — treat the whole site as likely blocked for automated fetch until proven
  otherwise in a live session.
- **No CAPTCHA was encountered** on any Burlingame page in this research pass.

---

## Pull Plan

Ordered list of exact pages for a human+browser-extension session to visit first, to
grab the most recent 6–12 months of agendas plus the Housing Element / zoning record:

1. https://burlingameca.granicus.com/ViewPublisher.php?view_id=4 — start here for
   Planning Commission; grab the most recent agendas/minutes/video links directly (the
   full ~9.5-year archive, back to Jan 2017, is enumerable from this one page).
2. https://www.burlingame.org/201/Traffic-Safety-Parking-Commission — TSPC landing
   page; follow through to both the Granicus channel (`view_id=9`) and the Legistar
   listing to reconcile which platform holds the current-period records.
3. https://burlingameca.legistar1.com/burlingameca/meetings/2026/3/2490_A_Traffic_Safety_and_Parking_Commission_26-03-12_Meeting_Agenda.pdf
   — known-good direct Legistar PDF link, useful as a template for guessing/confirming
   adjacent-month URLs if the Legistar index page stays blocked.
4. https://cms6.revize.com/revize/burlingamecity/document_center/Planning/General%20and%20Specific%20Plans/Burlingame%202023-2031%20Housing%20Element%20-%20Adoption%20Final.pdf
   — adopted 6th Cycle Housing Element (Dec 18, 2023); pair with a live search for the
   HCD post-adoption certification letter, which was not located in this pass.
5. https://www.northrollinsspecificplan.com/ and
   https://abag.ca.gov/sites/default/files/documents/2024-07/Rezoning-project-profile-Burlingame-North-Rollins.pdf
   — North Burlingame/Rollins Road Specific Plan primary/near-primary sources, to
   verify the unit-count and density figures currently sourced only from secondary
   reporting.
6. https://ecode360.com/BU4910 — Municipal Code home; on a live browser session,
   resolve the contested "current through Ordinance ___" banner (2049/April 2026 vs.
   1994/August 2021) and drill into Title 25 (Zoning) and the Density Bonus chapter
   (https://ecode360.com/44514834).
7. https://ceqanet.lci.ca.gov/2024120927 and https://ceqanet.lci.ca.gov/2026030245 —
   ADU ordinance update and Zoning Code/Condominium Conversion update CEQA filings；
   confirm final adoption status and dates via the linked staff reports.
8. https://www.burlingame.org/666/Codes-Regulations — city's own code-currency page,
   to help resolve the eCode360 ordinance-number discrepancy noted above.
9. San Mateo County Registrar/Elections site (URL not confirmed in this pass — search
   live) — to independently verify whether any housing/zoning-related ballot measure
   has qualified for a Burlingame ballot in 2024–2026, since none was found via
   WebSearch/WebFetch alone.
