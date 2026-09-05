;; path | HOF/2026/09/05/03/af-agenda-pc-20260526-sb79-tod-overlay.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260526-sb79-tod-overlay
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260526-sb79-tod-overlay) -> alist
;; Description: REAL /fundamental-ingestion instance for Burlingame. City of Burlingame
;;   Planning Commission Regular Meeting, Tuesday 5/26/2026, Action Item 7d (Public
;;   Hearing): "Amendments to Title 25 (Zoning) of the Burlingame Municipal Code, the
;;   Zoning Map, the General Plan, the Downtown Specific Plan, and the North Rollins
;;   Specific Plan" (Project No. ZOA26-0001) — consideration of amendments to create
;;   Transit Oriented Development overlay zones within a one-quarter-mile radius of the
;;   Millbrae BART/Caltrain Station and the Downtown Burlingame Caltrain Station, in order
;;   to comply with Senate Bill 79 by creating a transit-oriented development local
;;   alternative plan (TODAP). Recommendation on the agenda: that the Planning Commission,
;;   by resolution, recommend the City Council amend Title 25, the Zoning Map, the General
;;   Plan, the Downtown Specific Plan, and the North Rollins Specific Plan. CEQA:
;;   exempt pursuant to State CEQA Guidelines §15061(b)(3) and §15378(b)(2). Staff: Neda
;;   Zayer (Community Development Director), Joseph Sanfilippo (Economic Development and
;;   Housing Specialist), Catherine Keylon (Senior Planner). This is a Planning Commission
;;   RECOMMENDATION step to City Council, not a final Council adoption — confirmed directly
;;   from the agenda PDF text; whether the Commission actually recommended approval, and
;;   whether City Council has since adopted the TODAP zoning-code/General Plan/Specific
;;   Plan amendments, is NOT confirmed in this pass (only the pre-meeting agenda was
;;   pulled). This is the same 5/26/2026 meeting as af:agenda-pc-20260526-park-road-144units
;;   (sibling file, item 7c) but a distinct agenda item (7d) — kept as a separate file per
;;   Constitution Article I §2 (one (define ...) per file, one real fact per file).
;; Source: https://burlingameca.legistar1.com/burlingameca/meetings/2026/5/2503_A_Planning_Commission_26-05-26_Meeting_Agenda.pdf
;;   — confirmed via: (1) direct curl with -L returned HTTP 200, content-type
;;   application/pdf; (2) this is the resolved redirect target of the Burlingame
;;   Planning Commission's own Granicus AgendaViewer link for the 5/26/2026 meeting
;;   (https://burlingameca.granicus.com/AgendaViewer.php?view_id=4&clip_id=2210), itself
;;   reached from the public ViewPublisher index
;;   (https://burlingameca.granicus.com/ViewPublisher.php?view_id=4); (3) PDF text
;;   extracted with pypdf and string-matched against "Senate Bill 79", "Transit Oriented
;;   Development", "ZOA26-0001", "North Rollins Specific Plan", all present.
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 03:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260526-sb79-tod-overlay)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records the SB 79 transit-oriented development overlay proposal
;;   Given (af:agenda-pc-20260526-sb79-tod-overlay)
;;   Then the 'agenda-item field mentions "Senate Bill 79" and "Transit Oriented
;;     Development" and "Millbrae BART/Caltrain"

(define (af:agenda-pc-20260526-sb79-tod-overlay)
  (af:city-agenda-item
    "burlingame"
    'planning-commission
    "2026-05-26"
    "Action Item 7d (Public Hearing): Amendments to Title 25 (Zoning) of the Burlingame Municipal Code, the Zoning Map, the General Plan, the Downtown Specific Plan, and the North Rollins Specific Plan (Project No. ZOA26-0001) — creation of Transit Oriented Development overlay zones within one-quarter mile of the Millbrae BART/Caltrain Station and Downtown Burlingame Caltrain Station, to comply with Senate Bill 79 via a transit-oriented development local alternative plan (TODAP); recommendation that the Planning Commission, by resolution, recommend City Council adopt the amendments; CEQA exempt under State CEQA Guidelines § 15061(b)(3) and § 15378(b)(2)"
    "https://burlingameca.legistar1.com/burlingameca/meetings/2026/5/2503_A_Planning_Commission_26-05-26_Meeting_Agenda.pdf"))
