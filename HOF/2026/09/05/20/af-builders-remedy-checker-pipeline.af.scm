;; path | HOF/2026/09/05/20/af-builders-remedy-checker-pipeline.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: builders-remedy-checker-pipeline
;; Order: 1 (Atomic — pure spec/schema record of the app/ pipeline stage sequence;
;;   the running implementation lives in app/src/lib/pipeline.ts, which this citizen
;;   is the durable chronology pointer FOR, per /cfd — code is verified to run first,
;;   this record documents its shape second, and app/README.md points here, not the
;;   other way around)
;; Signature: (af:builders-remedy-checker-pipeline jurisdiction) -> alist
;;   jurisdiction : string — a San Mateo County city slug (see HOF/sources/<slug>/,
;;                  e.g. "menlo-park", "redwood-city", "unincorporated-county")
;; Description: Names the seven ordered stages the Builder's Remedy / SB9-SB35
;;   Eligibility Checker (app/) runs for one jurisdiction lookup, and what each
;;   stage consumes/produces. This is the spec other agents/humans should read to
;;   understand the pipeline shape; the executable truth is app/src/lib/pipeline.ts
;;   (runEligibilityPipeline), verified end-to-end against the live Linkup API on
;;   2026-09-05 (see Verification below).
;;
;;   Stage sequence:
;;     1. input                — user submits an address (best-effort name match,
;;                                not a geocoder) or picks one of the county's
;;                                jurisdictions explicitly.
;;     2. stored-cache-check    — app/src/lib/hofCache.ts walks
;;                                HOF/sources/<jurisdiction>/**/*.{md,scm} and loads
;;                                every pre-existing research doc as a starting
;;                                cache BEFORE any live call, seeding `findings` rows
;;                                tagged origin='cache' pointing back at the file.
;;     3. linkup-search         — app/src/lib/queries.ts builds one initial retrieval
;;                                plan per the linkup-search/linkup-workflow skill
;;                                rules (depth=standard, outputType=searchResults,
;;                                fromDate=12-months-ago) asking for Housing Element
;;                                compliance, SB9/SB35/SB10/Builder's Remedy
;;                                applicability, and recent ordinance/ballot changes;
;;                                app/src/lib/extractFindings.ts turns the response
;;                                into topic-tagged, deduped, capped `findings` rows
;;                                (origin='linkup') with source URLs + confidence.
;;     4. gap-detection          — app/src/lib/gaps.ts (findGaps) inspects the
;;                                accumulated findings for: (a) a required topic
;;                                with zero findings, (b) a required topic where
;;                                every finding reads as ambiguous/unconfirmed, or
;;                                (c) a named-but-undetailed ordinance/ballot measure
;;                                mention. Real inspection logic, not a hardcoded
;;                                second call — a jurisdiction whose first search
;;                                resolves everything triggers zero follow-ups.
;;     5. follow-up-search       — for each of up to 2 gaps, buildFollowUpQuery()
;;                                fires a targeted retrieval plan (depth=deep, since
;;                                these are "find the specific page, then read it"
;;                                sequential lookups) naming the exact fact still
;;                                missing; results feed back into stage 3's
;;                                extraction path.
;;     6. eligibility-verdict    — app/src/lib/eligibility.ts (buildEligibilitySummary)
;;                                scores accumulated findings per pathway (SB9, SB35,
;;                                SB10, Builder's Remedy) into
;;                                likely_applies / possibly_applies /
;;                                likely_does_not_apply / unknown, citing the basis
;;                                claims and source URLs behind each verdict.
;;     7. sourced-output          — app/src/app/results/[sessionId]/page.tsx renders
;;                                the verdict grid, the full search sequence with each
;;                                follow-up's trigger reason, the starting-cache file
;;                                list, every external source URL used, and an
;;                                explicit "Could not confirm" section for any
;;                                pathway that stayed 'unknown.
;;
;;   Verification (2026-09-05): scripts/smoke-test-linkup.ts confirmed a live
;;   Linkup Search API call succeeds (60 result items for a Redwood City query).
;;   The full pipeline was then run end-to-end against the live API for Redwood
;;   City and Menlo Park: stage 2 loaded 3 cached docs; stage 3's initial search
;;   returned findings; stage 4 correctly detected a missing Builder's Remedy
;;   topic and a named-but-undetailed measure ("Measure K" in Menlo Park) and
;;   fired exactly those follow-ups in stage 5; stage 6 produced per-pathway
;;   verdicts; stage 7's "Could not confirm" section correctly listed the
;;   pathways stage 6 scored 'unknown rather than guessing a verdict.
;; Created: 2026-09-05 20:00:00
;;
;; @gherkin
;; Feature: Builder's Remedy Checker pipeline stage record
;;   Scenario: describe the pipeline for a jurisdiction
;;     Given jurisdiction "redwood-city"
;;     When af:builders-remedy-checker-pipeline is applied
;;     Then the result is an alist naming all seven stages in order
;;
;;   Scenario: gap detection only fires real follow-ups
;;     Given a jurisdiction whose initial search resolved every required topic
;;      unambiguously
;;     When gap-detection runs
;;     Then zero follow-up searches are issued
;;
;;   Scenario: an unresolved pathway is disclosed, never guessed
;;     Given a jurisdiction where Builder's Remedy status could not be resolved
;;      by cache or live search
;;     When eligibility-verdict and sourced-output run
;;     Then Builder's Remedy appears in the "Could not confirm" section with
;;      status 'unknown, not a fabricated likely/does-not-apply verdict

(define (af:builders-remedy-checker-pipeline jurisdiction)
  (list (cons 'jurisdiction jurisdiction)
        (cons 'stages
              (list 'input
                    'stored-cache-check
                    'linkup-search
                    'gap-detection
                    'follow-up-search
                    'eligibility-verdict
                    'sourced-output))
        (cons 'implementation "app/src/lib/pipeline.ts")
        (cons 'verified-live-linkup-on "2026-09-05")))
