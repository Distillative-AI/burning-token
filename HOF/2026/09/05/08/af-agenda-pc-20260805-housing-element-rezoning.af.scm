;; path | HOF/2026/09/05/08/af-agenda-pc-20260805-housing-element-rezoning.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260805-housing-element-rezoning
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260805-housing-element-rezoning) -> alist
;; Description: REAL /fundamental-ingestion instance for Half Moon Bay. Planning Commission
;;   Special Meeting, Wednesday 8/5/2026, Item 5.A: "Municipal Code Amendments to Implement
;;   the Sixth Cycle Housing Element" — a public hearing on revisions to the Municipal
;;   Code/Local Coastal Program Implementation Plan (IP): revising the Zoning Map (rezoning
;;   15 parcels, per the "Rezoning Map (15 Parcels)" correspondence item added after the
;;   packet was posted), revising Chapter 18.20 (Local Coastal Development Permits), and
;;   adding two brand-new zoning chapters: 18.43 "Higher Density Workforce Housing" and
;;   18.44 "By-Right Affordable Housing Development." The Commission voted to approve a
;;   resolution recommending City Council adopt the implementing ordinance and directing
;;   staff to forward the amendments to HCD for approval and to the California Coastal
;;   Commission for certification (roll call vote 4-1, confirmed from the same packet's
;;   embedded minutes reproduced in the 8/25/2026 agenda packet: Gorn, Hernandez, DelNagro,
;;   Ruddock yes; Rems no). This is the direct rezoning action referenced in
;;   HOF/sources/half-moon-bay/eligibility-snapshot.md as the pending cure for Half Moon
;;   Bay's RHNA site-capacity shortfall and the mechanism by which the City hopes to exit
;;   Builder's-Remedy exposure — confirmed here as an actual, voted Planning Commission
;;   hearing item, not merely a plan. Packet attachments include the draft ordinance
;;   (Attachment 2), the HCD letters of 2/2/2026 and 3/24/2026 (Attachments 3-4, matching
;;   the dates in eligibility-snapshot.md), and an attachment titled "The State vs City of
;;   Half Moon Bay" (Attachment 5) — title as listed on the agenda; contents not
;;   independently reviewed beyond the table of contents in this pass. Only the agenda
;;   text and the embedded minutes summary were read; the full staff report body and
;;   ordinance text (Attachments 1-2) were not read in this pass.
;; Source: https://d3n9y02raazwpg.cloudfront.net/halfmoonbay/f661cfba-8ac0-11f1-bb61-005056a89546-cd4a2209-1453-446e-897b-2c6c76fde19c-1785974758.pdf
;;   — direct Agenda Packet PDF, linked from the "Agenda Packet" column of the City's
;;   official Granicus archive listing for the Planning Commission body
;;   (https://halfmoonbay.granicus.com/ViewPublisher.php?view_id=4, the same view_id=4
;;   channel independently confirmed as "Planning Commission" per
;;   HOF/sources/half-moon-bay/SOURCES.md). Verified live: curl returned HTTP 200,
;;   content-type application/pdf; PDF text was extracted (via pypdf) and confirmed to
;;   contain the exact agenda text quoted above, including the "5.A MUNICIPAL CODE
;;   AMENDMENTS TO IMPLEMENT THE SIXTH CYCLE HOUSING ELEMENT" heading, the Chapter
;;   18.43/18.44 titles, and the HCD-letter attachment dates matching the independently
;;   sourced eligibility-snapshot.md dates (2026-02-02, 2026-03-24). The 4-1 vote tally was
;;   read from the Aug 5, 2026 minutes text reproduced verbatim on pages 3-4 of the
;;   separately-verified 8/25/2026 agenda packet (same Granicus channel, clip_id=1449),
;;   which cross-confirms this meeting actually occurred and was decided as described.
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 08:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260805-housing-element-rezoning)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records the new zoning chapters implementing the Housing Element
;;   Given (af:agenda-pc-20260805-housing-element-rezoning)
;;   Then the 'agenda-item field mentions "Chapter 18.43" and "Chapter 18.44" and
;;     "Sixth Cycle Housing Element"

(define (af:agenda-pc-20260805-housing-element-rezoning)
  (af:city-agenda-item
    "half-moon-bay"
    'planning-commission
    "2026-08-05"
    "Item 5.A: Municipal Code Amendments to Implement the Sixth Cycle Housing Element — public hearing on revisions to the Municipal Code/Local Coastal Program Implementation Plan (IP): rezoning 15 parcels per the Zoning Map amendment, revising Chapter 18.20 (Local Coastal Development Permits), and adding new Chapter 18.43 (Higher Density Workforce Housing) and Chapter 18.44 (By-Right Affordable Housing Development); Commission approved a resolution (4-1 roll call) recommending City Council adopt the implementing ordinance and directing staff to forward the amendments to HCD for approval and to the California Coastal Commission for certification"
    "https://d3n9y02raazwpg.cloudfront.net/halfmoonbay/f661cfba-8ac0-11f1-bb61-005056a89546-cd4a2209-1453-446e-897b-2c6c76fde19c-1785974758.pdf"))
