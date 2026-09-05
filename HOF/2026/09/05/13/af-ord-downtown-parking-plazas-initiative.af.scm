;; path | HOF/2026/09/05/13/af-ord-downtown-parking-plazas-initiative.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: ord-downtown-parking-plazas-initiative
;; Order: 1 (Atomic — nullary constructor wrapping af:adopted-ordinance with real ingested data)
;; Signature: (af:ord-downtown-parking-plazas-initiative) -> alist
;; Description: REAL /fundamental-ingestion instance. Menlo Park "Downtown Parking Plazas
;;   Ordinance" — a citizen-sponsored initiative measure under California Elections Code
;;   § 9215. If adopted, would add Title 17, Chapter 17.01 to the Menlo Park Municipal Code,
;;   prohibiting the City from selling, leasing, donating, disposing of, or otherwise
;;   conveying any City-owned Downtown Parking Lots — for any reason affecting or diminishing
;;   parking availability/convenience — without voter approval (exceptions for maintenance/
;;   capital improvement work and temporary events). No ordinance number has been assigned as
;;   of the 2026-09-05 pull: it is not yet a codified city ordinance (per
;;   HOF/sources/menlo-park/SOURCES.md and the ordinance-disposition-table pull notes) —
;;   ordinance-number is #f by design, not a missing-data placeholder. adopted-date is #f:
;;   the City Council's Determination of Action under §9215 (options A/adopt outright,
;;   B/submit to voters Nov. 3 2026, or C/order a §9212 impact report first) was presented
;;   at the 11/4/2025 meeting (Staff Report 25-169-CC, Item J-3) but which option Council
;;   chose is not yet confirmed in this pull (see "Still needed" in the source doc).
;;   Direct housing linkage: the City's certified 2022-2031 Housing Element (CA HCD,
;;   3/20/2024) Program H4.G plans at least 345 affordable housing units on a combination of
;;   downtown parking lots; this initiative would block the land disposition H4.G requires
;;   without a separate voter-approval step.
;; Source: City Council Staff Report No. 25-169-CC, Agenda Item J-3, meeting 11/4/2025 —
;;   https://www.menlopark.gov/files/sharedassets/public/v/1/agendas-and-minutes/city-council/2025-meetings/20251104/j3-20251104-cc-determination-of-action-ec-9515.pdf
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 13:00:00
;;
;; @gherkin
;; Scenario: the initiative is not yet provenance-complete as an ordinance
;;   Given (af:ord-downtown-parking-plazas-initiative)
;;   When af:ordinance-provenance-complete? is applied
;;   Then the result is #f (ordinance-number and adopted-date both #f: citizen initiative,
;;     not yet a codified ordinance or resolved Council determination as of this pull)

(define (af:ord-downtown-parking-plazas-initiative)
  (af:adopted-ordinance
    "menlo-park"
    #f
    "Downtown Parking Plazas Ordinance (citizen-sponsored initiative; would add Title 17, Ch. 17.01; blocks disposition of downtown parking lots without voter approval, conflicting with certified Housing Element Program H4.G's 345+ affordable-unit plan on those lots)"
    #f
    #f
    "https://www.menlopark.gov/files/sharedassets/public/v/1/agendas-and-minutes/city-council/2025-meetings/20251104/j3-20251104-cc-determination-of-action-ec-9515.pdf"))
