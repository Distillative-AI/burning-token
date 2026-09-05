;; path | HOF/2026/09/05/21/af-shenanigan-ceqa-pla-hammer.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: shenanigan-ceqa-pla-hammer
;; Order: 1 (Atomic — nullary constructor, a single seeded af:shenanigan-instance
;;   application as pure data; the construction-trade-unions beneficiary-class instance)
;; Signature: (af:shenanigan-ceqa-pla-hammer) -> alist
;; Description: Former California Governor Jerry Brown's own characterization:
;;   construction trade unions use CEQA "as a hammer to get project labor agreements"
;;   — filing or threatening CEQA appeals against a project, then dropping the appeal
;;   in exchange for union-labor (PLA) concessions, independent of the project's actual
;;   environmental merits. This is a county-and-statewide-scale PATTERN rather than a
;;   single dated project (jurisdiction "san-mateo-county" as a placeholder scope, not
;;   a specific city), which is exactly why it gets its own mechanism value
;;   ('pla-linked-appeal, distinct from plain 'ceqa-litigation) — the beneficiary here
;;   is construction-trade-unions specifically, not the incumbent-homeowner/fiscal
;;   interests that most other CEQA-litigation instances in this model serve. No
;;   target-project or date because the source frames this as a standing tactic/
;;   pattern, not a single dated event; outcome 'capture-succeeded reflects that this
;;   is reported as an ongoing, working extraction mechanism, not a one-off contest.
;; Source: reports/san-mateo-housing-structural-moats.md Section 1.2 (Jerry Brown
;;   "hammer" quote), Section 4 item 2 ("Construction trade unions — CEQA/review as
;;   PLA leverage, independent of project merits");
;;   https://www.sanjoseinside.com/news/ceqa-racket-extracts-11th-hour-payoffs-amidst-housing-crisis/
;; Created: 2026-09-05 21:00:00
;;
;; @gherkin
;; Scenario: the CEQA-as-PLA-leverage pattern is recorded with construction-trade-unions as beneficiary
;;   Given (af:shenanigan-ceqa-pla-hammer)
;;   Then 'mechanism is 'pla-linked-appeal and 'beneficiary-classes contains
;;     'construction-trade-unions

(define (af:shenanigan-ceqa-pla-hammer)
  (af:shenanigan-instance
    "san-mateo-county"
    'pla-linked-appeal
    (list 'construction-trade-unions)
    'both
    #f
    #f
    'capture-succeeded
    (list "https://www.sanjoseinside.com/news/ceqa-racket-extracts-11th-hour-payoffs-amidst-housing-crisis/"
          "https://calmatters.org/housing/2025/06/ceqa-urban-development-infill-budget/")
    'reported))
