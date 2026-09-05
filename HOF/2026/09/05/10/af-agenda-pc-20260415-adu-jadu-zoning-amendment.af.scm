;; path | HOF/2026/09/05/10/af-agenda-pc-20260415-adu-jadu-zoning-amendment.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260415-adu-jadu-zoning-amendment
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260415-adu-jadu-zoning-amendment) -> alist
;; Description: REAL /fundamental-ingestion instance — the most housing-substantive real fact
;;   pulled so far for Portola Valley. Portola Valley Planning Commission Regular Meeting
;;   4/15/2026, Public Hearing Item 3a: Draft Resolution recommending Town Council approval of
;;   amendments to Title 18 (Zoning Code) adding Chapter 18.25 "Standards for Accessory
;;   Dwelling Units (ADU) and Junior Accessory Dwelling Units (JADU)," amending Section
;;   18.36.040 (Accessory uses), and adding Chapter 18.82 (Indemnification of Town). Confirmed
;;   from the staff report (pages 3-4 of the packet PDF, by Brandon H DeLucas, Senior Planner):
;;   the Town's ADU/JADU regulations were "currently not consistent with State law due to
;;   recent changes," Programs 7-8 and 8-3 of the Town's 2023-2031 Housing Element require the
;;   update, and the Town had received "an official letter from HCD regarding the Town's
;;   non-compliance with current state law" requiring the ADU/JADU ordinance update. Staff
;;   proposed repealing existing Section 18.36.040(B) and replacing it with new Chapter 18.25
;;   to meet Gov. Code §§66310-66342. This Planning Commission action was a recommendation
;;   only (formal PC recommendation required by state law before Council can act); the Town
;;   Council later introduced this as Ordinance No. 2026-455 on 2026-05-13 and adopted it on
;;   2026-05-27 (see the companion af:adopted-ordinance instance in this same directory).
;; Source: direct agenda/packet PDF for this meeting, verified by content — the extracted PDF
;;   text (via pdf.js text-layer extraction of the fetched bytes, run in an authenticated
;;   browser session since portolavalley.net returns HTTP 403 to non-browser fetches/curl)
;;   shows the "A G E N D A" header "Planning Commission Meeting Wednesday, April 15, 2026"
;;   and Public Hearing item 3a text plus the linked staff report on pages 3-4 naming Chapter
;;   18.25, Chapter 18.82, Section 18.36.040, Programs 7-8/8-3, and the HCD non-compliance
;;   letter verbatim. Confirmed HTTP 200 (not 403) for this exact URL in a live browser session
;;   via the network log, and the PDF page count (64 pages) matches a real packet, not an
;;   error page.
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 10:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260415-adu-jadu-zoning-amendment)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records the ADU/JADU zoning code amendment and HCD non-compliance basis
;;   Given (af:agenda-pc-20260415-adu-jadu-zoning-amendment)
;;   Then the 'agenda-item field mentions "Chapter 18.25" and "HCD" and "non-compliance"

(define (af:agenda-pc-20260415-adu-jadu-zoning-amendment)
  (af:city-agenda-item
    "portola-valley"
    'planning-commission
    "2026-04-15"
    "Public Hearing Item 3a: Adopt the Draft Resolution Recommending Approval of the Proposed Amendments to the Town Zoning Code (Title 18) to add Chapter 18.25 Standards for Accessory Dwelling Units (ADU) and Junior Accessory Dwelling Units (JADU); amend Section 18.36.040 Accessory uses; and add Chapter 18.82 Indemnification of Town. Staff report confirms the Town's existing ADU/JADU regulations were non-compliant with recent state law changes, cites Housing Element Programs 7-8 and 8-3, and notes the Town received an HCD non-compliance letter requiring this update."
    "https://www.portolavalley.net/home/showpublisheddocument/20559/639114359317800000"))
