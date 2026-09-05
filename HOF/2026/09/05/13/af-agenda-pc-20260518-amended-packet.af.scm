;; path | HOF/2026/09/05/13/af-agenda-pc-20260518-amended-packet.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260518-amended-packet
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260518-amended-packet) -> alist
;; Description: REAL /fundamental-ingestion instance, packet-level only. Menlo Park Planning
;;   Commission meeting 5/18/2026: an AMENDED 64MB agenda packet was published (largest
;;   packet in the pulled 2026 index, and explicitly marked "amended" on the source page —
;;   both facts suggesting substantive/contested content, consistent with the density-bonus/
;;   Builder's Remedy/ADU candidate topics named in the index's own "Next" note). Individual
;;   line items not yet extracted from the PDF in this pass.
;; Source: direct Agenda Packet PDF, re-verified 2026-09-05: fetched
;;   Content-Type: application/pdf, Content-Length: 67,423,388 bytes (≈64MB, matches the
;;   page's displayed size). CORRECTION: the URL previously stored here
;;   (.../2026-meetings/agendas/20260518-Planning-Commission-agenda-packet-amended.pdf,
;;   plural "agendas", capitalized filename, /v/1/) now 404s — the city's asset path
;;   changed to singular "agenda" with a bumped version segment (/v/3/) and a lowercase
;;   filename. Re-resolved live from the current Agendas-and-minutes page rather than
;;   guessed/pattern-matched from the old URL.
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 13:00:00
;; Updated: 2026-09-05 — fixed a dead source-url (city renamed/reversioned the asset path)
;;   to the current working direct PDF link.
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260518-amended-packet)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t

(define (af:agenda-pc-20260518-amended-packet)
  (af:city-agenda-item
    "menlo-park"
    'planning-commission
    "2026-05-18"
    "AMENDED agenda packet published (64MB, largest 2026 PC packet pulled); line items not yet extracted — candidate housing items per pull-plan note: density bonus applications, SB9/ADU permits, Builder's Remedy project hearings"
    "https://www.menlopark.gov/files/sharedassets/public/v/3/agendas-and-minutes/planning-commission/2026-meetings/agenda/20260518-planning-commission-agenda-packet-amended.pdf"))
