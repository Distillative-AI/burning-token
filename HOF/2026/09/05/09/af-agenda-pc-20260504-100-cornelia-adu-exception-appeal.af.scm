;; path | HOF/2026/09/05/09/af-agenda-pc-20260504-100-cornelia-adu-exception-appeal.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260504-100-cornelia-adu-exception-appeal
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260504-100-cornelia-adu-exception-appeal) -> alist
;; Description: REAL /fundamental-ingestion instance for Hillsborough, CA. Hillsborough has
;;   NO Planning Commission (confirmed structural fact per HOF/sources/hillsborough/SOURCES.md);
;;   land-use/design-review authority for substantial residential projects, including
;;   discretionary ADU Exception review, sits with the 5-member Architecture and Design Review
;;   Board (ADRB) under the Planning/Building Division. This record uses the 'planning-commission
;;   body symbol as the closest schema-supported equivalent for the ADRB, per the same
;;   body-substitution convention the schema documents for transportation-commission equivalents.
;;   ADRB Regular Meeting, Monday, May 4, 2026, Agenda Section VII (Formal Review Items),
;;   Item 3: 100 Cornelia Drive (APN 031-104-280) — an appeal of a STAFF-LEVEL approval of an
;;   Accessory Dwelling Unit (ADU) Exception for a 1,600 sq ft detached ADU. The ADU Exception
;;   process (Hillsborough Municipal Code § 17.52.050) allows discretionary review/approval of
;;   ADUs that do not meet ministerial-ADU standards (size, setbacks, height, exterior materials
;;   and colors) — i.e. this is a real, substantive housing-approval-process item (ADU appeal),
;;   not a routine single-family remodel/addition item (which dominate the rest of this agenda).
;;   Confirmed directly from the agenda PDF text (extracted via pypdf) — item wording, address,
;;   APN, and CEQA-exemption citation (Pub. Resources Code § 21000 et seq., CEQA Guidelines
;;   § 15303) all appear verbatim in the source document. Applicant/appellant identity not
;;   stated on this agenda page — do not infer one. This item was later continued to the
;;   June 15, 2026 ADRB meeting (see sibling file
;;   af-agenda-pc-20260615-100-cornelia-adu-exception-appeal-continued.af.scm).
;; Source: https://www.hillsborough.net/AgendaCenter/ViewFile/Agenda/_05042026-1430 — verified
;;   by direct curl (200 application/pdf) and by pypdf text extraction confirming the address
;;   "100 Cornelia Drive", "Accessory Dwelling Unit (ADU) Exception", and "May 4, 2026" all
;;   appear in the extracted agenda text; this is the ADRB Agenda Center's own direct
;;   ViewFile PDF link (not a portal list page), found via the ADRB archive page
;;   https://www.hillsborough.net/AgendaCenter/Architecture-Design-Review-Board-1.
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 09:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260504-100-cornelia-adu-exception-appeal)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records the ADU Exception appeal at 100 Cornelia Drive
;;   Given (af:agenda-pc-20260504-100-cornelia-adu-exception-appeal)
;;   Then the 'agenda-item field mentions "Accessory Dwelling Unit (ADU) Exception" and
;;     "100 Cornelia Drive"

(define (af:agenda-pc-20260504-100-cornelia-adu-exception-appeal)
  (af:city-agenda-item
    "hillsborough"
    'planning-commission
    "2026-05-04"
    "Architecture and Design Review Board (ADRB) — Hillsborough's de facto planning-commission-equivalent body (Hillsborough has no standing Planning Commission); Formal Review Item 3: 100 Cornelia Drive (APN 031-104-280) — Appeal of staff-level approval of an Accessory Dwelling Unit (ADU) Exception for a 1,600 sq ft detached ADU under Hillsborough Municipal Code § 17.52.050 (discretionary review of ADUs not meeting ministerial-ADU standards for size, setbacks, height, or exterior materials/colors); CEQA-exempt under CEQA Guidelines § 15303 (New Construction or Conversion of Small Structures)"
    "https://www.hillsborough.net/AgendaCenter/ViewFile/Agenda/_05042026-1430"))
