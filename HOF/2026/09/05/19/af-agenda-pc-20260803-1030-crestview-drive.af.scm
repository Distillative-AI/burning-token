;; path | HOF/2026/09/05/19/af-agenda-pc-20260803-1030-crestview-drive.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260803-1030-crestview-drive
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260803-1030-crestview-drive) -> alist
;; Description: REAL /fundamental-ingestion instance. Millbrae Planning Commission meeting
;;   8/3/2026, Item 4.b: 1030 Crestview Drive (APN 021-210-180), Design Review Permit 2026-12
;;   — 3,149 sq ft rear addition + remodel of an existing 1,897 sq ft two-story residence,
;;   PLUS a Conditional Use Permit to modify an existing nonconforming garage encroaching into
;;   required front and north side setbacks, PLUS an Exception to retain existing substandard
;;   parking spaces, in the R-1 (Single-Family Residential) zoning district. A second
;;   ground-truth illustration (alongside 55 Vallejo Drive, same meeting) of the R-1
;;   discretionary-review friction pattern documented at policy level in
;;   reports/san-mateo-housing-structural-moats.md §1.1 — stacked discretionary approvals
;;   (Design Review + CUP + Exception) required for a rear addition purely because of
;;   pre-existing garage/parking nonconformity, not any defect in the proposed work.
;; Source: HOF/sources/millbrae/planning-commission/agendas/2026-agenda-index.md
;;   (derived from https://ci.millbrae.ca.us/AgendaCenter/ViewFile/Agenda/_08032026-393,
;;   pulled live via browser session + curl/pdftotext, no login wall)
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 19:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260803-1030-crestview-drive)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t

(define (af:agenda-pc-20260803-1030-crestview-drive)
  (af:city-agenda-item
    "millbrae"
    'planning-commission
    "2026-08-03"
    "Item 4.b: 1030 Crestview Drive (APN 021-210-180) — Design Review Permit 2026-12: 3,149 sq ft rear addition + remodel of existing 1,897 sq ft two-story residence, PLUS a Conditional Use Permit to modify an existing nonconforming garage encroaching into required front and north side setbacks, PLUS an Exception to retain existing substandard parking spaces, R-1 (Single-Family Residential) zoning district. Second ground-truth instance (same meeting) of R-1 discretionary-review friction (see reports/san-mateo-housing-structural-moats.md §1.1)."
    "https://ci.millbrae.ca.us/AgendaCenter/ViewFile/Agenda/_08032026-393"))
