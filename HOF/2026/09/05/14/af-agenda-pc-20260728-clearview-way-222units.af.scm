;; path | HOF/2026/09/05/14/af-agenda-pc-20260728-clearview-way-222units.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260728-clearview-way-222units
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260728-clearview-way-222units) -> alist
;; Description: REAL /fundamental-ingestion instance — the most housing-substantive real fact
;;   pulled so far for San Mateo. San Mateo Planning Commission Regular Meeting 7/28/2026
;;   (meetingTemplateId=10723), Public Hearing Item 2: 3000/3155 Clearview Way Multi-Family
;;   Residential Development — 222 dwelling units. Applications: Site Plan and Architectural
;;   Review + Site Development Planning Application + Vesting Tentative Parcel Map.
;;   CEQA-exempt under Public Resources Code §21080.66 (state streamlining exemption for
;;   qualifying infill multi-family housing) — no Mitigated Negative Declaration or EIR
;;   required, i.e. the CEQA-review step itself is bypassed by statute for this project.
;;   Cross-reference: reports/san-mateo-housing-structural-moats.md §2's CEQA-exemption-for-
;;   infill-housing thread (PA reference not separately stated on the public agenda page
;;   pulled; only the PRC §21080.66 exemption citation is directly sourced — do not invent a
;;   PA number not present in the source).
;; Source: https://sanmateo.primegov.com/Portal/Meeting?meetingTemplateId=10723
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 14:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260728-clearview-way-222units)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records the CEQA exemption citation for the 222-unit development
;;   Given (af:agenda-pc-20260728-clearview-way-222units)
;;   Then the 'agenda-item field mentions "222 dwelling units" and "PRC § 21080.66"

(define (af:agenda-pc-20260728-clearview-way-222units)
  (af:city-agenda-item
    "san-mateo"
    'planning-commission
    "2026-07-28"
    "Public Hearing Item 2: 3000/3155 Clearview Way Multi-Family Residential Development — 222 dwelling units; Site Plan and Architectural Review + Site Development Planning Application + Vesting Tentative Parcel Map; CEQA-exempt under Public Resources Code § 21080.66 (state streamlining exemption, no MND/EIR required)"
    "https://sanmateo.primegov.com/Portal/Meeting?meetingTemplateId=10723"))
