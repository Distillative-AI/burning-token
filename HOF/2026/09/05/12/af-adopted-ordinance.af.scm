;; path | HOF/2026/09/05/12/af-adopted-ordinance.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: adopted-ordinance
;; Order: 1 (Atomic — a single adopted ordinance / zoning text amendment / ballot measure
;;   as pure data; the structural record /fundamental-ingestion will populate from raw pulls
;;   under HOF/sources/<city>/new-laws/)
;; Signature: (af:adopted-ordinance city ordinance-number title adopted-date effective-date
;;              source-url) -> alist
;;   city            : string       — city slug matching HOF/sources/<city-slug>/
;;   ordinance-number: string|#f    — e.g. "2023-12"; #f if not yet assigned (e.g. a pending
;;                     ballot measure or zoning text amendment without a formal ordinance #)
;;   title           : string       — official/short title as published (e.g. municode /
;;                     law-library title, or ballot measure name)
;;   adopted-date    : string|#f    — ISO 8601 "YYYY-MM-DD" council/board adoption date; #f
;;                     if only an introduction date is known at pull time
;;   effective-date  : string|#f    — ISO 8601 "YYYY-MM-DD"; #f if unknown/not yet effective
;;   source-url      : string       — direct URL (municode/law-library ordinance page, city
;;                     clerk "recently adopted ordinances" page, or ballot-measure page)
;; Description: SCHEMA-ONLY constructor. No live ordinance data has been ingested yet — every
;;   field below is a placeholder/example shape matching what HOF/sources/<city>/SOURCES.md
;;   pull plans describe (municode/law-library ordinance index, dated adoption/effective
;;   dates, source URL). /fundamental-ingestion is the only process authorized to populate
;;   real instances from HOF/sources/<city>/new-laws/. Sibling functions
;;   af:ordinance-provenance-complete? (schema guard) and af:adopted-ordinance-example
;;   (placeholder instance) live in their own one-function-per-file siblings in this same
;;   directory per Constitution Article I §2 (one (define ...) per file).
;; Created: 2026-09-05 12:00:00
;;
;; @gherkin
;; Scenario: construct an adopted ordinance record with a known ordinance number
;;   Given city "san-mateo", ordinance-number "2023-12",
;;     title "EXAMPLE PLACEHOLDER — New Objective Design Standards for Multi-Family and
;;       Residential Mixed-Use Development", adopted-date "2023-12-04",
;;     effective-date "2024-01-03",
;;     source-url "https://law.cityofsanmateo.org/us/ca/cities/san-mateo/ordinances/2023/12"
;;   When af:adopted-ordinance is applied
;;   Then the result is an alist with keys city, ordinance-number, title, adopted-date,
;;     effective-date, source-url

(define (af:adopted-ordinance city ordinance-number title adopted-date effective-date source-url)
  (list (cons 'city city)
        (cons 'ordinance-number ordinance-number)
        (cons 'title title)
        (cons 'adopted-date adopted-date)
        (cons 'effective-date effective-date)
        (cons 'source-url source-url)))
