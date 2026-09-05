;; path | HOF/2026/09/05/12/af-city-agenda-item.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: city-agenda-item
;; Order: 1 (Atomic — a single planning/transportation commission agenda item as pure data;
;;   the structural record /fundamental-ingestion will populate from raw pulls under
;;   HOF/sources/<city>/{planning-commission,transportation-commission}/agendas/)
;; Signature: (af:city-agenda-item city body meeting-date agenda-item source-url) -> alist
;;   city         : string  — city slug matching HOF/sources/<city-slug>/ (e.g. "san-mateo")
;;   body         : symbol  — 'planning-commission | 'transportation-commission
;;                  (city-specific equivalent bodies, e.g. San Mateo's Sustainability &
;;                  Infrastructure Commission, are recorded under 'transportation-commission
;;                  with a note per SOURCES.md's body-name caveat)
;;   meeting-date : string  — ISO 8601 date, "YYYY-MM-DD", per SOURCES.md's dated-agenda convention
;;   agenda-item  : string  — the item title/description as it appears on the agenda
;;   source-url   : string  — direct URL to the agenda/packet/minutes page (PrimeGov, Legistar,
;;                  Granicus, or equivalent per-city portal)
;; Description: SCHEMA-ONLY constructor. No live agenda data has been ingested yet — every
;;   field below is a placeholder/example shape matching what HOF/sources/<city>/SOURCES.md
;;   pull plans describe (planning commission + transportation/infrastructure commission
;;   agendas, dated, sourced from PrimeGov/Legistar/Granicus). /fundamental-ingestion is the
;;   only process authorized to populate real instances from HOF/sources/<city>/**/agendas/.
;;   Sibling functions af:valid-agenda-body? (schema guard) and af:city-agenda-item-example
;;   (placeholder instance) live in their own one-function-per-file siblings in this same
;;   directory per Constitution Article I §2 (one (define ...) per file).
;; Created: 2026-09-05 12:00:00
;;
;; @gherkin
;; Scenario: construct a city agenda item record
;;   Given city "san-mateo", body 'planning-commission, meeting-date "2026-08-11",
;;     agenda-item "Item 7: Objective Design Standards compliance review — 123 Example St",
;;     source-url "https://sanmateo.primegov.com/Portal/Meeting?compiledMeetingDocumentFileId=0000"
;;   When af:city-agenda-item is applied
;;   Then the result is an alist with keys city, body, meeting-date, agenda-item, source-url

(define (af:city-agenda-item city body meeting-date agenda-item source-url)
  (list (cons 'city city)
        (cons 'body body)
        (cons 'meeting-date meeting-date)
        (cons 'agenda-item agenda-item)
        (cons 'source-url source-url)))
