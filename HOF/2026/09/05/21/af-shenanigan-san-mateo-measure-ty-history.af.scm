;; path | HOF/2026/09/05/21/af-shenanigan-san-mateo-measure-ty-history.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: shenanigan-san-mateo-measure-ty-history
;; Order: 1 (Atomic — nullary constructor, a single seeded af:shenanigan-instance
;;   application as pure data)
;; Signature: (af:shenanigan-san-mateo-measure-ty-history) -> alist
;; Description: San Mateo (city) Measure Y (2020) imposed a voter-approved height/
;;   density cap; when the adopted General Plan 2040 needed to exceed that cap to meet
;;   RHNA obligations, state law required a SECOND ballot measure (Measure T, Nov.
;;   2024) to legalize the upzoning. Measure T passed, but the sequence demonstrates
;;   that upzoning in San Mateo runs through the ballot box, not just the council — a
;;   structural ballot-box-supermajority mechanism that pre-dates and arguably
;;   inspired the Menlo Park parking-lot measure (HLC of San Mateo County explicitly
;;   frames the Menlo Park measure as an exported "playbook"). outcome here is
;;   'capture-defeated from the capturing side's perspective: the supermajority
;;   requirement Measure Y created did NOT ultimately block the RHNA-required upzoning
;;   — Measure T passed and the upzoning proceeded — though the mechanism cost an
;;   extra election cycle of delay, which is why price-supply-effect is
;;   'delays-supply rather than 'blocks-supply.
;; Source: reports/san-mateo-housing-structural-moats.md Section 1.3;
;;   reports/fact-check-verification.md (confirmed: San Mateo Measure T, Nov. 2024);
;;   https://www.cityofsanmateo.org/ballotmeasure
;; Created: 2026-09-05 21:00:00
;;
;; @gherkin
;; Scenario: the Measure T/Y history is recorded as a delayed-but-defeated ballot-box capture
;;   Given (af:shenanigan-san-mateo-measure-ty-history)
;;   Then 'mechanism is 'ballot-box-supermajority, 'outcome is 'capture-defeated, and
;;     'price-supply-effect is 'delays-supply

(define (af:shenanigan-san-mateo-measure-ty-history)
  (af:shenanigan-instance
    "san-mateo"
    'ballot-box-supermajority
    (list 'incumbent-homeowners)
    'delays-supply
    "General Plan 2040 upzoning (Measure Y 2020 cap -> Measure T Nov. 2024)"
    "2024-11-05"
    'capture-defeated
    (list "https://www.cityofsanmateo.org/ballotmeasure")
    'confirmed))
