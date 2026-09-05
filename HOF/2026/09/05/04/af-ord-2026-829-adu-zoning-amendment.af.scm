;; path | HOF/2026/09/05/04/af-ord-2026-829-adu-zoning-amendment.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: ord-2026-829-adu-zoning-amendment
;; Order: 1 (Atomic — nullary constructor wrapping af:adopted-ordinance with real ingested data)
;; Signature: (af:ord-2026-829-adu-zoning-amendment) -> alist
;; Description: REAL /fundamental-ingestion instance for Colma, a very small town (~1,500
;;   residents) with NO standalone Planning Commission (confirmed in
;;   HOF/sources/colma/SOURCES.md — land-use legislative action is handled directly by the
;;   5-member Town Council; ministerial/administrative permits are handled by staff Planning
;;   Department). Ordinance No. 2026-829, "An Ordinance of the City Council of the Town of
;;   Colma Amending Subchapter 5.03 (Definitions) and Section IV. (Accessory Dwelling Units
;;   and Junior Accessory Dwelling Units) of the Colma Zoning Code to Align Local Regulations
;;   with the California Government Code, Title 7, Division 1, Chapter 13, as Amended by
;;   Legislation Effective January 1, 2024; March 27, 2024; January 1, 2025; and January 1,
;;   2026" — a direct state-mandate-conformance ADU/JADU ordinance, statutorily exempt from
;;   CEQA under Public Resources Code § 21080.17. Confirmed sequence directly from the PDF
;;   text: introduced (first reading) at the January 14, 2026 Regular Meeting (per that
;;   meeting's minutes, item 9, "Accessory Dwelling Unit Ordinance Amendments," motion to
;;   introduce, carried 4-0), then second reading and formal adoption at the January 28, 2026
;;   Regular Meeting as Consent Calendar Item 3, "Motion to Adopt Ordinance No. 2026-829..."
;;   This matches and confirms the town's own current-projects tracker entry PL2026-001,
;;   "Zoning Amendment for ADU State mandates" — "Approved and adopted by the City Council on
;;   1/28/2026" (https://www.colma.ca.gov/current-projects/), previously flagged in
;;   HOF/sources/colma/SOURCES.md and eligibility-snapshot.md as a pending/expected action;
;;   this file confirms it with the actual ordinance number, exact title, and adoption date.
;;   Effective date is NOT independently confirmed from the packet (ordinances typically take
;;   effect 30 days after adoption per general law, i.e. ~2026-02-27, but that specific
;;   effective-date language was not located in the extracted packet text this pass) — left
;;   as #f rather than inferred, per the schema's own convention for unknown fields.
;; Source: https://storage.googleapis.com/proudcity/colmaca/2026/01/c7859527-01.28.26-regular-meeting-agenda-packet.pdf
;;   — direct PDF (verified 200 OK / application/pdf via curl), the Town of Colma's own
;;   ProudCity/Google-Cloud-Storage-hosted January 28, 2026 Regular Meeting agenda packet.
;;   Confirmed by full-text extraction (pypdf): page 1 lists Consent Calendar Item 3 "Motion
;;   to Adopt Ordinance No. 2026-829..." verbatim matching this title; pages 21-22 contain the
;;   staff report "Second Reading and Adoption of an Ordinance Amending Subchapter 5.03...",
;;   Agenda Item #3, confirming the ordinance number, full title, and CEQA exemption citation;
;;   page 7 (January 14, 2026 minutes, included in this same packet) confirms the introduction
;;   date and 4-0 vote. Packet URL discovered via Linkup deep search
;;   ("storage.googleapis.com proudcity colmaca 01.28.26 agenda packet") after the
;;   meeting-taxonomy static page for that date 404'd.
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 04:00:00
;;
;; @gherkin
;; Scenario: construct the Colma ADU zoning amendment ordinance record
;;   Given (af:ord-2026-829-adu-zoning-amendment)
;;   Then the 'ordinance-number field is "2026-829"
;;   And the 'title field mentions "Accessory Dwelling Units" and "Junior Accessory Dwelling
;;     Units"
;;   And the 'adopted-date field is "2026-01-28"
;;   And the 'effective-date field is #f (not confirmed in the source packet this pass)

(define (af:ord-2026-829-adu-zoning-amendment)
  (af:adopted-ordinance
    "colma"
    "2026-829"
    "An Ordinance of the City Council of the Town of Colma Amending Subchapter 5.03 (Definitions) and Section IV. (Accessory Dwelling Units and Junior Accessory Dwelling Units) of the Colma Zoning Code to Align Local Regulations with the California Government Code, Title 7, Division 1, Chapter 13, as Amended by Legislation Effective January 1, 2024; March 27, 2024; January 1, 2025; and January 1, 2026 — Statutorily Exempt from CEQA Under Public Resources Code Section 21080.17"
    "2026-01-28"
    #f
    "https://storage.googleapis.com/proudcity/colmaca/2026/01/c7859527-01.28.26-regular-meeting-agenda-packet.pdf"))
