;; path | HOF/2026/09/05/12/af-adopted-ordinance-example.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: adopted-ordinance-example
;; Order: 1 (Atomic — nullary constructor wrapping af:adopted-ordinance with placeholder data)
;; Signature: (af:adopted-ordinance-example) -> alist
;; Description: One illustrative placeholder instance of af:adopted-ordinance, NOT real data.
;;   Mirrors the San Mateo Ord. 2023-12 example named in HOF/sources/san-mateo/SOURCES.md,
;;   but the title/date/url text below is marked EXAMPLE PLACEHOLDER and must be re-verified
;;   by /fundamental-ingestion against the live source before being treated as fact.
;; Created: 2026-09-05 12:00:00
;;
;; @gherkin
;; Scenario: the example instance is provenance-complete under the schema
;;   Given (af:adopted-ordinance-example)
;;   When af:ordinance-provenance-complete? is applied
;;   Then the result is #t

(define (af:adopted-ordinance-example)
  (af:adopted-ordinance
    "san-mateo"
    "2023-12"
    "EXAMPLE PLACEHOLDER — New Objective Design Standards for Multi-Family and Residential Mixed-Use Development"
    "2023-12-04"
    "2024-01-03"
    "https://law.cityofsanmateo.org/us/ca/cities/san-mateo/ordinances/2023/12"))
