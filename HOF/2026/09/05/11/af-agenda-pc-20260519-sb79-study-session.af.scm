;; path | HOF/2026/09/05/11/af-agenda-pc-20260519-sb79-study-session.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260519-sb79-study-session
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260519-sb79-study-session) -> alist
;; Description: REAL /fundamental-ingestion instance for San Bruno. San Bruno Planning
;;   Commission / City Council Joint Special Meeting, 5/19/2026 (agenda amended 5/18/2026),
;;   Item 3A: Joint City Council/Planning Commission Study Session to receive an update on
;;   SB 79 (the 2025 state transit-oriented-housing law). The staff report (page 3 of the
;;   packet PDF) states: SB 79 was signed into law on October 10, 2025, allows greater
;;   heights/intensities for housing projects within a half mile of qualifying transit stops
;;   regardless of local regulations, takes effect July 1, 2026, and creates three
;;   Transit-Oriented Development (TOD) zones based on distance from a qualifying transit
;;   stop. San Bruno has two qualifying transit stops (Caltrain and BART stations) and 2,512
;;   parcels within its two TOD zones — though the staff report notes SB 79 exempts certain
;;   parcels, including those incompatible with residential use under the Airport Land Use
;;   Compatibility Plan (ALUCP), which disqualifies the majority of parcels around the BART
;;   station and northeast of the Caltrain station (per the staff report text; the exact
;;   post-exemption parcel count is NOT stated in the extracted text and is not asserted
;;   here). The same joint-session agenda also included Item 3B (Elevate San Bruno
;;   Initiative update), Item 3C (Tanforan Redevelopment Project update — cross-referencing
;;   the Tanforan transit-oriented mixed-use village project already flagged in
;;   HOF/sources/san-bruno/eligibility-snapshot.md), Item 3D (Downtown Zoning Adjustments
;;   study session), and a formal Public Hearing Item 4A recommending City Council amend
;;   three General Plan Elements (Health and Safety; Public Facilities and Services;
;;   Environmental Resources and Conservation) for state-law compliance and to incorporate
;;   the San Mateo County Multijurisdictional Local Hazard Mitigation Plan by reference —
;;   this citizen records Item 3A (the SB 79 study session) specifically, as the single most
;;   housing-substantive, clearly-dated item on this agenda; the sibling items (3B-3D, 4A)
;;   are noted here for context but not separately ingested as their own citizens in this
;;   pass.
;; Source: https://sanbruno.ca.gov/AgendaCenter/ViewFile/Agenda/_05192026-2572 — direct
;;   CivicPlus AgendaCenter PDF for "San Bruno Planning Commission Special Meeting Packet -
;;   May 19, 2026" (verified: HTTP 200, content-type application/pdf, 119 pages, downloaded
;;   and text-extracted with pypdf; page 2 of the PDF lists Item 3A-3D and 4A verbatim as
;;   quoted above, and page 3 begins the SB 79 staff report with the October 10, 2025 signing
;;   date, half-mile/TOD-zone framework, and 2,512-parcel figure quoted above).
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 11:05:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260519-sb79-study-session)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records the SB 79 transit-housing law and parcel-count detail
;;   Given (af:agenda-pc-20260519-sb79-study-session)
;;   Then the 'agenda-item field mentions "SB 79" and "2,512 parcels"

(define (af:agenda-pc-20260519-sb79-study-session)
  (af:city-agenda-item
    "san-bruno"
    'planning-commission
    "2026-05-19"
    "Item 3A (Joint City Council/Planning Commission Special Meeting): Study Session to Receive an Update on SB 79 — the state law signed October 10, 2025, allowing greater heights and intensities for housing projects within a half mile of qualifying transit stops regardless of local zoning, effective July 1, 2026, creating three Transit-Oriented Development (TOD) zones by distance from a qualifying stop; San Bruno has two qualifying transit stops (Caltrain and BART) and 2,512 parcels within its two TOD zones, though SB 79 exempts parcels incompatible with residential use under the Airport Land Use Compatibility Plan (ALUCP), which disqualifies most parcels near the BART station and northeast of the Caltrain station; same joint-session agenda also covered the Elevate San Bruno Initiative (3B), Tanforan Redevelopment Project (3C), and Downtown Zoning Adjustments (3D) study sessions"
    "https://sanbruno.ca.gov/AgendaCenter/ViewFile/Agenda/_05192026-2572"))
