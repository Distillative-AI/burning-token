;; path | HOF/2026/09/05/19/af-millbrae-pc-cancellation-rate-2026.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: millbrae-pc-cancellation-rate-2026
;; Order: 1 (Atomic — nullary constructor, a single derived observation as pure data; not a
;;   new schema, deliberately reuses the plain alist shape rather than inventing an
;;   annotation-class citizen for one observation per hof-judgement's anti-over-engineering
;;   bias)
;; Signature: (af:millbrae-pc-cancellation-rate-2026) -> alist
;; Description: Cross-city signal candidate, recorded honestly as a single-source observation
;;   derived by counting the calendar rows in
;;   HOF/sources/millbrae/planning-commission/agendas/2026-agenda-index.md, NOT independently
;;   verified against a second source. Of 19 dated 2026 Planning Commission meetings on
;;   Millbrae's CivicEngage agenda calendar, 11 are marked "CANCELLED" (58%) — the highest
;;   rate seen yet across this project's pulls. This is now a THIRD data point in an emerging
;;   cross-city pattern candidate: Pacifica ~47% (af:pacifica-pc-cancellation-rate-2026,
;;   HOF/2026/09/05/16/), Redwood City ~50% (noted in that citizen's cross-city-comparison
;;   field), Millbrae ~58% (this citizen) — three San Mateo County jurisdictions all showing
;;   reduced 2026 Planning Commission review cadence, strong enough now to flag as a genuine
;;   candidate for the eventual cross-city distillation pass. This citizen records only the
;;   Millbrae-side numerator/denominator; it does not itself perform or claim that cross-city
;;   distillation.
;; Source: HOF/sources/millbrae/planning-commission/agendas/2026-agenda-index.md
;;   (derived from https://ci.millbrae.ca.us/AgendaCenter/Search/?term=Planning+Commission,
;;   pulled live 2026-09-05 via browser session + curl/pdftotext, no login wall)
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 19:00:00
;;
;; @gherkin
;; Scenario: the observation records the correct ratio
;;   Given (af:millbrae-pc-cancellation-rate-2026)
;;   Then 'cancelled-count is 11 and 'dated-meetings-count is 19

(define (af:millbrae-pc-cancellation-rate-2026)
  (list (cons 'city "millbrae")
        (cons 'body 'planning-commission)
        (cons 'year 2026)
        (cons 'cancelled-count 11)
        (cons 'dated-meetings-count 19)
        (cons 'cancellation-rate 0.58)
        (cons 'cross-city-comparison "third data point in an emerging cross-city cancellation-rate pattern: Pacifica ~47% (af:pacifica-pc-cancellation-rate-2026, HOF/2026/09/05/16/), Redwood City ~50%, Millbrae ~58% (highest yet); NOT independently cross-checked as a second source per city — each remains a single-source observation, but the three-city convergence is now strong enough to flag for the eventual cross-city distillation pass")
        (cons 'source-url "https://ci.millbrae.ca.us/AgendaCenter/Search/?term=Planning+Commission")))
