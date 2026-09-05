;; path | HOF/2026/09/05/17/af-agenda-pc-20260406-1257-magnolia-condoconvert-adu.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260406-1257-magnolia-condoconvert-adu
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260406-1257-magnolia-condoconvert-adu) -> alist
;; Description: REAL /fundamental-ingestion instance for San Carlos. San Carlos "Planning and
;;   Transportation Commission" (the city's merged Planning Commission — see
;;   HOF/sources/san-carlos/SOURCES.md §1 for the body-name caveat) Regular Meeting,
;;   4/6/2026 (PrimeGov meetingId=2810). Public Hearing Item 7a: 1257 Magnolia Avenue —
;;   Request for a Vesting Tentative Map to allow the subdivision of an approved nine-unit
;;   apartment building into nine individually conveyable condominium units. APN
;;   050-071-020. Same agenda's Reports/Correspondence section (item 10c-i) also lists an
;;   "ADU Affordability Methodology" memorandum, noted here as a secondary confirmed fact
;;   on the same agenda but NOT itself a public hearing action item — recorded in the
;;   agenda-item text for completeness, not as a separate ingestion. No staff report / packet
;;   was pulled this pass — only the standalone Agenda document (3 pages) was fetched and
;;   PDF-text-extracted; unit count, address, and APN are taken directly from that agenda
;;   text. Whether the Commission approved, continued, or denied this item is UNCONFIRMED
;;   (would require the Minutes document, not pulled this pass).
;; Source: https://cityofsancarlos.primegov.com/Public/CompiledDocument/16991 — verified by:
;;   (1) HTTP 200 / content-type application/pdf via curl -L; (2) this PrimeGov
;;   CompiledDocument id was matched to meetingId=2810 (Apr 6, 2026 Planning and
;;   Transportation Commission Regular Meeting)'s "Agenda" documentList entry via
;;   https://cityofsancarlos.primegov.com/api/v2/PublicPortal/ListArchivedMeetings?year=2026;
;;   (3) downloaded PDF's own text confirms "CITY OF SAN CARLOS / PLANNING AND
;;   TRANSPORTATION COMMISSION / Regular Meeting / April 6, 2026" and the "1257 Magnolia
;;   Avenue" / "nine-unit apartment building" / "APN 050-071-020" language quoted above.
;;   Note: this CompiledDocument endpoint 302-redirects to a short-lived Azure Blob SAS URL
;;   each time it is fetched — the CompiledDocument URL itself (not the signed blob URL) is
;;   the stable direct-document link and is what is recorded as source-url here, matching
;;   this project's San Mateo PrimeGov precedent (see HOF/2026/09/05/14's Clearview Way
;;   file).
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 17:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260406-1257-magnolia-condoconvert-adu)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records the condominium-conversion housing action and its APN
;;   Given (af:agenda-pc-20260406-1257-magnolia-condoconvert-adu)
;;   Then the 'agenda-item field mentions "nine-unit apartment building" and
;;     "APN 050-071-020"

(define (af:agenda-pc-20260406-1257-magnolia-condoconvert-adu)
  (af:city-agenda-item
    "san-carlos"
    'planning-commission
    "2026-04-06"
    "Public Hearing Item 7a: 1257 Magnolia Avenue — Request for a Vesting Tentative Map to allow the subdivision of an approved nine-unit apartment building into nine individually conveyable condominium units; APN 050-071-020. Same agenda's correspondence section also lists a memorandum on ADU Affordability Methodology."
    "https://cityofsancarlos.primegov.com/Public/CompiledDocument/16991"))
