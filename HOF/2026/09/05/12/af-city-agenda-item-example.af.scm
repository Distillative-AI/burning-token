;; path | HOF/2026/09/05/12/af-city-agenda-item-example.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: city-agenda-item-example
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with placeholder data)
;; Signature: (af:city-agenda-item-example) -> alist
;; Description: One illustrative placeholder instance of af:city-agenda-item, NOT real data.
;;   Exists so the schema is exercisable/evaluable before any real /fundamental-ingestion
;;   pass has run over HOF/sources/<city>/planning-commission|transportation-commission/agendas/.
;;   Every field is explicitly marked EXAMPLE PLACEHOLDER.
;; Created: 2026-09-05 12:00:00
;;
;; @gherkin
;; Scenario: the example instance is well-formed under the schema
;;   Given (af:city-agenda-item-example)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t

(define (af:city-agenda-item-example)
  (af:city-agenda-item
    "san-mateo"
    'planning-commission
    "2026-08-11"
    "EXAMPLE PLACEHOLDER — Item 7: Objective Design Standards compliance review (123 Example St)"
    "https://sanmateo.primegov.com/Portal/Meeting?compiledMeetingDocumentFileId=0000"))
