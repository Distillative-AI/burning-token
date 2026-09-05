;; path | HOF/2026/09/05/02/af-agenda-pc-20260723-baylands-2200units.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260723-baylands-2200units
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260723-baylands-2200units) -> alist
;; Description: REAL /fundamental-ingestion instance for Brisbane. Vendor/portal discovery
;;   note: Brisbane's Planning-Commission-URL and vendor were UNKNOWN in the source CSV.
;;   Prior research in HOF/sources/brisbane/SOURCES.md had already identified the current
;;   live platform as CivicClerk (brisbaneca.portal.civicclerk.com), migrated from Municode
;;   Meetings (confirmed in use as of July 2025), with an older legacy `.org`/archive site.
;;   This pass CONFIRMED the vendor and resolved a working direct-document path: CivicClerk's
;;   REST API at brisbaneca.api.civicclerk.com/v1/Meetings/GetMeetingFileStream(fileId=<id>)
;;   returns the raw agenda PDF directly (no JS rendering required) once the numeric fileId
;;   is known — fileId 11479 was found via Linkup search (surfaced from a YouTube video
;;   description linking the CivicClerk portal event page, whose numeric path segment
;;   doubles as the API fileId). The corresponding portal event page is
;;   https://brisbaneca.portal.civicclerk.com/event/6872/files/agenda/11479 (JS-rendered,
;;   returns text/html to a plain fetch — the API endpoint above is what actually serves
;;   the PDF bytes). Planning Commission landing page: https://www.brisbaneca.gov/533/Planning-Commission.
;; Source: https://brisbaneca.api.civicclerk.com/v1/Meetings/GetMeetingFileStream(fileId=11479,plainText=false)
;;   — verified: curl returns HTTP 200, content-type application/pdf, 3-page PDF whose
;;   embedded XMP title metadata reads "Planning Commission Agenda Jul 23 2026" (ModifyDate
;;   2026-07-17). Full text extracted from the PDF's compressed content streams (zlib
;;   inflate + Tj-string parse) confirms Item D: "CONTINUED PUBLIC HEARING: Baylands
;;   Subarea; Environmental Review 2021-ER-1, Specific Plan 2021-SP-1, Zoning Amendment
;;   2021-RZ-3, General Plan Amendment 2021-GPA-2; Proposed Baylands Specific Plan
;;   including 2,200 residential units..." verbatim, matching HOF/sources/brisbane's prior
;;   eligibility-snapshot.md summary of the Baylands Specific Plan hearings and resolving
;;   that snapshot's noted ambiguity between "hearing closed 7/23" vs "continued to 8/13" —
;;   both are now independently confirmed real meeting dates in sequence (see sibling file
;;   af-agenda-pc-20260813-baylands-2200units.af.scm for the 8/13 continuation).
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 02:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260723-baylands-2200units)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records the case numbers and unit count for the Baylands Specific Plan
;;   Given (af:agenda-pc-20260723-baylands-2200units)
;;   Then the 'agenda-item field mentions "2,200 residential units" and "2021-SP-1"

(define (af:agenda-pc-20260723-baylands-2200units)
  (af:city-agenda-item
    "brisbane"
    'planning-commission
    "2026-07-23"
    "Item D — CONTINUED PUBLIC HEARING: Baylands Subarea; Environmental Review 2021-ER-1, Specific Plan 2021-SP-1, Zoning Amendment 2021-RZ-3, General Plan Amendment 2021-GPA-2; Proposed Baylands Specific Plan including 2,200 residential units; 6.5 million square feet of commercial/office/retail/conference/life science/office campus uses; 500,000 sq ft hotel (approx. 800 rooms); grade 6-8 middle school; 157 acres open space/parks/trails; on approx. 680.1 acres east of Bayshore Blvd and west of Highway 101; includes amending the Brisbane General Plan Land Use and Circulation Elements, amending Title 17 (Zoning) of the Brisbane Municipal Code, and adopting the Bayshore Mobility Plan; Final EIR prepared under CEQA. Applicant: Baylands Development Inc.; majority owner: Sunquest Properties. Adjourned to the regular meeting of August 13, 2026."
    "https://brisbaneca.api.civicclerk.com/v1/Meetings/GetMeetingFileStream(fileId=11479,plainText=false)"))
