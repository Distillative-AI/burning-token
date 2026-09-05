;; path | HOF/2026/09/05/06/af-agenda-pc-20260209-four-corners-townhomes-95units.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260209-four-corners-townhomes-95units
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260209-four-corners-townhomes-95units) -> alist
;; Description: REAL /fundamental-ingestion instance for East Palo Alto. East Palo Alto
;;   Planning Commission Public Meeting, 2026-02-09, 7:00 p.m.: consideration of the "Four
;;   Corners / Bay Road Townhomes" project — Design Review Application DR25-004 (PRE24-003),
;;   1675 Bay Road, Applicant Sand Hill Property Company — 95 townhome units of 1,200-1,900
;;   SF net living area with common open areas and guest parking. The city's own project
;;   page (https://www.ci.east-palo-alto.ca.us/planning/project/four-corners-townhome-
;;   project-dr25-004-pre24-003-1675-bay-road) states verbatim: "The project is scheduled
;;   for Planning Commission consideration at their 2/9/26 Public Meeting" and links this
;;   exact CloudFront PDF as "2/9/2026 PC Agenda Packet". This is East Palo Alto's largest
;;   confirmed active housing entitlement item found in this research pass (companion
;;   Four Corners Mixed-Use item DR25-007 recorded separately, see
;;   af-agenda-pc-20260209-four-corners-mixeduse-ceqa.af.scm). NOTE ON CONFIDENCE: the
;;   linked PDF is a very large (~196MB) full agenda-packet file; its internal text was not
;;   directly extracted in this pass (no PDF-text tool available locally) — the match to
;;   this specific meeting/item rests on the city project page's own explicit, current
;;   caption naming this exact file as the 2/9/2026 PC Agenda Packet, not on independent
;;   PDF-content string-matching. Flagged honestly rather than overstated.
;; Source: https://d3n9y02raazwpg.cloudfront.net/cityofepa/f8b329cf-f278-11f0-bb28-005056a89546-29a637e7-42e3-4737-b76d-b5307e52bbc0-1770423250.pdf
;;   — verified live via curl: HTTP 200, Content-Type application/pdf. Linked directly and
;;   by-name ("2/9/2026 PC Agenda Packet") from the city's own DR25-004 project page as of
;;   this pull; not the bare IQM2/Default.aspx calendar page.
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 06:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260209-four-corners-townhomes-95units)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records the 95-unit townhome project and its design review number
;;   Given (af:agenda-pc-20260209-four-corners-townhomes-95units)
;;   Then the 'agenda-item field mentions "95 townhome units" and "DR25-004" and
;;     "1675 Bay Road"

(define (af:agenda-pc-20260209-four-corners-townhomes-95units)
  (af:city-agenda-item
    "east-palo-alto"
    'planning-commission
    "2026-02-09"
    "Four Corners / Bay Road Townhomes — Design Review Application DR25-004 (PRE24-003), 1675 Bay Road, Applicant Sand Hill Property Company: 95 townhome units of 1,200-1,900 SF net living area, common open areas, guest parking; scheduled for Planning Commission consideration at the 2/9/2026 Public Meeting per the city's own project page"
    "https://d3n9y02raazwpg.cloudfront.net/cityofepa/f8b329cf-f278-11f0-bb28-005056a89546-29a637e7-42e3-4737-b76d-b5307e52bbc0-1770423250.pdf"))
