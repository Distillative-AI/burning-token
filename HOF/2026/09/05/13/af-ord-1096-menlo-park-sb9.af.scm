;; path | HOF/2026/09/05/13/af-ord-1096-menlo-park-sb9.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: ord-1096-menlo-park-sb9
;; Order: 1 (Atomic — nullary constructor wrapping af:adopted-ordinance with real ingested data)
;; Signature: (af:ord-1096-menlo-park-sb9) -> alist
;; Description: REAL /fundamental-ingestion instance. Menlo Park Ordinance 1096: adds two-unit
;;   housing developments and urban lot splits (the city's SB9 implementing ordinance),
;;   codified as Ch. 15.31, Ch. 15.34, and Ch. 16.77 of the Menlo Park Municipal Code.
;;   Adoption date not given a specific day-of-month in the source disposition table (only
;;   listed by ordinance-number ordering between undated historical entries and Ord. 1103);
;;   recorded here with adopted-date #f pending a direct pull of the ordinance's council
;;   adoption record — do not infer a date. Cross-references reports/san-mateo-housing-
;;   structural-moats.md §2 (SB 9 statewide layer) per the source note.
;; Source: https://ecode360.com/47199918 ("Title OL: Ordinance List and Disposition Table"),
;;   pulled live 2026-09-05, human-in-the-loop browser session, no login wall.
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 13:00:00
;;
;; @gherkin
;; Scenario: Ord. 1096 has a real ordinance-number but an unresolved adopted-date
;;   Given (af:ord-1096-menlo-park-sb9)
;;   When af:ordinance-provenance-complete? is applied
;;   Then the result is #f (adopted-date is #f pending direct-record pull)

(define (af:ord-1096-menlo-park-sb9)
  (af:adopted-ordinance
    "menlo-park"
    "1096"
    "Adds two-unit housing developments and urban lot splits (SB9 implementing ordinance)"
    #f
    #f
    "https://ecode360.com/47199918"))
