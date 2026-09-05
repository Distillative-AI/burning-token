;; path | HOF/2026/09/05/12/af-valid-agenda-body.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: valid-agenda-body?
;; Order: 1 (Atomic — pure predicate)
;; Signature: (af:valid-agenda-body? body) -> boolean
;; Description: Schema guard for af:city-agenda-item's `body` field. Allowed tags mirror
;;   HOF/sources/README.md's two pull-plan directories per city ("planning-commission" and
;;   "transportation-commission"). City-specific equivalent-body names (e.g. San Mateo's
;;   Sustainability & Infrastructure Commission, per HOF/sources/san-mateo/SOURCES.md) are
;;   normalized to 'transportation-commission at /fundamental-ingestion time, not here.
;; Created: 2026-09-05 12:00:00
;;
;; @gherkin
;; Scenario: a recognized body tag is valid
;;   Given body 'planning-commission
;;   When af:valid-agenda-body? is applied
;;   Then the result is #t
;;
;; Scenario: an unrecognized body tag is rejected
;;   Given body 'not-a-real-body
;;   When af:valid-agenda-body? is applied
;;   Then the result is #f

(define (af:valid-agenda-body? body)
  (or (eq? body 'planning-commission)
      (eq? body 'transportation-commission)))
