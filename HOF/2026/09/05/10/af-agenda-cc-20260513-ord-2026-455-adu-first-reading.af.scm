;; path | HOF/2026/09/05/10/af-agenda-cc-20260513-ord-2026-455-adu-first-reading.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-cc-20260513-ord-2026-455-adu-first-reading
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-cc-20260513-ord-2026-455-adu-first-reading) -> alist
;; Description: REAL /fundamental-ingestion instance for Portola Valley — Town Council Regular
;;   Meeting 5/13/2026, Public Hearing Item 7a: "Hold a Public Hearing, Waive the First Reading,
;;   and Introduce Ordinance No. 2026-455" amending the Town Zoning Code (Title 18) to add
;;   Chapter 18.25 (ADU/JADU standards) and Chapter 18.82 (Indemnification of Town) and amend
;;   Section 18.36.040, "Determining the Project is Exempt Under the California Environmental
;;   Quality Act." Confirmed from the agenda text itself (page 2 of the packet PDF) and the
;;   staff report on page 30 (by Brandon H DeLucas, Contract Senior Planner) which restates the
;;   identical recommendation. This is the Council's first-reading/introduction step for the
;;   ordinance the Planning Commission recommended on 2026-04-15 (see companion
;;   af:agenda-pc-20260415-adu-jadu-zoning-amendment in this directory); the ordinance was
;;   adopted on second reading on 2026-05-27 (see companion af:adopted-ordinance instance,
;;   ord-2026-455-adu-jadu).
;; Source: direct agenda/packet PDF for this meeting, verified by content — pdf.js text-layer
;;   extraction (run in an authenticated browser session; portolavalley.net returns HTTP 403 to
;;   non-browser fetches/curl) shows "Regular Meeting of the Town Council Wednesday, May 13,
;;   2026" and Public Hearing item 7a text naming "Ordinance No. 2026-455" and Chapter 18.25/
;;   18.82 verbatim, cross-checked against the identically-worded staff report on PDF page 30.
;;   Confirmed HTTP 200 for this exact URL via the browser network log (80-page real packet,
;;   not an error page).
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 10:05:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-cc-20260513-ord-2026-455-adu-first-reading)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records the first reading/introduction of Ordinance No. 2026-455
;;   Given (af:agenda-cc-20260513-ord-2026-455-adu-first-reading)
;;   Then the 'agenda-item field mentions "Ordinance No. 2026-455" and "Introduce"

(define (af:agenda-cc-20260513-ord-2026-455-adu-first-reading)
  (af:city-agenda-item
    "portola-valley"
    'city-council
    "2026-05-13"
    "Public Hearing Item 7a: Hold a Public Hearing, Waive the First Reading, and Introduce Ordinance No. 2026-455 Amending the Town Zoning Code (Title 18) to Add Chapter 18.25 Standards for Accessory Dwelling Units (ADU) and Junior Accessory Dwelling Unit (JADU) and Chapter 18.82 Indemnification of Town; Cost Reimbursement; and by Amending Section 18.36.040 Accessory Uses; determined exempt under CEQA."
    "https://www.portolavalley.net/home/showpublisheddocument/20641/639142754764300000"))
