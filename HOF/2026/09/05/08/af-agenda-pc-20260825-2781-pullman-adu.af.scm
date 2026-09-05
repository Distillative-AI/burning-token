;; path | HOF/2026/09/05/08/af-agenda-pc-20260825-2781-pullman-adu.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260825-2781-pullman-adu
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260825-2781-pullman-adu) -> alist
;; Description: REAL /fundamental-ingestion instance for Half Moon Bay. Planning Commission
;;   Regular Meeting, Tuesday 8/25/2026, Public Hearing Item 1.A: application for a Coastal
;;   Development Permit and Architectural Review to allow construction of a new 4,471
;;   square-foot single-family residence AND an attached Accessory Dwelling Unit (ADU) on a
;;   19,370 square-foot site at 2781 Pullman Avenue. City File #: PDP25-054. Owner/Applicant:
;;   Plan A Design Group / Mark Stoloski. Project Planner: Scott Phillips. This is a concrete,
;;   housing-relevant (new SFR + ADU, i.e. two dwelling units on one lot) Coastal Development
;;   Permit item — directly illustrating how Half Moon Bay's Chapter 18.20 CDP-gating
;;   mechanism (documented in HOF/sources/half-moon-bay/SOURCES.md §3c) applies in practice
;;   to a routine residential/ADU project, distinct from the City's larger SB35/Housing-
;;   Element rezoning actions. The packet's attachments (a Stoloski/Gonzalez PUD Plan,
;;   a 2011 recirculated Initial Study, hydrology/biological/noise reports) suggest the
;;   parcel has an unusually long entitlement history tied to a prior Planned Unit
;;   Development approval (City Council Resolution 04-12, referenced as Attachment 3) —
;;   this prior-PUD linkage was not independently researched beyond what appears in the
;;   table of contents and was not confirmed against any other source. Only the agenda
;;   project-description text and attachment list were read in this pass; the staff report
;;   body, resolution findings, and plans (Attachments 1-10) were not read.
;; Source: https://d3n9y02raazwpg.cloudfront.net/halfmoonbay/5fbc5568-fc8e-11f0-bb28-005056a89546-cd4a2209-1453-446e-897b-2c6c76fde19c-1787271439.pdf
;;   — direct Agenda Packet PDF, linked from the "Agenda Packet" column of the City's
;;   official Granicus archive listing for the Planning Commission body
;;   (https://halfmoonbay.granicus.com/ViewPublisher.php?view_id=4, the same view_id=4
;;   channel independently confirmed as "Planning Commission" per
;;   HOF/sources/half-moon-bay/SOURCES.md). Verified live: curl returned HTTP 200,
;;   content-type application/pdf; PDF text was extracted (via pypdf) and confirmed to
;;   contain the exact project-description text quoted above, including "CITY FILE #:
;;   PDP25-054", "2781 PULLMAN AVENUE", and "ACCESSORY DWELLING UNIT" verbatim on page 2 of
;;   the PDF, under the "TUESDAY, AUGUST 25, 2026" agenda header on page 1.
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 08:05:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260825-2781-pullman-adu)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records the ADU and CDP details for 2781 Pullman Avenue
;;   Given (af:agenda-pc-20260825-2781-pullman-adu)
;;   Then the 'agenda-item field mentions "Accessory Dwelling Unit" and "PDP25-054"

(define (af:agenda-pc-20260825-2781-pullman-adu)
  (af:city-agenda-item
    "half-moon-bay"
    'planning-commission
    "2026-08-25"
    "Public Hearing Item 1.A: Application for a Coastal Development Permit and Architectural Review to allow construction of a new 4,471 square-foot single-family residence and attached Accessory Dwelling Unit on a 19,370 square-foot site at 2781 Pullman Avenue; City File # PDP25-054; Owner/Applicant: Plan A Design Group / Mark Stoloski; Project Planner: Scott Phillips"
    "https://d3n9y02raazwpg.cloudfront.net/halfmoonbay/5fbc5568-fc8e-11f0-bb28-005056a89546-cd4a2209-1453-446e-897b-2c6c76fde19c-1787271439.pdf"))
