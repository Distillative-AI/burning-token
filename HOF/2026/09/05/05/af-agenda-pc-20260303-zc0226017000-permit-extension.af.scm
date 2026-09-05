;; path | HOF/2026/09/05/05/af-agenda-pc-20260303-zc0226017000-permit-extension.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260303-zc0226017000-permit-extension
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260303-zc0226017000-permit-extension) -> alist
;; Description: REAL /fundamental-ingestion instance for Daly City. Daly City Planning
;;   Commission Regular Meeting 3/3/2026, citywide Zoning Change ZC-02-26-017000 (initiated
;;   by the City of Daly City itself, not a private applicant): extends Use Permit and
;;   Design Review approval expiration from the prior term to 5 years (Planning Commission
;;   amended staff's original 3-year proposal upward to 5 years per this project's prior
;;   HOF/sources/daly-city/eligibility-snapshot.md research), lengthens the time-extension
;;   window for expired permits from 6 months to 2 years, and exempts condominium
;;   subdivisions from requiring a use permit (Municode Ch. 17.37.030) — only conversions/
;;   stock cooperatives/communal ownership still require one. Staff's own Discussion section
;;   explicitly frames this as implementing the city's 2024 Housing Element commitment to
;;   reduce discretionary-review barriers to residential development. Recommended for a
;;   CEQA Class 15061(b)(3) "Regulation Review" categorical exemption (general rule exemption
;;   for actions with no possibility of significant environmental effect), not a project-
;;   specific MND/EIR. City Council introduction followed March 23, 2026 with second reading
;;   scheduled April 13, 2026 per this project's prior research; the assigned ordinance number
;;   and confirmed final adoption/effective dates were NOT located this pass (a follow-up
;;   Linkup search for "Daly City ordinance ZC-02-26-017000 adopted" surfaced only this same
;;   staff report and the city's unrelated environmental-ordinances page, not a Council
;;   minutes/ordinance-number confirmation) — do not treat this as an adopted ordinance
;;   record; it is recorded here strictly as the Planning Commission agenda/staff-report
;;   item, which is independently and directly verified.
;; Source: https://dalycityca.api.civicclerk.com/v1/Meetings/GetMeetingFileStream(fileId=5220,plainText=false)
;;   — verified 2026-09-05 via `curl -A "Mozilla/5.0" -o /dev/null -w "%{http_code} %{content_type}"`
;;   returning "200 application/pdf"; this is Daly City's real current agenda-management
;;   platform (CivicClerk, https://dalycityca.portal.civicclerk.com/), not the Legistar
;;   instance listed in the task brief's jurisdiction CSV — the CivicClerk URL was confirmed
;;   live via a prior human-in-the-loop browser session (see HOF/sources/daly-city/SOURCES.md
;;   and eligibility-snapshot.md) and is the correct current portal; the document's own text
;;   was string-matched against "ZC-02-26-017000", "March 3, 2026" hearing date, and the
;;   condominium/use-permit/5-year-extension substance to confirm it is the right item.
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 05:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260303-zc0226017000-permit-extension)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records the Housing Element linkage and permit-extension substance
;;   Given (af:agenda-pc-20260303-zc0226017000-permit-extension)
;;   Then the 'agenda-item field mentions "ZC-02-26-017000", "5 years", and "condominium"

(define (af:agenda-pc-20260303-zc0226017000-permit-extension)
  (af:city-agenda-item
    "daly-city"
    'planning-commission
    "2026-03-03"
    "Citywide Zoning Change ZC-02-26-017000 (city-initiated): extends Use Permit and Design Review approval expiration to 5 years, lengthens the expired-permit time-extension window from 6 months to 2 years, and exempts condominium subdivisions from requiring a use permit (Municode Ch. 17.37.030); staff report frames this as implementing the 2024 Housing Element's commitment to reduce discretionary-review barriers to residential development; recommended CEQA Class 15061(b)(3) Regulation Review categorical exemption"
    "https://dalycityca.api.civicclerk.com/v1/Meetings/GetMeetingFileStream(fileId=5220,plainText=false)"))
