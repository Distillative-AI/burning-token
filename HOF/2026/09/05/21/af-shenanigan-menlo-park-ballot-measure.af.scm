;; path | HOF/2026/09/05/21/af-shenanigan-menlo-park-ballot-measure.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: shenanigan-menlo-park-ballot-measure
;; Order: 1 (Atomic — nullary constructor, a single seeded af:shenanigan-instance
;;   application as pure data)
;; Signature: (af:shenanigan-menlo-park-ballot-measure) -> alist
;; Description: Menlo Park anti-housing ballot measure, qualified 2025-10-21, on the
;;   ballot for Nov. 2026 (corrected per fact-check from the original report's "(2025)"
;;   label). Would require voter approval before any change of use — including
;;   surplus-land disposal — for three city-owned parking lots, retroactively blocking
;;   dispositions after 2025-05-15, directly threatening 345+ planned affordable homes;
;;   the city is funding proponents' legal defense if challenged. HLC of San Mateo
;;   County names this the new NIMBY "playbook" — a ballot-box-supermajority mechanism
;;   exported from San Mateo's own Measure T/Y precedent (see
;;   af:shenanigan-san-mateo-measure-ty-history, this directory). date below is the
;;   qualification date (the concrete, dated event so far); the vote itself is still
;;   pending, hence outcome 'capture-contested — a standing follow-up-search candidate
;;   for hof:shenanigan-pattern-detector until the Nov 2026 vote resolves it.
;; Source: reports/san-mateo-housing-structural-moats.md Section 1.3;
;;   https://hlcsmc.org/2025/11/03/anti-housing-ballot-measure-in-menlo-park-becomes-new-nimby-playbook/
;; Created: 2026-09-05 21:00:00
;;
;; @gherkin
;; Scenario: the Menlo Park ballot measure is recorded as a contested ballot-box capture
;;   Given (af:shenanigan-menlo-park-ballot-measure)
;;   Then 'mechanism is 'ballot-box-supermajority, 'beneficiary-classes contains
;;     'incumbent-homeowners, and 'outcome is 'capture-contested

(define (af:shenanigan-menlo-park-ballot-measure)
  (af:shenanigan-instance
    "menlo-park"
    'ballot-box-supermajority
    (list 'incumbent-homeowners)
    'blocks-supply
    "3 city-owned parking lots / 345+ planned affordable homes"
    "2025-10-21"
    'capture-contested
    (list "https://hlcsmc.org/2025/11/03/anti-housing-ballot-measure-in-menlo-park-becomes-new-nimby-playbook/")
    'reported))
