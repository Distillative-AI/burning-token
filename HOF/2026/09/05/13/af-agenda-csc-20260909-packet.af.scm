;; path | HOF/2026/09/05/13/af-agenda-csc-20260909-packet.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-csc-20260909-packet
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-csc-20260909-packet) -> alist
;; Description: REAL /fundamental-ingestion instance, packet-level only. Menlo Park Complete
;;   Streets Commission (the functional successor to a "Transportation Commission" post the
;;   2017 Bicycle Commission + Transportation Commission merger — recorded under
;;   'transportation-commission per af:valid-agenda-body?'s normalization rule) meeting
;;   9/9/2026: a 17MB agenda packet was published. Line items not yet extracted; the source
;;   index's own "Next" note flags pulling bike/ped infrastructure items tied to new-housing
;;   conditions of approval as the follow-up housing-linkage work, not yet done in this pass.
;; Source: https://www.menlopark.gov/Agendas-and-minutes#section-3 (index page); packet
;;   filename/size as displayed on page (full URL pattern confirmed in SOURCES.md but not
;;   individually re-verified per row for this meeting).
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 13:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-csc-20260909-packet)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t

(define (af:agenda-csc-20260909-packet)
  (af:city-agenda-item
    "menlo-park"
    'transportation-commission
    "2026-09-09"
    "Agenda packet published (17MB, Complete Streets Commission — functional successor to Transportation Commission); line items not yet extracted — candidate housing linkage per pull-plan note: bike/ped infrastructure tied to new housing development conditions of approval"
    "https://www.menlopark.gov/Agendas-and-minutes#section-3"))
