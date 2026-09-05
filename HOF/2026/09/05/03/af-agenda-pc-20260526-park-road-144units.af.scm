;; path | HOF/2026/09/05/03/af-agenda-pc-20260526-park-road-144units.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260526-park-road-144units
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260526-park-road-144units) -> alist
;; Description: REAL /fundamental-ingestion instance for Burlingame. City of Burlingame
;;   Planning Commission Regular Meeting, Tuesday 5/26/2026, Action Item 7c (Public
;;   Hearing): "Major Design Review, State Density Bonus, and Vesting Tentative Parcel
;;   Map at 2, 12 and 16 Park Road" (Project No. DSR25-0021) — application to merge four
;;   parcels and construct a seven-story, 144 multi-unit residential building including
;;   12 below market rate (BMR) units (6 very-low income, 6 moderate income), with two
;;   levels of above-grade parking (140 spaces), in the Bayswater Mixed Use (BMU) and
;;   High Density Residential zoning district within the Downtown Specific Plan. CEQA:
;;   statutorily exempt pursuant to AB 130 (project-level entitlements); the associated
;;   Tentative Parcel Map is categorically exempt under CEQA Guidelines §15315. Applicant:
;;   Windy Hill Property Ventures; property owners John F. Crosby (2 Park Road) and
;;   Michael K. Howard (12–16 Park Road); architect BDE / Ian Murphy. Staff: Neda Zayer
;;   (Community Development Director), Catherine Keylon (Senior Planner). This is confirmed
;;   directly from the agenda PDF text (extracted via pypdf from the direct Legistar PDF,
;;   see Source below) — unit counts, BMR breakdown, zoning district, and CEQA basis are
;;   all as stated on the agenda itself. Whether the Commission approved, continued, or
;;   modified the application at the meeting is NOT confirmed in this pass (only the
;;   pre-meeting agenda was pulled, not minutes/video/staff report outcome) — do not
;;   represent this as an approval.
;; Source: https://burlingameca.legistar1.com/burlingameca/meetings/2026/5/2503_A_Planning_Commission_26-05-26_Meeting_Agenda.pdf
;;   — confirmed via: (1) direct curl with -L returned HTTP 200, content-type
;;   application/pdf; (2) this is the resolved redirect target of the Burlingame
;;   Planning Commission's own Granicus AgendaViewer link for the 5/26/2026 meeting
;;   (https://burlingameca.granicus.com/AgendaViewer.php?view_id=4&clip_id=2210), itself
;;   reached from the public ViewPublisher index
;;   (https://burlingameca.granicus.com/ViewPublisher.php?view_id=4, confirmed in prior
;;   SOURCES.md pass to list this city's Planning Commission archive Jan 2017–Aug 2026);
;;   (3) PDF text extracted with pypdf and string-matched against "2, 12" / "Park Road" /
;;   "144 multi-unit" / "Senate Bill 79" / "DSR25-0021" / "ZOA26-0001", all present.
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 03:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260526-park-road-144units)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records the density bonus project's unit count and BMR breakdown
;;   Given (af:agenda-pc-20260526-park-road-144units)
;;   Then the 'agenda-item field mentions "144 multi-unit" and "State Density Bonus" and
;;     "12 below market rate"

(define (af:agenda-pc-20260526-park-road-144units)
  (af:city-agenda-item
    "burlingame"
    'planning-commission
    "2026-05-26"
    "Action Item 7c (Public Hearing): Major Design Review, State Density Bonus, and Vesting Tentative Parcel Map at 2, 12 and 16 Park Road (Project No. DSR25-0021) — merge four parcels to construct a seven-story, 144 multi-unit residential building including 12 below market rate units (6 very-low, 6 moderate income) with two levels of above-grade parking (140 spaces), in the Bayswater Mixed Use (BMU) and High Density Residential zoning district within the Downtown Specific Plan; CEQA statutorily exempt under AB 130, Tentative Parcel Map categorically exempt under CEQA Guidelines § 15315"
    "https://burlingameca.legistar1.com/burlingameca/meetings/2026/5/2503_A_Planning_Commission_26-05-26_Meeting_Agenda.pdf"))
