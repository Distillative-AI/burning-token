;; path | HOF/2026/09/05/07/af-agenda-pc-20260716-housing-element-hd2a-commercial-reuse.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260716-housing-element-hd2a-commercial-reuse
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260716-housing-element-hd2a-commercial-reuse) -> alist
;; Description: REAL /fundamental-ingestion instance for Foster City. Foster City Planning
;;   Commission Regular Meeting 7/16/2026 (PrimeGov meetingTemplateId=7626, meetingId=1458),
;;   Item 8.1 (data-itemid=25496): an information-only update to the Planning Commission on
;;   Housing Element 2023-2031 Program H-D-2-a "Potential Re-Use of Commercial Sites."
;;   Confirmed from the Staff Report PDF itself (agenda item no. 8.1, dated July 16, 2026,
;;   prepared by Thai-Chau Le, Interim Community Development Director): the Program commits
;;   the city to biannual review of neighborhood-commercial/shopping-center sites for
;;   residential or mixed-use redevelopment, and specifically names 1010 Metro Center
;;   Boulevard as a site the city committed to rezone (originally targeted by December 2023)
;;   to achieve at least a minimum capacity of 111 housing units. This item was information-
;;   only (no action requested at this meeting) — it reports on program status/next steps
;;   rather than approving a specific development application; I did not confirm from this
;;   source alone whether the 1010 Metro Center Boulevard rezone has since been completed.
;; Source: https://fostercity.primegov.com/api/compilemeetingattachmenthistory/historyattachment/?historyId=8655160f-902b-48ac-aa77-bd8cedab61de
;;   — direct Staff Report (Amended) PDF (verified: HTTP 200, application/octet-stream
;;   serving a real 15-page PDF; pdftotext content opens with "DATE: JULY 16, 2026 / REGULAR
;;   MEETING / STAFF REPORT ... AGENDA ITEM NO 8.1 ... Receive an update on the Housing
;;   Element 2023-2031 Program H-D-2-a Potential Re-Use of Commercial Sites", matching this
;;   item exactly). The meeting portal page itself is
;;   https://fostercity.primegov.com/Portal/Meeting?meetingTemplateId=7626 (also HTTP 200),
;;   found via PrimeGov's public ListArchivedMeetings API at
;;   https://fostercity.primegov.com/api/v2/PublicPortal/ListArchivedMeetings?year=2026,
;;   which maps meetingId 1458 / "Jul 16, 2026" / "Planning Commission Regular Meeting" to
;;   Agenda templateId 7626.
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 07:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260716-housing-element-hd2a-commercial-reuse)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records the Housing Element commercial-reuse program update
;;   Given (af:agenda-pc-20260716-housing-element-hd2a-commercial-reuse)
;;   Then the 'agenda-item field mentions "H-D-2-a" and "1010 Metro Center Boulevard" and
;;     "111 units"

(define (af:agenda-pc-20260716-housing-element-hd2a-commercial-reuse)
  (af:city-agenda-item
    "foster-city"
    'planning-commission
    "2026-07-16"
    "Item 8.1: Information-only update on Housing Element 2023-2031 Program H-D-2-a (Potential Re-Use of Commercial Sites) — biannual review of neighborhood-commercial/shopping-center sites for residential/mixed-use redevelopment; Program specifically commits the city to rezone 1010 Metro Center Boulevard to allow mixed-use redevelopment achieving a minimum capacity of 111 housing units; no action requested at this meeting"
    "https://fostercity.primegov.com/api/compilemeetingattachmenthistory/historyattachment/?historyId=8655160f-902b-48ac-aa77-bd8cedab61de"))
