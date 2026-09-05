;; path | HOF/2026/09/05/16/af-agenda-pc-20260825-joint-study-session.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260825-joint-study-session
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260825-joint-study-session) -> alist
;; Description: REAL /fundamental-ingestion instance, but CALENDAR-LEVEL ONLY. Source
;;   (HOF/sources/pacifica/planning-commission/agendas/2026-agenda-index.md) is an IQM2
;;   full-year calendar pull recording meeting date/status/doc-availability, not individual
;;   agenda item text. Pacifica Planning Commission held a Joint Study Session with City
;;   Council on 2026-08-25 (a separate Special Meeting is also listed same-day per the
;;   calendar — see source note below). "Agenda" and "Agenda Packet" documents are listed as
;;   available on the IQM2 calendar row for this entry, but the Aug 25, 2026 Joint Study
;;   Session content itself was NOT successfully opened during this pass — the underlying
;;   topic (candidate guesses in the source note: Housing Element implementation, Builder's
;;   Remedy response, or the Quarry/Coastal Crest Residences project) is NOT recorded here
;;   because it was not verified against the actual document. Do not treat the 'agenda-item
;;   field below as item-level content — it honestly states only what the calendar row shows
;;   (meeting type + joint-body composition + doc-availability), not a substantive agenda
;;   item description. This citizen exists to mark the joint-session calendar fact accurately;
;;   a follow-up ingestion pass that successfully opens the Agenda/Agenda Packet documents
;;   should supersede or extend this with real item-level content.
;; Source: https://pacificacityca.iqm2.com/Citizens/Calendar.aspx?From=1/1/2026&To=12/31/2026
;;   (IQM2 calendar, Planning Commission group filter; confirmed no-login-required; pulled
;;   live 2026-09-05 via human-in-the-loop browser session)
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 16:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260825-joint-study-session)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item honestly records calendar-level-only status, not fabricated topic content
;;   Given (af:agenda-pc-20260825-joint-study-session)
;;   Then the 'agenda-item field mentions "Joint Study Session" and "City Council" and
;;     does not assert a specific policy topic as confirmed

(define (af:agenda-pc-20260825-joint-study-session)
  (af:city-agenda-item
    "pacifica"
    'planning-commission
    "2026-08-25"
    "Joint Study Session with City Council (calendar-level entry only — item-level agenda content not yet opened/verified; IQM2 calendar lists \"Agenda\" and \"Agenda Packet\" as available documents; a separate same-day \"Special Meeting\" is also listed on the calendar for this date, not conflated with this joint session entry; candidate topic guesses noted in source but NOT confirmed — do not treat as substantive content)"
    "https://pacificacityca.iqm2.com/Citizens/Calendar.aspx?From=1/1/2026&To=12/31/2026"))
