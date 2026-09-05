;; path | HOF/2026/09/05/09/af-agenda-pc-20260615-100-cornelia-adu-exception-appeal-continued.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260615-100-cornelia-adu-exception-appeal-continued
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260615-100-cornelia-adu-exception-appeal-continued) -> alist
;; Description: REAL /fundamental-ingestion instance for Hillsborough, CA — the CONTINUANCE of
;;   the same 100 Cornelia Drive ADU Exception appeal recorded in the sibling file
;;   af-agenda-pc-20260504-100-cornelia-adu-exception-appeal.af.scm. Hillsborough has NO
;;   Planning Commission (confirmed structural fact per HOF/sources/hillsborough/SOURCES.md);
;;   this record again uses 'planning-commission as the closest schema-supported equivalent
;;   for the Architecture and Design Review Board (ADRB), the body that actually holds this
;;   hearing. ADRB Regular Meeting, Monday, June 15, 2026, Agenda Section VII (Formal Review
;;   Items), Item 5: 100 Cornelia Drive (APN 031-104-280) — "Continued public hearing of an
;;   appeal of a staff-level approval of an Accessory Dwelling Unit (ADU) Exception request for
;;   a detached ADU." This confirms the appeal was NOT resolved at the May 4, 2026 meeting and
;;   remained a live, contested ADU-approval-process matter as of this later date. This agenda
;;   additionally names an applicant/party for the first time: "William Colford, Honomobo"
;;   (Honomobo is a prefab/modular ADU manufacturer) — confirmed directly in the extracted PDF
;;   text; role (appellant vs. applicant) is not explicitly labeled on the agenda line itself,
;;   so do not over-assert which party this name represents.
;; Source: https://www.hillsborough.net/AgendaCenter/ViewFile/Agenda/_06152026-1440 — verified
;;   by direct curl (200 application/pdf) and by pypdf text extraction confirming "100 Cornelia
;;   Drive", "Continued public hearing of an appeal", "Accessory Dwelling Unit (ADU) Exception",
;;   "William Colford, Honomobo", and "June 15, 2026" all appear in the extracted agenda text;
;;   this is the ADRB Agenda Center's own direct ViewFile PDF link (not a portal list page),
;;   found via the ADRB archive page
;;   https://www.hillsborough.net/AgendaCenter/Architecture-Design-Review-Board-1.
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 09:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260615-100-cornelia-adu-exception-appeal-continued)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records the continuance of the 100 Cornelia Drive ADU appeal
;;   Given (af:agenda-pc-20260615-100-cornelia-adu-exception-appeal-continued)
;;   Then the 'agenda-item field mentions "Continued public hearing" and
;;     "Accessory Dwelling Unit (ADU) Exception"

(define (af:agenda-pc-20260615-100-cornelia-adu-exception-appeal-continued)
  (af:city-agenda-item
    "hillsborough"
    'planning-commission
    "2026-06-15"
    "Architecture and Design Review Board (ADRB) — Hillsborough's de facto planning-commission-equivalent body (Hillsborough has no standing Planning Commission); Formal Review Item 5: 100 Cornelia Drive (APN 031-104-280), Applicant/party: William Colford, Honomobo — Continued public hearing of an appeal of a staff-level approval of an Accessory Dwelling Unit (ADU) Exception request for a detached ADU (continuance of the May 4, 2026 item)"
    "https://www.hillsborough.net/AgendaCenter/ViewFile/Agenda/_06152026-1440"))
