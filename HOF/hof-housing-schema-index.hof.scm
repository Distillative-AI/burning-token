;; path | HOF/hof-housing-schema-index.hof.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; hof: housing-schema-index
;; Order: 2 (Second Order — indexes the atomic schema citizens by name to file path)
;; Composed from: af:city-agenda-item, af:adopted-ordinance (HOF/2026/09/05/12/)
;; Signature: (hof:housing-schema-index) -> (alist symbol -> string)
;; Description: Pointer index from schema name to the atomic-function file that defines
;;   it, so a reader/interpreter session (or a future per-city .hof.scm fold) can locate
;;   and :load each citizen without re-deriving the chronology path convention.
;; Created: 2026-09-05 12:00:00
;;
;; @gherkin
;; Scenario: every schema name resolves to a real chronology path
;;   Given (hof:housing-schema-index)
;;   Then each value is a HOF/<YYYY>/<MM>/<DD>/<HH>/ path under this project's HOF/ root

(define (hof:housing-schema-index)
  (list (cons 'city-agenda-item
              "HOF/2026/09/05/12/af-city-agenda-item.af.scm")
        (cons 'valid-agenda-body?
              "HOF/2026/09/05/12/af-valid-agenda-body.af.scm")
        (cons 'city-agenda-item-example
              "HOF/2026/09/05/12/af-city-agenda-item-example.af.scm")
        (cons 'adopted-ordinance
              "HOF/2026/09/05/12/af-adopted-ordinance.af.scm")
        (cons 'ordinance-provenance-complete?
              "HOF/2026/09/05/12/af-ordinance-provenance-complete.af.scm")
        (cons 'adopted-ordinance-example
              "HOF/2026/09/05/12/af-adopted-ordinance-example.af.scm")))
