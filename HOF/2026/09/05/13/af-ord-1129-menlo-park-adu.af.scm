;; path | HOF/2026/09/05/13/af-ord-1129-menlo-park-adu.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: ord-1129-menlo-park-adu
;; Order: 1 (Atomic — nullary constructor wrapping af:adopted-ordinance with real ingested data)
;; Signature: (af:ord-1129-menlo-park-adu) -> alist
;; Description: REAL /fundamental-ingestion instance. Menlo Park Ordinance 1129, adopted
;;   6/9/2026: amends zoning to repeal and replace the Accessory Dwelling Units ordinance,
;;   codified as Ch. 16.79 (Supp. No. 0.2 in the eCode360 disposition table). The most recent
;;   housing-relevant zoning action in the pulled adoption table as of 2026-09-05.
;; Source: https://ecode360.com/47199918 ("Title OL: Ordinance List and Disposition Table"),
;;   pulled live 2026-09-05, human-in-the-loop browser session, no login wall.
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 13:00:00
;;
;; @gherkin
;; Scenario: Ord. 1129 is provenance-complete (real ordinance-number and adopted-date)
;;   Given (af:ord-1129-menlo-park-adu)
;;   When af:ordinance-provenance-complete? is applied
;;   Then the result is #t

(define (af:ord-1129-menlo-park-adu)
  (af:adopted-ordinance
    "menlo-park"
    "1129"
    "Amends Zoning: Repeals and Replaces Accessory Dwelling Units ordinance"
    "2026-06-09"
    #f
    "https://ecode360.com/47199918"))
