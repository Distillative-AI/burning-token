;; path | HOF/2026/09/05/07/af-agenda-pc-20260521-adu-ordinance-rz2026-0002.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260521-adu-ordinance-rz2026-0002
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260521-adu-ordinance-rz2026-0002) -> alist
;; Description: REAL /fundamental-ingestion instance for Foster City. Foster City Planning
;;   Commission Regular Meeting 5/21/2026 (PrimeGov meetingTemplateId=7425, meetingId=1422),
;;   Item 6.2 (data-itemid=25402, Case No. RZ2026-0002): a resolution of the Planning
;;   Commission recommending that the City Council adopt an ordinance amending Chapter 17.78
;;   "Accessory Dwelling Units" of Title 17 "Zoning" of the Foster City Municipal Code to
;;   ensure compliance with state ADU laws, found CEQA-exempt under Guideline §15061(b)(3)
;;   (Common Sense Exemption) and Public Resources Code §21080.17. Confirmed from the Staff
;;   Report PDF itself (agenda item no. 6.2, dated May 21, 2026, prepared by Kevin McGill,
;;   Associate Planner): this implements Housing Element 2023-31 Program H-D-4-a, which
;;   commits the city to updating Chapter 17.78 within six months of any new state ADU law
;;   taking effect. This record captures the Planning Commission's RECOMMENDATION only — I
;;   could not confirm from a directly-fetched source whether/when the City Council
;;   subsequently adopted the ordinance or what ordinance number it received; do not infer
;;   adoption. City Council agendas for Jun 1, Jun 15, Jul 20, and Aug 3, 2026 (the ones I
;;   could pull via the PrimeGov archived-meetings API) did not show a matching ADU/Chapter
;;   17.78 ordinance item, so a later or not-yet-archived Council meeting is the likely next
;;   step, unconfirmed here.
;; Source: https://fostercity.primegov.com/api/compilemeetingattachmenthistory/historyattachment/?historyId=5479f85c-bde2-4553-be39-4f5e0815be18
;;   — direct Staff Report PDF (verified: HTTP 200, application/octet-stream serving a real
;;   9-page PDF; pdftotext content opens with "REGULAR MEETING STAFF REPORT / DATE: May 21,
;;   2026 / AGENDA ITEM NO 6.2 ... CASE NO.: RZ2026-0002", matching this item exactly). The
;;   meeting portal page itself is
;;   https://fostercity.primegov.com/Portal/Meeting?meetingTemplateId=7425 (also HTTP 200;
;;   lists this item's attachments including the historyId used above, obtained via
;;   PrimeGov's public ListArchivedMeetings API at
;;   https://fostercity.primegov.com/api/v2/PublicPortal/ListArchivedMeetings?year=2026,
;;   which maps meetingId 1422 / "May 21, 2026" / "Planning Commission Regular Meeting" to
;;   Agenda templateId 7425).
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 07:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260521-adu-ordinance-rz2026-0002)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records the ADU ordinance recommendation
;;   Given (af:agenda-pc-20260521-adu-ordinance-rz2026-0002)
;;   Then the 'agenda-item field mentions "Chapter 17.78" and "RZ2026-0002" and
;;     "Accessory Dwelling Units"

(define (af:agenda-pc-20260521-adu-ordinance-rz2026-0002)
  (af:city-agenda-item
    "foster-city"
    'planning-commission
    "2026-05-21"
    "Item 6.2 (RZ2026-0002): Resolution of the Planning Commission recommending that the City Council adopt an ordinance amending Chapter 17.78 Accessory Dwelling Units of Title 17 Zoning of the Foster City Municipal Code to ensure compliance with state laws related to Accessory Dwelling Units; CEQA-exempt under Guideline Section 15061(b)(3) (Common Sense Exemption) and Public Resources Code Section 21080.17; implements Housing Element Program H-D-4-a"
    "https://fostercity.primegov.com/api/compilemeetingattachmenthistory/historyattachment/?historyId=5479f85c-bde2-4553-be39-4f5e0815be18"))
