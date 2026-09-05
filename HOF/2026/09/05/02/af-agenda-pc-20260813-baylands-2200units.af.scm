;; path | HOF/2026/09/05/02/af-agenda-pc-20260813-baylands-2200units.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260813-baylands-2200units
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260813-baylands-2200units) -> alist
;; Description: REAL /fundamental-ingestion instance for Brisbane — the continuation, at the
;;   next regular meeting, of the same Baylands Specific Plan item recorded in the sibling
;;   file af-agenda-pc-20260723-baylands-2200units.af.scm. See that file's header for the
;;   full vendor/Planning-Commission-URL discovery note (CivicClerk, confirmed current
;;   platform; brisbaneca.api.civicclerk.com REST endpoint used to fetch the raw PDF
;;   directly, bypassing the JS-rendered portal UI at brisbaneca.portal.civicclerk.com).
;;   On this agenda the item is listed as Old Business item B, "CONTINUED" (no longer
;;   labeled "PUBLIC HEARING" — consistent with the July 23, 2026 agenda's own text stating
;;   the hearing would adjourn to this date; whether the public hearing was formally closed
;;   or merely continued is not stated on the face of this agenda page and is not asserted
;;   here beyond the literal item heading).
;; Source: https://brisbaneca.api.civicclerk.com/v1/Meetings/GetMeetingFileStream(fileId=11509,plainText=false)
;;   — verified: curl returns HTTP 200, content-type application/pdf, 3-page PDF whose
;;   embedded XMP title metadata reads "Planning Commission Agenda August 13 2026"
;;   (ModifyDate 2026-08-07). Full text extracted from the PDF's compressed content streams
;;   (zlib inflate + Tj-string parse) confirms Old Business Item B: "CONTINUED: Baylands
;;   Subarea; Environmental Review 2021-ER-1, Specific Plan 2021-SP-1, Zoning Amendment
;;   2021-RZ-3, General Plan Amendment 2021-GPA-2; Proposed Baylands Specific Plan
;;   including 2,200 residential units..." verbatim — identical project description text
;;   to the July 23, 2026 agenda, confirming this is the same docket item continued forward.
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 02:01:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260813-baylands-2200units)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records this as a continuation of the same docket item
;;   Given (af:agenda-pc-20260813-baylands-2200units)
;;   Then the 'agenda-item field mentions "CONTINUED" and "2021-SP-1" and "2,200 residential units"

(define (af:agenda-pc-20260813-baylands-2200units)
  (af:city-agenda-item
    "brisbane"
    'planning-commission
    "2026-08-13"
    "Old Business Item B — CONTINUED: Baylands Subarea; Environmental Review 2021-ER-1, Specific Plan 2021-SP-1, Zoning Amendment 2021-RZ-3, General Plan Amendment 2021-GPA-2; Proposed Baylands Specific Plan including 2,200 residential units; 6.5 million square feet of commercial/office/retail/conference/life science/office campus uses; 500,000 sq ft hotel (approx. 800 rooms); grade 6-8 middle school; 157 acres open space/parks/trails; on approx. 680.1 acres east of Bayshore Blvd and west of Highway 101; includes amending the Brisbane General Plan Land Use and Circulation Elements, amending Title 17 (Zoning) of the Brisbane Municipal Code, and adopting the Bayshore Mobility Plan; Final EIR prepared under CEQA. Applicant: Baylands Development Inc.; majority owner: Sunquest Properties (see Attachment 9 for complete owner list)."
    "https://brisbaneca.api.civicclerk.com/v1/Meetings/GetMeetingFileStream(fileId=11509,plainText=false)"))
