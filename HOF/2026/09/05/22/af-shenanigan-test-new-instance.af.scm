;; path | HOF/2026/09/05/22/af-shenanigan-test-new-instance.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: shenanigan-test-new-instance
;; *** TEST FIXTURE — NOT A REAL SEEDED INSTANCE ***
;; Authored solely to prove hof:shenanigan-daily-diff correctly classifies a genuinely
;; new instance-ref as 'new-instance while the original 6 seeded instances (all with an
;; earlier ingested-at) classify as 'status-confirmed-unchanged. Plausible fact pattern
;; (a discretionary-review denial in a jurisdiction not yet covered by the seeded set —
;; South San Francisco), but the underlying facts/URLs below are ILLUSTRATIVE/synthetic
;; for the verification pass, not independently sourced per /fundamental-ingestion
;; discipline. Do not cite this file as a real capture instance in any report.
;; Order: 1 (Atomic — nullary constructor of one af:shenanigan-instance application,
;;   matching the seeded-instance file convention exactly, e.g.
;;   af-shenanigan-pacifica-quarry-rejection.af.scm)
;; Signature: (af:shenanigan-test-new-instance) -> alist
;; Description: A hypothetical South San Francisco Planning Commission discretionary
;;   denial of a Builder's-Remedy-eligible project, dated one hour after the seeded
;;   Sept 5 21:00 set (ingested-at 2026-09-05T22:00:00Z vs the seeded set's
;;   2026-09-05T21:00:00Z), used ONLY to give hof:shenanigan-daily-diff a genuinely new
;;   'instance-ref to detect. See docs/SHENANIGANS-MODEL.md "Daily Diff / Changelog"
;;   section for the date-scoping judgment call: this fixture lives in the 09/05/22
;;   hour directory (one hour later than the seeded 09/05/21 set) rather than a new
;;   calendar day, because the diff query's report-date is a caller-supplied pool
;;   boundary, not a hard requirement that new instances land in a new day directory —
;;   verification below runs the diff treating the 09/05/21 set as "prior" and this
;;   fixture as the sole addition to "today's" pool, which is the realistic ingestion
;;   pattern (multiple hours of ingestion accumulate before a diff is generated).
;; Source: TEST FIXTURE — no real source; illustrative URL only
;; Created: 2026-09-05 22:00:00
;;
;; @gherkin
;; Scenario: the test fixture is a valid af:shenanigan-instance shape
;;   Given (af:shenanigan-test-new-instance)
;;   Then the result is an alist with keys jurisdiction, mechanism,
;;     beneficiary-classes, price-supply-effect, target-project, date, outcome,
;;     source-urls, confidence — jurisdiction "south-san-francisco", a jurisdiction
;;     not present in any of the 6 seeded Sept 5 21:00 instances

(define (af:shenanigan-test-new-instance)
  (af:shenanigan-instance
    "south-san-francisco"
    'discretionary-design-review
    (list 'incumbent-homeowners)
    'blocks-supply
    "TEST FIXTURE: 88-unit infill proposal (illustrative)"
    "2026-09-05"
    'capture-contested
    (list "https://example.com/test-fixture-ssf-denial-illustrative-only")
    'reported))
