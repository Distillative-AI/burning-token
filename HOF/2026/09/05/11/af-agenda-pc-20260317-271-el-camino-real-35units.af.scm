;; path | HOF/2026/09/05/11/af-agenda-pc-20260317-271-el-camino-real-35units.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260317-271-el-camino-real-35units
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260317-271-el-camino-real-35units) -> alist
;; Description: REAL /fundamental-ingestion instance for San Bruno. San Bruno Planning
;;   Commission Regular Meeting 3/17/2026, Public Hearing Item A: 271 El Camino Real (APNs:
;;   020-406-730, -700, -690, -870, -590, -790) — Architectural Review Permit and Vesting
;;   Tentative Map (also described as a Lot Merger in the city's own Development Update PDFs)
;;   to construct a four-story, 64,323-square-foot residential building fronting El Camino
;;   Real: one ground-floor level of parking and three levels of 35 condominium units above
;;   (the city's Development Update PDFs, e.g.
;;   https://sanbruno.ca.gov/DocumentCenter/View/8561/March_2026_Development_Update, separately
;;   describe 6 of the 35 units as affordable — this affordability breakdown is NOT stated on
;;   the agenda page text itself, only the total-unit and building description are, so treat
;;   the "6 affordable units" figure as corroborated-but-secondary rather than agenda-primary).
;;   The project also includes a detached two-story, 2,061-square-foot building containing two
;;   accessory dwelling units (ADUs) fronting Linden Avenue. Site is in the MX-R
;;   (Mixed-Use Residential) zoning district per the Development Update PDF (zoning district not
;;   independently confirmed against the PDF's own zoning map). Categorically exempt from CEQA
;;   under CEQA Guidelines §15332 (Class 32, In-Fill Development Projects). This item was
;;   CONTINUED from the February 17, 2026 Planning Commission meeting (confirmed both by the
;;   March 17 agenda's own "continued from" note and by the February 17, 2026 meeting minutes
;;   embedded later in the same March 17 packet PDF, which show the item was presented but no
;;   action was taken because Conditions of Approval were not attached to that packet).
;; Source: https://sanbruno.ca.gov/AgendaCenter/ViewFile/Agenda/_03172026-2537 — direct
;;   CivicPlus AgendaCenter PDF for "San Bruno Planning Commission Regular Meeting Packet -
;;   March 17, 2026" (verified: HTTP 200, content-type application/pdf, 175 pages, downloaded
;;   and text-extracted with pypdf; page 2 of the PDF contains the agenda text quoted above
;;   verbatim, and pages 5-6 contain the February 17, 2026 minutes corroborating the
;;   "continued from" relationship). Companion source (same project, prior meeting, also
;;   verified HTTP 200 / application/pdf but not text-extracted in this pass):
;;   https://sanbruno.ca.gov/AgendaCenter/ViewFile/Agenda/_02172026-2517 ("San Bruno Planning
;;   Commission Regular Meeting Packet - February 17, 2026"). Cross-reference (secondary,
;;   non-agenda source, corroborating unit/affordability/zoning detail):
;;   https://sanbruno.ca.gov/DocumentCenter/View/8561/March_2026_Development_Update.
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 11:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260317-271-el-camino-real-35units)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records the unit count and ADU detail for the 271 El Camino Real project
;;   Given (af:agenda-pc-20260317-271-el-camino-real-35units)
;;   Then the 'agenda-item field mentions "35 condominium units" and "two accessory dwelling
;;     units (ADUs)"

(define (af:agenda-pc-20260317-271-el-camino-real-35units)
  (af:city-agenda-item
    "san-bruno"
    'planning-commission
    "2026-03-17"
    "Public Hearing Item A: 271 El Camino Real (APNs: 020-406-730, -700, -690, -870, -590, -790) — Architectural Review Permit and Vesting Tentative Map to construct a four-story, 64,323-square-foot residential building fronting El Camino Real, consisting of one ground-floor level of parking and three levels of 35 condominium units above, plus a detached two-story, 2,061-square-foot building containing two accessory dwelling units (ADUs) fronting Linden Avenue; categorically exempt from CEQA under CEQA Guidelines § 15332 (Class 32, In-Fill Development Projects); continued from the February 17, 2026 Planning Commission meeting"
    "https://sanbruno.ca.gov/AgendaCenter/ViewFile/Agenda/_03172026-2537"))
