;; path | HOF/2026/09/05/00/af-agenda-pc-20260128-sb79-development-standards.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260128-sb79-development-standards
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260128-sb79-development-standards) -> alist
;; Description: REAL /fundamental-ingestion instance for Atherton. Town of Atherton Planning
;;   Commission Regular Meeting, January 28, 2026: public hearing to consider adding Chapter
;;   17.59 ("Regulations and Objective Standards for Development Projects sought Pursuant to
;;   Government Code Section 65912.157 (SB 79)") and amending Chapter 17.60 of the Atherton
;;   Municipal Code — i.e. the Town's local objective development standards (setbacks,
;;   architectural design, vehicular circulation, parking, privacy screening, landscaping)
;;   for SB 79 (Abundant and Affordable Homes Near Transit Act) housing projects on the
;;   seven Atherton parcels within one-quarter mile of the Menlo Park Caltrain station.
;;   The Planning Commission recommended the City Council adopt the ordinance at this
;;   meeting. This item was part of a multi-meeting sequence: Dec 3, 2025 Council Study
;;   Session -> Jan 20, 2026 Community Workshop -> Jan 28, 2026 Planning Commission
;;   (this item) -> Feb 18, 2026 City Council 1st reading -> Mar 18, 2026 City Council
;;   2nd reading/adoption -> Mar 26, 2026 submittal to HCD -> HCD substantial-compliance
;;   finding June 10, 2026 (per athertonca.gov/745/SB-79---FAQs).
;; Source: no independently-hosted Planning Commission agenda-packet PDF for this specific
;;   Jan 28, 2026 meeting could be resolved to a direct, plain-fetchable document URL in
;;   this pass — the Town's own "Staff Report and Attachments" link for this meeting
;;   (https://atherton.primegov.com/portal/item?id=2431) is a PrimeGov JS single-page-app
;;   permalink that returns HTTP 200 text/html with no document content to a plain fetch
;;   (verified: attempted PrimeGov v2 PublicPortal API archive/document endpoints and the
;;   compiledMeetingDocumentFileId/CompiledDocument patterns; none resolved to a document
;;   for this past meeting without a JS-executing browser). Per task instructions, the
;;   meeting-date and agenda-item content here are instead sourced from and directly
;;   verified against the City-adopted ordinance's own recitals, which is a real, directly
;;   fetchable PDF: https://www.athertonca.gov/DocumentCenter/View/12538/Chapter-1759-SB-79-Ordinance
;;   (curl-verified 200 application/pdf; PDF-text-extracted and confirmed to state: "the
;;   Planning Commission held a duly noticed public hearing as prescribed by law to
;;   consider the addition of Chapter 17.59 and amendments to Chapter 17.60 of the
;;   Atherton Municipal Code at the regular January 28, 2026 meeting ... and WHEREAS, the
;;   Planning Commission recommended that the City Council add Chapter 17.59 and amend
;;   Chapter 17.60 ... at the regular January 28, 2026 meeting"). Corroborated
;;   independently by https://athertonca.gov/672/Multi-Family-Housing (Town's own SB 79
;;   review/hearing timeline page, lists "Jan. 28, 2026 - Planning Commission Meeting").
;;   The meeting date and substantive content are therefore REAL and cross-confirmed
;;   from two independent primary Town sources; only the PC's own separate agenda-packet
;;   PDF (as opposed to the ordinance reciting the PC's action) was not independently
;;   resolved to a direct URL this pass.
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 00:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260128-sb79-development-standards)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records the SB 79 Chapter 17.59 recommendation
;;   Given (af:agenda-pc-20260128-sb79-development-standards)
;;   Then the 'agenda-item field mentions "Chapter 17.59" and "SB 79"

(define (af:agenda-pc-20260128-sb79-development-standards)
  (af:city-agenda-item
    "atherton"
    'planning-commission
    "2026-01-28"
    "Public hearing: consider adding Chapter 17.59 (Regulations and Objective Standards for Development Projects sought Pursuant to Government Code Section 65912.157 (SB 79)) and amending Chapter 17.60 of the Atherton Municipal Code — local objective development standards (setbacks, architectural design, vehicular circulation, parking, privacy screening, landscaping) for SB 79 housing projects near the Menlo Park Caltrain station; Planning Commission recommended City Council adoption"
    "https://www.athertonca.gov/DocumentCenter/View/12538/Chapter-1759-SB-79-Ordinance"))
