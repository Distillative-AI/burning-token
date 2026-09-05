;; path | HOF/2026/09/05/17/af-agenda-pc-20260302-seniorliving-pd-3units.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260302-seniorliving-pd-3units
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260302-seniorliving-pd-3units) -> alist
;; Description: REAL /fundamental-ingestion instance for San Carlos. San Carlos "Planning
;;   and Transportation Commission" (merged Planning Commission — see
;;   HOF/sources/san-carlos/SOURCES.md §1) Regular Meeting, 3/2/2026 (PrimeGov
;;   meetingId=2808). Public Hearing item: consideration to amend Planned Development
;;   Ordinance 1265 and approve a Planned Development Plan to allow a floor area addition
;;   and interior remodel to an existing senior living facility, resulting in three (3) net
;;   new units, pursuant to San Carlos Municipal Code (SCMC) Chapters 18.27, 18.29, 18.30,
;;   and 18.36. APN 050-152-320. The facility's name/street address is NOT stated in the
;;   agenda-title text itself (only APN and the PD ordinance number are given) — do not
;;   invent an address not present in the source; a fuller staff report/packet would be
;;   needed to confirm the facility name. Only the standalone Agenda document (not the
;;   packet) was pulled and PDF-text-extracted this pass.
;; Source: https://cityofsancarlos.primegov.com/Public/CompiledDocument/16829 — verified by:
;;   (1) HTTP 200 / content-type application/pdf via curl -L; (2) this PrimeGov
;;   CompiledDocument id matched to meetingId=2808 (Mar 2, 2026 Planning and Transportation
;;   Commission Regular Meeting)'s "Agenda" documentList entry via
;;   https://cityofsancarlos.primegov.com/api/v2/PublicPortal/ListArchivedMeetings?year=2026;
;;   (3) downloaded PDF's own text confirms "CITY OF SAN CARLOS / PLANNING AND
;;   TRANSPORTATION COMMISSION / Regular Meeting / March 2, 2026" and the "Planned
;;   Development Ordinance 1265" / "three (3) net new units" / "APN: 050-152-320" language
;;   quoted above verbatim. As with the sibling San Carlos files in this same batch, the
;;   CompiledDocument URL (stable) rather than its 302-redirect target (a short-lived Azure
;;   Blob SAS URL) is recorded as source-url.
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 17:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260302-seniorliving-pd-3units)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records the net-new-unit count and Planned Development ordinance number
;;   Given (af:agenda-pc-20260302-seniorliving-pd-3units)
;;   Then the 'agenda-item field mentions "three (3) net new units" and
;;     "Planned Development Ordinance 1265"

(define (af:agenda-pc-20260302-seniorliving-pd-3units)
  (af:city-agenda-item
    "san-carlos"
    'planning-commission
    "2026-03-02"
    "Public Hearing Item: Consideration to amend Planned Development Ordinance 1265 and approve a Planned Development Plan to allow a floor area addition and interior remodel to an existing senior living facility, resulting in three (3) net new units, pursuant to SCMC Chapters 18.27, 18.29, 18.30, and 18.36. APN: 050-152-320."
    "https://cityofsancarlos.primegov.com/Public/CompiledDocument/16829"))
