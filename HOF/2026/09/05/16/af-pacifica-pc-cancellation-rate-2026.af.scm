;; path | HOF/2026/09/05/16/af-pacifica-pc-cancellation-rate-2026.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: pacifica-pc-cancellation-rate-2026
;; Order: 1 (Atomic — nullary constructor, a single derived observation as pure data; not a
;;   new schema, deliberately reuses the plain alist shape rather than inventing an
;;   annotation-class citizen for one observation per hof-judgement's anti-over-engineering
;;   bias)
;; Signature: (af:pacifica-pc-cancellation-rate-2026) -> alist
;; Description: Cross-city signal candidate, recorded honestly as a single-source observation
;;   derived by counting the calendar rows in
;;   HOF/sources/pacifica/planning-commission/agendas/2026-agenda-index.md, NOT independently
;;   verified against a second source. Of 15 dated 2026 Regular-designated Planning Commission
;;   meetings on Pacifica's IQM2 calendar, 7 are marked "Cancelled" (47%). The source notes
;;   this is comparable to (even higher than) a ~50% cancellation pattern separately observed
;;   for Redwood City, raising a candidate hypothesis of reduced planning-commission review
;;   cadence across San Mateo County cities worth checking at the eventual cross-city
;;   distillation pass — this citizen records the Pacifica-side numerator/denominator only; it
;;   does not itself perform or claim that cross-city distillation.
;; Source: HOF/sources/pacifica/planning-commission/agendas/2026-agenda-index.md
;;   (derived from https://pacificacityca.iqm2.com/Citizens/Calendar.aspx?From=1/1/2026&To=12/31/2026)
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 16:00:00
;;
;; @gherkin
;; Scenario: the observation records the correct ratio
;;   Given (af:pacifica-pc-cancellation-rate-2026)
;;   Then 'cancelled-count is 7 and 'dated-regular-meetings-count is 15

(define (af:pacifica-pc-cancellation-rate-2026)
  (list (cons 'city "pacifica")
        (cons 'body 'planning-commission)
        (cons 'year 2026)
        (cons 'cancelled-count 7)
        (cons 'dated-regular-meetings-count 15)
        (cons 'cancellation-rate 0.47)
        (cons 'cross-city-comparison "noted as comparable to/higher than a ~50% cancellation pattern separately observed for Redwood City; NOT independently cross-checked as a second source — single-source observation")
        (cons 'source-url "https://pacificacityca.iqm2.com/Citizens/Calendar.aspx?From=1/1/2026&To=12/31/2026")))
