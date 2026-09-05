;; path | HOF/2026/09/05/14/af-agenda-pc-20260728-claremont-storage.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260728-claremont-storage
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260728-claremont-storage) -> alist
;; Description: REAL /fundamental-ingestion instance. San Mateo Planning Commission Regular
;;   Meeting 7/28/2026 (meetingTemplateId=10723, held at Oak Room, Main Library — City Hall
;;   under construction; amended agenda added Commissioner Patel's Gov. Code §5493(b)
;;   teleconference disclosure). Public Hearing Item 1: 922-980 S. Claremont Street — new
;;   self-storage facility (76,767 sq ft) that retains/rehabs 3 historic single-story
;;   buildings, cleared via Mitigated Negative Declaration (PA-2024-062). Not a housing item
;;   (self-storage use), recorded for completeness of the meeting's public-hearing docket
;;   alongside the housing-substantive Clearview Way item on the same agenda.
;; Source: https://sanmateo.primegov.com/Portal/Meeting?meetingTemplateId=10723
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 14:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260728-claremont-storage)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t

(define (af:agenda-pc-20260728-claremont-storage)
  (af:city-agenda-item
    "san-mateo"
    'planning-commission
    "2026-07-28"
    "Public Hearing Item 1: 922-980 S. Claremont Street — new self-storage facility (76,767 sq ft), retains/rehabs 3 historic single-story buildings, cleared via Mitigated Negative Declaration (PA-2024-062)"
    "https://sanmateo.primegov.com/Portal/Meeting?meetingTemplateId=10723"))
