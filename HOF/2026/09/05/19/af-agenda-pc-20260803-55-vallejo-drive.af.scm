;; path | HOF/2026/09/05/19/af-agenda-pc-20260803-55-vallejo-drive.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260803-55-vallejo-drive
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260803-55-vallejo-drive) -> alist
;; Description: REAL /fundamental-ingestion instance. Millbrae Planning Commission meeting
;;   8/3/2026, Item 4.a: 55 Vallejo Drive (APN 024-202-100), Design Review Permit 2026-15 —
;;   655 sq ft first-story addition + 858 sq ft second-story addition + remodel of an
;;   existing one-story residence, PLUS Exception requests for an existing nonconforming
;;   north side setback and an existing nonconforming garage, in the R-1 (Single-Family
;;   Residential) zoning district. Ground-truth illustration of the R-1 discretionary-review
;;   friction pattern documented at policy level in
;;   reports/san-mateo-housing-structural-moats.md §1.1 — an ordinary single-family addition
;;   requires case-by-case Planning Commission Exception approval solely because the existing
;;   structure predates current setback/garage nonconformity standards, not because of any
;;   defect in the proposed addition itself.
;; Source: HOF/sources/millbrae/planning-commission/agendas/2026-agenda-index.md
;;   (derived from https://ci.millbrae.ca.us/AgendaCenter/ViewFile/Agenda/_08032026-393,
;;   pulled live via browser session + curl/pdftotext, no login wall)
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 19:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260803-55-vallejo-drive)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t

(define (af:agenda-pc-20260803-55-vallejo-drive)
  (af:city-agenda-item
    "millbrae"
    'planning-commission
    "2026-08-03"
    "Item 4.a: 55 Vallejo Drive (APN 024-202-100) — Design Review Permit 2026-15: 655 sq ft first-story addition + 858 sq ft second-story addition + remodel of existing one-story residence, PLUS Exception requests for an existing nonconforming north side setback and an existing nonconforming garage, R-1 (Single-Family Residential) zoning district. Ground-truth instance of R-1 discretionary-review friction (see reports/san-mateo-housing-structural-moats.md §1.1)."
    "https://ci.millbrae.ca.us/AgendaCenter/ViewFile/Agenda/_08032026-393"))
