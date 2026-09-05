;; path | HOF/2026/09/05/16/af-agenda-pc-20260825-joint-study-session.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260825-joint-study-session
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260825-joint-study-session) -> alist
;; Description: REAL /fundamental-ingestion instance — UPDATED 2026-09-05 with verified
;;   item-level content from the actual Agenda Packet PDF (previously calendar-level-only;
;;   see git history for that earlier honest-placeholder version). Pacifica Planning
;;   Commission held a Joint Study Session with City Council on 2026-08-25, 6:00 PM. The
;;   PDF's own outline/bookmarks confirm exactly one substantive item: "6284: Discuss
;;   Coastal Commission Modifications to Pacifica LCP Amendment No. 2-PAC-25-0079-2 (STRs)"
;;   with attachment "Coastal Commission Staff Report dated August 12, 2026". This is a
;;   Coastal Commission Local Coastal Program amendment concerning short-term rentals
;;   (STRs) — NOT a housing-production/entitlement item (none of the prior candidate
;;   guesses — Housing Element implementation, Builder's Remedy response, Quarry/Coastal
;;   Crest Residences — were correct; recorded here as a correction). Retained in this
;;   dataset for completeness of Pacifica's docket, not counted as housing-signal.
;; Source: direct Agenda Packet PDF (FileOpen.aspx?Type=1&ID=1654), verified by its own
;;   embedded PDF metadata: Title "Agenda - Tuesday, August 25, 2026", Subject "City of
;;   Pacifica - Joint Study Session" — matched against the IQM2 calendar's "Planning
;;   Commission - Joint Study Session, Aug 25, 2026 6:00 PM" row (was:
;;   https://pacificacityca.iqm2.com/Citizens/Calendar.aspx?From=1/1/2026&To=12/31/2026,
;;   a full-year calendar list, not a specific meeting or document).
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 16:00:00
;; Updated: 2026-09-05 — replaced calendar-only placeholder with verified item content and
;;   the direct Agenda Packet PDF link, so the UI can link straight to the source document.
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260825-joint-study-session)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records the verified STR-related Coastal Commission item, not a
;;   fabricated housing topic
;;   Given (af:agenda-pc-20260825-joint-study-session)
;;   Then the 'agenda-item field mentions "Coastal Commission" and "STRs" and does not
;;     assert a housing-entitlement topic that the source document does not contain

(define (af:agenda-pc-20260825-joint-study-session)
  (af:city-agenda-item
    "pacifica"
    'planning-commission
    "2026-08-25"
    "Joint Study Session with City Council — Item 6284: Discuss Coastal Commission Modifications to Pacifica LCP (Local Coastal Program) Amendment No. 2-PAC-25-0079-2 concerning short-term rentals (STRs), with an attached Coastal Commission Staff Report dated August 12, 2026 (not a housing-entitlement item)"
    "https://pacificacityca.iqm2.com/Citizens/FileOpen.aspx?Type=1&ID=1654&Inline=True"))
