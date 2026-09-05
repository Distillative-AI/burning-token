;; path | HOF/2026/09/05/04/af-agenda-cc-20260128-adu-ordinance-adoption.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-cc-20260128-adu-ordinance-adoption
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-cc-20260128-adu-ordinance-adoption) -> alist
;; Description: REAL /fundamental-ingestion instance. Colma has NO standalone Planning
;;   Commission (confirmed in HOF/sources/colma/SOURCES.md via direct site search — the
;;   Council Committee Assignments page and Planning Department page list no such body); the
;;   5-member Town Council itself acts as the de facto planning/land-use legislative body, so
;;   this record uses body 'city-council per the schema's guidance. Town of Colma City
;;   Council Regular Meeting, January 28, 2026, Consent Calendar Item 3: second reading and
;;   formal adoption of Ordinance No. 2026-829, amending Subchapter 5.03 (Definitions) and
;;   Section IV (Accessory Dwelling Units and Junior Accessory Dwelling Units) of the Colma
;;   Zoning Code to align local ADU/JADU regulations with state law (Government Code Title 7,
;;   Division 1, Chapter 13, as amended through January 1, 2026); statutorily exempt from
;;   CEQA under Public Resources Code § 21080.17. This is a direct housing-relevant item
;;   (state-mandated ADU/JADU zoning-code conformance) and pairs with the sibling ordinance
;;   record af:ord-2026-829-adu-zoning-amendment in this same directory. Confirms and
;;   supersedes the "pending" framing of PL2026-001 in HOF/sources/colma/SOURCES.md and
;;   eligibility-snapshot.md — this item and its January 14, 2026 introduction (4-0 vote,
;;   Council Member Walsh moved, del Rosario seconded) are both directly confirmed from the
;;   packet's own text, not inferred.
;; Source: https://storage.googleapis.com/proudcity/colmaca/2026/01/c7859527-01.28.26-regular-meeting-agenda-packet.pdf
;;   — direct PDF (verified 200 OK / application/pdf via curl), the Town of Colma's own
;;   ProudCity/Google-Cloud-Storage-hosted January 28, 2026 Regular Meeting agenda packet.
;;   Confirmed by full-text extraction (pypdf): page 1 (agenda, Consent Calendar Item 3
;;   verbatim: "Motion to Adopt Ordinance No. 2026-829 of the City Council of the Town of
;;   Colma Amending Subchapter 5.03 (Definitions) and Section IV. (Accessory Dwelling Units
;;   and Junior Accessory Dwelling Units)..."); pages 21-22 (staff report, "Second Reading and
;;   Adoption of an Ordinance Amending Subchapter 5.03...," labeled "AGENDA ITEM #3"). Packet
;;   URL discovered via Linkup deep search after the ProudCity static meeting-taxonomy page
;;   for this date returned 404.
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 04:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-cc-20260128-adu-ordinance-adoption)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result includes 'city-council as an accepted Colma-specific substitute for a
;;     non-existent Planning Commission (see HOF/sources/colma/SOURCES.md body-name caveat)
;;
;; Scenario: the item records the ADU ordinance adoption and CEQA exemption
;;   Given (af:agenda-cc-20260128-adu-ordinance-adoption)
;;   Then the 'agenda-item field mentions "Ordinance No. 2026-829", "Accessory Dwelling
;;     Units", and "PRC § 21080.17"

(define (af:agenda-cc-20260128-adu-ordinance-adoption)
  (af:city-agenda-item
    "colma"
    'city-council
    "2026-01-28"
    "Consent Calendar Item 3: Motion to Adopt Ordinance No. 2026-829 of the City Council of the Town of Colma Amending Subchapter 5.03 (Definitions) and Section IV. (Accessory Dwelling Units and Junior Accessory Dwelling Units) of the Colma Zoning Code to Align Local Regulations with the California Government Code, Title 7, Division 1, Chapter 13, as Amended by Legislation Effective January 1, 2024; March 27, 2024; January 1, 2025; and January 1, 2026, and Finding the Action to be Statutorily Exempt from CEQA Under Public Resources Code § 21080.17 (second reading/adoption; introduced 4-0 at the January 14, 2026 Regular Meeting)"
    "https://storage.googleapis.com/proudcity/colmaca/2026/01/c7859527-01.28.26-regular-meeting-agenda-packet.pdf"))
