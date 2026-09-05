;; path | HOF/housing.hof.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; hof: housing-city-roster
;; Order: 2 (Second Order — composes/indexes the atomic per-city planning/transportation
;;   agenda and adopted-ordinance schemas over the full city roster)
;; Composed from: af:city-agenda-item, af:valid-agenda-body?, af:city-agenda-item-example,
;;   af:adopted-ordinance, af:ordinance-provenance-complete?, af:adopted-ordinance-example
;;   (HOF/2026/09/05/12/af-*.af.scm)
;; Signature: (hof:housing-city-roster) -> (listof string)
;; Description: THIN INDEX/COMPOSITION LAYER for the San Mateo County housing chronology.
;;   Per HOF/sources/README.md: raw pulls land per city under
;;     HOF/sources/<city-slug>/{planning-commission,transportation-commission}/agendas/
;;     HOF/sources/<city-slug>/new-laws/
;;   /fundamental-ingestion converts those raw pulls into af:city-agenda-item and
;;   af:adopted-ordinance instances, which get folded into this file's siblings
;;   (hof-housing-schema-index.hof.scm, hof-housing-ingestion-status.hof.scm,
;;   hof-housing-schema-self-check.hof.scm — Constitution Article I §2 one-define-per-file)
;;   as real data lands. As of 2026-09-05 this composes ONLY the city roster and schema
;;   pointers — zero real agenda/ordinance instances — because no /fundamental-ingestion
;;   pass has run yet on HOF/sources/<city>/.
;;   City slugs below are literal data (not a directory scan) matching every
;;   HOF/sources/<slug>/ directory present as of 2026-09-05, so this file evaluates
;;   standalone in the interpreter without filesystem access.
;; Created: 2026-09-05 12:00:00
;;
;; @gherkin
;; Scenario: city roster matches the source chronology directories
;;   Given HOF/sources/<city-slug>/ for every tracked city
;;   When hof:housing-city-roster is applied
;;   Then every city-slug present in HOF/sources/ appears in the roster

(define (hof:housing-city-roster)
  (list "atherton"
        "daly-city"
        "menlo-park"
        "pacifica"
        "redwood-city"
        "san-mateo"
        "south-san-francisco"
        "unincorporated-county"))
