;; path | HOF/2026/09/05/06/af-agenda-pc-20260209-four-corners-mixeduse-ceqa.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260209-four-corners-mixeduse-ceqa
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260209-four-corners-mixeduse-ceqa) -> alist
;; Description: REAL /fundamental-ingestion instance for East Palo Alto. East Palo Alto
;;   Planning Commission Regular Session, 2026-02-09, 7:00 p.m. (companion document also
;;   covers the 2026-02-23 session): action on "Four Corners – Mixed-Use Project" (Design
;;   Review Permit DR25-007 / PRE24-004), 1675 Bay Road, Applicant Sand Hill Property
;;   Company — 250+ dwelling units across two residential buildings plus a wrap-garage and
;;   ~2,400 SF retail (per the city's DR25-007 project page). The linked PDF's own extracted
;;   text (via Linkup search-result content, quoted directly) reads: "...Corners – Mixed-Use
;;   Project (Design Review Permit: DR25-007). It was ... seconded by Commissioner Allen-
;;   ... CEQA pursuant to Public Resources Code Section 21080.66. It was seconded by
;;   Commissioner..." and separately references Accessory Dwelling Units (ADUs) on corner
;;   lots — confirming this document is the correct Planning Commission record for the
;;   DR25-007 Four Corners Mixed-Use item and that the Commission acted on a CEQA
;;   determination citing PRC §21080.66 (the same state infill-housing CEQA-streamlining
;;   exemption seen used elsewhere in this project's San Mateo dataset). Companion townhome
;;   item on the same 1675 Bay Road "Four Corners" site (DR25-004, 95 units) recorded
;;   separately in af-agenda-pc-20260209-four-corners-townhomes-95units.af.scm.
;; Source: https://d3n9y02raazwpg.cloudfront.net/cityofepa/3a4abe4c-f279-11f0-bb28-005056a89546-b66d8e1b-5f57-400b-9799-cf3a802a8761-1773946417.pdf
;;   — verified live via curl: HTTP 200, Content-Type application/pdf (3.6 MB). Confirmed as
;;   the correct document by Linkup's own extracted-text snippet of this exact URL (quoted
;;   above verbatim, short fragments only), which names "DR25-007", "February 9, 2026, 7:00
;;   p.m.", and "Public Resources Code Section 21080.66" directly from the file's content —
;;   not the bare IQM2/Default.aspx calendar page.
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 06:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260209-four-corners-mixeduse-ceqa)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records the CEQA exemption citation and design-review number for the
;;   Four Corners Mixed-Use project
;;   Given (af:agenda-pc-20260209-four-corners-mixeduse-ceqa)
;;   Then the 'agenda-item field mentions "DR25-007" and "PRC § 21080.66"

(define (af:agenda-pc-20260209-four-corners-mixeduse-ceqa)
  (af:city-agenda-item
    "east-palo-alto"
    'planning-commission
    "2026-02-09"
    "Four Corners – Mixed-Use Project — Design Review Permit DR25-007 (PRE24-004), 1675 Bay Road, Applicant Sand Hill Property Company: 250+ dwelling units across two residential buildings plus wrap-garage and ~2,400 SF retail; Planning Commission action citing CEQA exemption under Public Resources Code § 21080.66; document also references Accessory Dwelling Units (ADUs) on corner lots"
    "https://d3n9y02raazwpg.cloudfront.net/cityofepa/3a4abe4c-f279-11f0-bb28-005056a89546-b66d8e1b-5f57-400b-9799-cf3a802a8761-1773946417.pdf"))
