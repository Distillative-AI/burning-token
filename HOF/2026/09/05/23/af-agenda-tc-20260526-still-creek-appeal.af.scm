;; path | HOF/2026/09/05/23/af-agenda-tc-20260526-still-creek-appeal.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-tc-20260526-still-creek-appeal
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-tc-20260526-still-creek-appeal) -> alist
;; Description: REAL /fundamental-ingestion instance for Woodside. Woodside Town Council
;;   Regular Meeting 5/26/2026, Old Business Item A: Council deliberation and adoption of a
;;   resolution granting or denying the appeal (APPL2025-0002) of the Planning Commission's
;;   denial of a Front-and-Side-Yard Setback Exception (XSET2025-0001) for 10 Still Creek
;;   Road (APN 075-020-100) — a new main residence with attached garage, a Junior Accessory
;;   Dwelling Unit (JADU), one attached Accessory Dwelling Unit (ADU), and one detached ADU.
;;   During deliberation Council also considered Formal Design of the Project (ASRB2025-0017)
;;   and a Maximum Residence Size Exception (XMAX2025-0010). Agenda states the project is
;;   Categorically Exempt from CEQA under Sections 15303(a), 15303(b), and 15303(e), and
;;   Public Resources Code § 21080 (ministerial approvals). This is the direct Town Council
;;   appeal hearing following the Planning Commission's 2025-11-19 denial (see companion file
;;   af-agenda-pc-20251119-still-creek-adu-denial.af.scm), and matches
;;   HOF/sources/woodside/eligibility-snapshot.md's note that the applicant's attorney
;;   invoked Housing Accountability Act litigation exposure (~$50,000/unit) if denied — a
;;   live current-cycle test of Woodside's post-Housing-Element-certification ADU/JADU
;;   permitting posture, distinct from and much more recent than the 2022 mountain-lion/SB9
;;   episode.
;; Source: https://www.woodsideca.gov/AgendaCenter/ViewFile/Agenda/_05262026-662?html=true
;;   (verified: HTTP 200, text/html; page text confirmed to contain "10 Still Creek Road",
;;   "APPL2025-0002", "XSET2025-0001", "Junior Accessory Dwelling Unit", and "Categorically
;;   Exempt ... CEQA" — direct-document URL, not the AgendaCenter list/portal page; the
;;   non-html variant of the same URL served only a placeholder stub PDF, so the ?html=true
;;   rendered-document URL is used as the citable direct source instead).
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 23:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-tc-20260526-still-creek-appeal)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records the appeal and CEQA-exemption detail
;;   Given (af:agenda-tc-20260526-still-creek-appeal)
;;   Then the 'agenda-item field mentions "APPL2025-0002" and "Categorically Exempt"

(define (af:agenda-tc-20260526-still-creek-appeal)
  (af:city-agenda-item
    "woodside"
    'city-council
    "2026-05-26"
    "Old Business Item A: Council deliberation and adoption of resolution granting or denying 10 Still Creek Road (APN 075-020-100) Appeal (APPL2025-0002) of Planning Commission's denial of a Front-and-Side-Yard Setback Exception (XSET2025-0001) for a new main residence with attached garage, Junior Accessory Dwelling Unit (JADU), one attached ADU, and one detached ADU; Council also considered Formal Design (ASRB2025-0017) and Maximum Residence Size Exception (XMAX2025-0010); project Categorically Exempt from CEQA under Sections 15303(a)/(b)/(e) and PRC § 21080"
    "https://www.woodsideca.gov/AgendaCenter/ViewFile/Agenda/_05262026-662?html=true"))
