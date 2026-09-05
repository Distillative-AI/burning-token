;; path | HOF/hof-housing-schema-self-check.hof.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; hof: housing-schema-self-check
;; Order: 2 (Second Order — composes the atomic example constructors and guards into one
;;   evaluable end-to-end schema coherence check)
;; Composed from: af:city-agenda-item-example, af:valid-agenda-body?,
;;   af:adopted-ordinance-example, af:ordinance-provenance-complete?
;;   (HOF/2026/09/05/12/af-*.af.scm)
;; Signature: (hof:housing-schema-self-check) -> alist
;; Description: Runs both placeholder example instances through their respective atomic
;;   schema guards and reports the results, so a single call verifies the whole schema
;;   layer evaluates coherently before any real ingestion.
;; Created: 2026-09-05 12:00:00
;;
;; @gherkin
;; Scenario: schema example instances validate against the atomic guards
;;   Given af:city-agenda-item-example and af:adopted-ordinance-example
;;   When af:valid-agenda-body? and af:ordinance-provenance-complete? are applied
;;   Then both guards return non-#f for their respective example record

(define (hof:housing-schema-self-check)
  (list (cons 'agenda-item-body-valid?
              (af:valid-agenda-body? (cdr (assoc 'body (af:city-agenda-item-example)))))
        (cons 'ordinance-provenance-complete?
              (af:ordinance-provenance-complete? (af:adopted-ordinance-example)))))
