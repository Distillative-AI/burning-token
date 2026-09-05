;; path | HOF/2026/09/05/23/af-agenda-pc-20251119-still-creek-adu-denial.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20251119-still-creek-adu-denial
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20251119-still-creek-adu-denial) -> alist
;; Description: REAL /fundamental-ingestion instance for Woodside. Woodside Planning
;;   Commission Regular Meeting 11/19/2025, Public Hearing Item 2: 10 Still Creek Road
;;   (applicant David Mittelman; Planner Sarah Filipe). Project proposed a new main
;;   residence with attached garage, one Junior Accessory Dwelling Unit (JADU), one
;;   attached Accessory Dwelling Unit (ADU), and one detached ADU on a vacant lot, requiring
;;   Formal Design Review (ASRB2025-0017), a Maximum Residence Size Exception
;;   (XMAX2025-0010), and a Front/Side-Yard Setback Exception (XSET2025-0001). Per the
;;   minutes, the Commission denied the Setback Exception (the other approvals were
;;   discussed contingent on it); Director Schaan is quoted instructing that if denying,
;;   commissioners must state which findings cannot be made. This is a real, dated,
;;   substantive ADU/JADU land-use denial — not the mountain-lion/SB9 episode (that remains
;;   a separate, already-resolved 2022 thread per HOF/sources/woodside/eligibility-
;;   snapshot.md) — this is the current (2025-2026) housing-relevant follow-on activity the
;;   research task asked for. Cross-reference: the applicants' appeal of this denial to Town
;;   Council is recorded separately at
;;   HOF/2026/09/05/23/af-agenda-tc-20260526-still-creek-appeal.af.scm.
;; Source: https://www.woodsidetown.org/AgendaCenter/ViewFile/Minutes/_11192025-550?html=true
;;   (verified: HTTP 200, application/pdf; PDF text extracted with pypdf and confirmed to
;;   contain "Planning Commission Minutes November 19, 2025", "10 Still Creek Road",
;;   "ASRB2025-0017; XMAX2025-0010; XSET2025-0001", and "David Mittelman" — direct-document
;;   URL, not the AgendaCenter list/portal page).
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 23:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20251119-still-creek-adu-denial)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records the ADU/JADU denial detail
;;   Given (af:agenda-pc-20251119-still-creek-adu-denial)
;;   Then the 'agenda-item field mentions "Junior Accessory Dwelling Unit" and
;;     "Setback Exception" and "XSET2025-0001"

(define (af:agenda-pc-20251119-still-creek-adu-denial)
  (af:city-agenda-item
    "woodside"
    'planning-commission
    "2025-11-19"
    "Public Hearing Item 2: 10 Still Creek Road (David Mittelman) — Formal Design Review (ASRB2025-0017), Maximum Residence Size Exception (XMAX2025-0010), and Front/Side-Yard Setback Exception (XSET2025-0001) for a new main residence with attached garage, one Junior Accessory Dwelling Unit (JADU), one attached Accessory Dwelling Unit (ADU), and one detached ADU on a vacant lot; Planning Commission denied the Setback Exception"
    "https://www.woodsidetown.org/AgendaCenter/ViewFile/Minutes/_11192025-550?html=true"))
