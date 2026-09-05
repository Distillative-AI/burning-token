;; path | HOF/2026/09/05/12/af-ordinance-provenance-complete.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: ordinance-provenance-complete?
;; Order: 1 (Atomic — pure predicate)
;; Signature: (af:ordinance-provenance-complete? record) -> boolean
;; Description: Schema guard: an af:adopted-ordinance record is provenance-complete only
;;   when it carries a real ordinance-number AND an adopted-date. Ballot measures and
;;   pending zoning text amendments without either are legitimately incomplete pending
;;   /fundamental-ingestion, not an error — this predicate lets downstream folds/filters
;;   distinguish "fully adopted with a citable ordinance #" from "in-flight."
;; Created: 2026-09-05 12:00:00
;;
;; @gherkin
;; Scenario: a record with both ordinance-number and adopted-date is complete
;;   Given a record built by af:adopted-ordinance with ordinance-number "2023-12" and
;;     adopted-date "2023-12-04"
;;   When af:ordinance-provenance-complete? is applied
;;   Then the result is #t
;;
;; Scenario: a record missing ordinance-number is incomplete
;;   Given a record with ordinance-number #f
;;   When af:ordinance-provenance-complete? is applied
;;   Then the result is #f

(define (af:ordinance-provenance-complete? record)
  (and (cdr (assoc 'ordinance-number record))
       (cdr (assoc 'adopted-date record))
       #t))
