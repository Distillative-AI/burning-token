;; path | HOF/2026/09/05/17/af-agenda-pc-20260316-nesp-eir-housing-element-apr.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260316-nesp-eir-housing-element-apr
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260316-nesp-eir-housing-element-apr) -> alist
;; Description: REAL /fundamental-ingestion instance for San Carlos. San Carlos "Planning and
;;   Transportation Commission" (merged Planning Commission — see
;;   HOF/sources/san-carlos/SOURCES.md §1) Regular Meeting, 3/16/2026 (PrimeGov
;;   meetingId=2809). Two housing-relevant items on the same agenda: (1) Public Hearing
;;   Item 7a — "Northeast Area Specific Plan - Public Comment Hearing on the Draft
;;   Environmental Impact Report (EIR)" — the Northeast Area Specific Plan is San Carlos's
;;   corridor/transit-area rezoning and housing-capacity planning effort (cross-reference
;;   HOF/sources/san-carlos/SOURCES.md's General Plan Reset / focused General Plan and
;;   Zoning Update material); this item is the Draft EIR public comment hearing stage, not
;;   a final approval — no unit count is stated on the agenda page itself. (2) Presentations
;;   Item 8a — "Receive a presentation on the City of San Carlos' 2025 Housing Element
;;   Annual Progress Report" (the state-mandated APR tracking RHNA/Housing-Element
;;   progress; cross-reference HOF/sources/san-carlos/eligibility-snapshot.md's Housing
;;   Element compliance section). Only the standalone Agenda document (not the packet) was
;;   pulled and PDF-text-extracted this pass — no EIR content, unit projections, or APR
;;   figures were reviewed beyond the two agenda-line titles quoted above.
;; Source: https://cityofsancarlos.primegov.com/Public/CompiledDocument/16898 — verified by:
;;   (1) HTTP 200 / content-type application/pdf via curl -L; (2) this PrimeGov
;;   CompiledDocument id matched to meetingId=2809 (Mar 16, 2026 Planning and
;;   Transportation Commission Regular Meeting)'s "Agenda" documentList entry via
;;   https://cityofsancarlos.primegov.com/api/v2/PublicPortal/ListArchivedMeetings?year=2026;
;;   (3) downloaded PDF's own text confirms "CITY OF SAN CARLOS / PLANNING AND
;;   TRANSPORTATION COMMISSION / Regular Meeting / March 16, 2026" and both agenda-item
;;   titles quoted above verbatim. As with the sibling San Carlos file in this same batch,
;;   the CompiledDocument URL (stable) rather than its 302-redirect target (a short-lived
;;   Azure Blob SAS URL) is recorded as source-url.
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 17:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260316-nesp-eir-housing-element-apr)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records both the Northeast Area Specific Plan Draft EIR hearing and the Housing Element APR presentation
;;   Given (af:agenda-pc-20260316-nesp-eir-housing-element-apr)
;;   Then the 'agenda-item field mentions "Northeast Area Specific Plan" and
;;     "2025 Housing Element Annual Progress Report"

(define (af:agenda-pc-20260316-nesp-eir-housing-element-apr)
  (af:city-agenda-item
    "san-carlos"
    'planning-commission
    "2026-03-16"
    "Public Hearing Item 7a: Northeast Area Specific Plan — Public Comment Hearing on the Draft Environmental Impact Report (EIR), San Carlos's transit-corridor housing-capacity rezoning effort. Presentations Item 8a (same agenda): Receive a presentation on the City of San Carlos' 2025 Housing Element Annual Progress Report."
    "https://cityofsancarlos.primegov.com/Public/CompiledDocument/16898"))
