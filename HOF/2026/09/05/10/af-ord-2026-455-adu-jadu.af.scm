;; path | HOF/2026/09/05/10/af-ord-2026-455-adu-jadu.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: ord-2026-455-adu-jadu
;; Order: 1 (Atomic — nullary constructor wrapping af:adopted-ordinance with real ingested data)
;; Signature: (af:ord-2026-455-adu-jadu) -> alist
;; Description: REAL /fundamental-ingestion instance — Portola Valley Ordinance No. 2026-455,
;;   "Amending the Town Zoning Code (Title 18 of the Portola Valley Municipal Code) to Add
;;   Chapter 18.25 Standards for Accessory Dwelling Units (ADU) and Junior Accessory Dwelling
;;   Units (JADU) and Chapter 18.82 Indemnification of Town; Cost Reimbursement; and by
;;   Amending Section 18.36.040 Accessory Uses; Determining the Project is Exempt Under the
;;   California Environmental Quality Act." Confirmed sequence: Planning Commission
;;   recommended approval on 2026-04-15 (companion file
;;   af-agenda-pc-20260415-adu-jadu-zoning-amendment.af.scm); Town Council held a public
;;   hearing, waived the first reading, and introduced the ordinance on 2026-05-13 (companion
;;   file af-agenda-cc-20260513-ord-2026-455-adu-first-reading.af.scm); Town Council waived
;;   further reading and ADOPTED the ordinance on 2026-05-27 as Consent Agenda item 6e — the
;;   adopted minutes for that meeting confirm "Motion and second (Hufty, Wolter) to approve
;;   Consent Agenda item 6e. The motion carried unanimously by roll call vote." The ordinance
;;   text itself (Section 9, "EFFECTIVE DATE; POSTING," found on page 57 of the 5/27/2026
;;   Council packet PDF) states: "This ordinance shall become effective 30 days after the date
;;   of its adoption," which places the effective date at 2026-06-26 (30 days after the
;;   2026-05-27 adoption date) — this 30-day-after-adoption computation is derived from the
;;   ordinance's own stated rule, not independently confirmed against a separate
;;   "effective-date" publication; flagged as computed, high-confidence but not a second
;;   independent source. Motivation for the ordinance, per the Planning Commission staff
;;   report: the Town's prior ADU/JADU rules were out of compliance with recent state ADU law
;;   changes, Housing Element Programs 7-8 and 8-3 required the update, and the Town had
;;   received an HCD non-compliance letter.
;; Source: direct Council agenda/packet PDF for the 2026-05-27 adoption meeting (the same
;;   document containing the agenda item, staff report, adopted-minutes confirmation is in a
;;   separate Minutes PDF at
;;   https://www.portolavalley.net/home/showpublisheddocument/20812/639179236965230000, both
;;   pulled and pdf.js-text-extracted in a live browser session since portolavalley.net returns
;;   HTTP 403 to non-browser fetches/curl). Confirmed by content match on "Ordinance No.
;;   2026-455" across the 5/13/2026 introduction packet, the 5/27/2026 adoption packet
;;   (including the full ordinance text with its Section 9 effective-date clause), and the
;;   5/27/2026 adopted meeting minutes. No separate Municode/law-library ordinance page was
;;   found published for this ordinance number as of the pull date; using the Council packet
;;   PDF (the town's own primary-source publication of the adopted ordinance text) as
;;   source-url per this schema's convention of pointing to "the city clerk's recently adopted
;;   ordinances page or equivalent" when no separate law-library page exists yet.
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 10:10:00
;;
;; @gherkin
;; Scenario: construct the adopted ordinance record for Portola Valley's ADU/JADU update
;;   Given (af:ord-2026-455-adu-jadu)
;;   Then the result's 'ordinance-number field is "2026-455" and 'adopted-date is "2026-05-27"
;;
;; Scenario: the title records the ADU/JADU Title 18 amendment
;;   Given (af:ord-2026-455-adu-jadu)
;;   Then the 'title field mentions "Chapter 18.25" and "Accessory Dwelling Units"

(define (af:ord-2026-455-adu-jadu)
  (af:adopted-ordinance
    "portola-valley"
    "2026-455"
    "Amending the Town Zoning Code (Title 18 of the Portola Valley Municipal Code) to Add Chapter 18.25 Standards for Accessory Dwelling Units (ADU) and Junior Accessory Dwelling Units (JADU) and Chapter 18.82 Indemnification of Town; Cost Reimbursement; and by Amending Section 18.36.040 Accessory Uses; Determining the Project is Exempt Under the California Environmental Quality Act"
    "2026-05-27"
    "2026-06-26"
    "https://www.portolavalley.net/home/showpublisheddocument/20685/639154981970530000"))
