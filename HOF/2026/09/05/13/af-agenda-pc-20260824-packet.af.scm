;; path | HOF/2026/09/05/13/af-agenda-pc-20260824-packet.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260824-packet
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260824-packet) -> alist
;; Description: REAL /fundamental-ingestion instance, packet-level only. Menlo Park Planning
;;   Commission meeting 8/24/2026: a 9MB agenda packet was published (per the live agenda
;;   index pull) but individual line-item titles have NOT yet been extracted from the PDF —
;;   the "Next" note in the source index explicitly flags opening individual packets for
;;   housing items (density bonus, SB9/ADU permits, Builder's Remedy hearings) as unfinished
;;   follow-up work. agenda-item text below is therefore deliberately scoped to what is
;;   actually known (packet existence + size + the standing housing-item candidate types
;;   named in the source note), not invented line-item content.
;; Source: direct Agenda Packet PDF, re-verified 2026-09-05: fetched
;;   Content-Type: application/pdf, Content-Length: 9,685,091 bytes (≈9MB, matches the
;;   page's displayed size). CORRECTION: the URL previously stored here
;;   (.../2026-meetings/agendas/20260824-Planning-Commission-agenda-packet.pdf, plural
;;   "agendas", capitalized filename, /v/1/) now 404s — the city's asset path changed to
;;   singular "agenda" with a bumped version segment (/v/2/) and a lowercase filename.
;;   Re-resolved live from the current Agendas-and-minutes page rather than guessed/
;;   pattern-matched from the old URL.
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 13:00:00
;; Updated: 2026-09-05 — fixed a dead source-url (city renamed/reversioned the asset path)
;;   to the current working direct PDF link.
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260824-packet)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t

(define (af:agenda-pc-20260824-packet)
  (af:city-agenda-item
    "menlo-park"
    'planning-commission
    "2026-08-24"
    "Agenda packet published (9MB); line items not yet extracted — candidate housing items per pull-plan note: density bonus applications, SB9/ADU permits, Builder's Remedy project hearings"
    "https://www.menlopark.gov/files/sharedassets/public/v/2/agendas-and-minutes/planning-commission/2026-meetings/agenda/20260824-planning-commission-agenda-packet.pdf"))
