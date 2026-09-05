;; path | HOF/2026/09/06/00/af-agenda-pc-20260128-design-review-ordinance-update.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260128-design-review-ordinance-update
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260128-design-review-ordinance-update) -> alist
;; Description: REAL /fundamental-ingestion instance for unincorporated San Mateo County.
;;   San Mateo County Planning Commission Regular Hearing, January 28, 2026, Regular Agenda
;;   Item 4: File No. PLN2025-00232, Applicant "Planning and Building, San Mateo County"
;;   (a county-initiated, not private-applicant, item), Location "Various" / APN "Various" —
;;   consideration of an ordinance repealing and replacing Chapter 8.256 of the County
;;   Ordinance Code and Section 6565 (Design Review District) of the County Zoning
;;   Regulations, plus related text amendments to the County Zoning Regulations across
;;   multiple zoning districts, for consistency with the new ordinance. This is a
;;   countywide zoning-text-amendment item governing development standards (design review)
;;   for the unincorporated areas — housing-relevant because Design Review District
;;   standards directly govern approval conditions/timelines for residential development
;;   projects countywide (including the North Fair Oaks / Housing-Element-linked
;;   combining districts documented in HOF/sources/unincorporated-county/SOURCES.md §1/§3).
;;   Confirmed directly from the agenda PDF text itself (item text quoted verbatim above);
;;   NOT confirmed: whether the Commission voted to adopt/recommend on this date, or what
;;   specific standards changed (that detail lives only in the Item 4 staff report
;;   attachment, /media/157769/download, which was not opened this pass — do not infer
;;   adoption or content beyond what the agenda text itself states). Project planner of
;;   record per the agenda: Camille Leung, cleung@smcgov.org.
;; Source: direct Agenda PDF for the January 28, 2026 Planning Commission hearing,
;;   https://www.smcgov.org/media/157644/download?inline= (verified: HTTP 200,
;;   content-type application/pdf, 5 pages; PDF text-extracted and confirmed to contain
;;   "File Number: PLN2025-00232" and the Chapter 8.256 / Section 6565 Design Review
;;   District language quoted in the Description above). Reached via the per-hearing page
;;   https://www.smcgov.org/planning/event/planning-commission-hearing-january-28-2026
;;   (also HTTP 200), which is the confirmed live pattern documented in
;;   HOF/sources/unincorporated-county/SOURCES.md §1.
;; Pulled-date: 2026-09-05
;; Created: 2026-09-06 00:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260128-design-review-ordinance-update)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records the countywide Design Review District zoning text amendment
;;   Given (af:agenda-pc-20260128-design-review-ordinance-update)
;;   Then the 'agenda-item field mentions "PLN2025-00232" and "Chapter 8.256" and
;;     "Design Review District"

(define (af:agenda-pc-20260128-design-review-ordinance-update)
  (af:city-agenda-item
    "unincorporated-county"
    'planning-commission
    "2026-01-28"
    "Item 4: File No. PLN2025-00232 (Applicant: Planning and Building, San Mateo County; Location/APN: Various) — Consideration of an ordinance repealing and replacing Chapter 8.256 of the County Ordinance Code and Section 6565 (Design Review District) of the County Zoning Regulations, and adopting related text amendments to the County Zoning Regulations for various zoning districts for consistency with the new ordinance, to regulate development within Design Review zoning districts in the unincorporated areas of San Mateo County"
    "https://www.smcgov.org/media/157644/download?inline="))
