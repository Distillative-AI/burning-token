;; path | HOF/2026/09/05/01/af-agenda-pc-20250916-cmu-housing-element-zta.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20250916-cmu-housing-element-zta
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20250916-cmu-housing-element-zta) -> alist
;; Description: REAL /fundamental-ingestion instance — the most housing-substantive real fact
;;   found so far for Belmont, CA. Belmont Planning Commission Regular Meeting, Tuesday,
;;   September 16, 2025, 7:00 PM, City Council Chambers. Public Hearing Item 7B: "Zoning Text
;;   Amendments — Corridor Mixed Use District, Parking, Housing Element Implementation and
;;   Other Zoning Code Updates." Staff recommendation on the agenda: (1) conduct a public
;;   hearing; and (2) adopt a resolution recommending City Council adoption of amendments
;;   implementing the certified Housing Element, revising development standards in the
;;   Corridor Mixed Use (CMU) District, consolidating parking requirements into one section
;;   of the Zoning Ordinance, amending regulations to implement streamlined processing of
;;   housing projects as required by State law, and other zoning-code clarifications.
;;   Cross-reference: a separately confirmed source (Belmont's 2023-2031 Housing Element,
;;   Program H.1.5) directs the City to modify the CMU and Village Station Core (VCS) zoning
;;   districts specifically to eliminate the maximum residential density and increase
;;   allowable floor area ratio so those districts can accommodate the same development
;;   capacity contemplated for RHNA sites — i.e. this CMU zoning text amendment is the
;;   housing-element-implementation action for that density-elimination program. This pass
;;   could NOT independently confirm a final City Council adoption date or ordinance number
;;   for these particular zoning text amendments (a companion, unrelated 2025 ordinance
;;   amending outdoor-seating regulations in the CMU/C-1/RC/Village districts was found on
;;   the same Granicus MetaViewer id range but is NOT the same amendment package and is not
;;   ingested here to avoid conflating the two) — do not assume adoption absent a separately
;;   confirmed ordinance record. The agenda item itself (the Planning Commission's public
;;   hearing and recommendation step) is the confirmed real fact ingested by this file.
;; Source: direct Granicus S3 agenda-attachment PDF for the September 16, 2025 Belmont
;;   Planning Commission meeting — https://granicus_production_attachments.s3.amazonaws.com/belmont-ca/74452ad390a9a957907fc1a63ffbc8780.pdf
;;   — confirmed via `curl -s -o /dev/null -w "%{http_code} %{content_type}"` returning
;;   "200 application/pdf", and confirmed by content: downloaded and text-extracted with
;;   pypdf, the PDF's own text reads "PLANNING COMMISSION MEETING AGENDA / Tuesday,
;;   September 16, 2025" and lists agenda item "7.B. Zoning Text Amendments- Corridor Mixed
;;   Use District, Parking, Housing Element Implementation and Other Zoning Code Updates"
;;   with the recommendation text quoted above. Found via Linkup deep search starting from
;;   the confirmed Belmont Granicus Planning Commission portal
;;   (https://belmont-ca.granicus.com/ViewPublisher.php?view_id=2) and cross-checked against
;;   the city's own (WebFetch-blocked, HTTP 403) zoning-amendments landing page, whose search
;;   snippet independently states "The Planning Commission reviewed the proposed zoning text
;;   amendments at their September 16, 2025 meeting recommending adoption of the zoning text
;;   amendments to the City Council with additional recommendations."
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 01:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20250916-cmu-housing-element-zta)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records the Housing Element implementation and CMU density thread
;;   Given (af:agenda-pc-20250916-cmu-housing-element-zta)
;;   Then the 'agenda-item field mentions "Corridor Mixed Use" and "Housing Element
;;     Implementation" and "streamlined processing of housing projects"

(define (af:agenda-pc-20250916-cmu-housing-element-zta)
  (af:city-agenda-item
    "belmont"
    'planning-commission
    "2025-09-16"
    "Public Hearing Item 7.B: Zoning Text Amendments — Corridor Mixed Use (CMU) District, Parking, Housing Element Implementation and Other Zoning Code Updates; staff recommendation to conduct a public hearing and adopt a resolution recommending City Council adoption of amendments implementing the certified Housing Element, revising CMU District development standards, consolidating parking requirements, and amending regulations to implement streamlined processing of housing projects as required by State law"
    "https://granicus_production_attachments.s3.amazonaws.com/belmont-ca/74452ad390a9a957907fc1a63ffbc8780.pdf"))
