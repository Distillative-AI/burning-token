;; path | HOF/2026/09/05/13/af-ord-1125-menlo-park-c1s-district.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: ord-1125-menlo-park-c1s-district
;; Order: 1 (Atomic — nullary constructor wrapping af:adopted-ordinance with real ingested data)
;; Signature: (af:ord-1125-menlo-park-c1s-district) -> alist
;; Description: REAL /fundamental-ingestion instance. Menlo Park Ordinance 1125, adopted
;;   10/7/2025: adds the C-1-S — Administrative, Professional and Research, Special District
;;   to the zoning code, codified as Ch. 16.35. Flagged in the source notes as a
;;   zoning-relevant action and candidate for a full-text follow-up pull (not yet done).
;; Source: https://ecode360.com/47199918 ("Title OL: Ordinance List and Disposition Table"),
;;   pulled live 2026-09-05, human-in-the-loop browser session, no login wall.
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 13:00:00
;;
;; @gherkin
;; Scenario: Ord. 1125 is provenance-complete (real ordinance-number and adopted-date)
;;   Given (af:ord-1125-menlo-park-c1s-district)
;;   When af:ordinance-provenance-complete? is applied
;;   Then the result is #t

(define (af:ord-1125-menlo-park-c1s-district)
  (af:adopted-ordinance
    "menlo-park"
    "1125"
    "Zoning: Adds C-1-S — Administrative, Professional and Research, Special District"
    "2025-10-07"
    #f
    "https://ecode360.com/47199918"))
