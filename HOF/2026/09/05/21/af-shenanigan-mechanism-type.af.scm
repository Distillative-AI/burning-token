;; path | HOF/2026/09/05/21/af-shenanigan-mechanism-type.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: shenanigan-mechanism-type
;; Order: 1 (Atomic — nullary constructor of a closed enum/taxonomy as pure data; the
;;   "HOW" axis of the housing.shenanigans model, kept orthogonal to
;;   af:shenanigan-beneficiary-class (the "WHO") and price-supply-effect (the "SO WHAT"))
;; Signature: (af:shenanigan-mechanism-type) -> (listof symbol)
;; Description: The regulatory-tool taxonomy drawn from
;;   reports/san-mateo-housing-structural-moats.md Section 1 (1.1 zoning incumbency,
;;   1.2 CEQA litigation, 1.3 discretionary review/ballot-box, 1.4 permitting fees) —
;;   the specific mechanism/regulation being wielded in a given instance, independent
;;   of who benefits or what it does to price/supply. Seven closed values:
;;     'ceqa-litigation             — CEQA challenge/appeal (or credible threat of one)
;;                                     used to delay, downsize, or kill a project
;;     'discretionary-design-review — subjective design-standard or discretionary
;;                                     Use-Permit/Design-Review denial or downsizing,
;;                                     including Planning-Commission votes that assert
;;                                     local rules override state streamlining law
;;     'ballot-box-supermajority    — voter-approval / supermajority requirement placed
;;                                     on upzoning, density, height, or disposition of
;;                                     city-owned land (Measure T/Y-style, Menlo Park
;;                                     parking-lot measure)
;;     'subjective-design-standard  — a standard vague/subjective enough to function as
;;                                     a de facto veto notwithstanding HAA objective-
;;                                     standards requirements (the CARLA v. San Mateo
;;                                     fact pattern specifically)
;;     'pla-linked-appeal           — CEQA or discretionary appeal filed or threatened
;;                                     as leverage to extract a Project Labor Agreement,
;;                                     independent of the underlying environmental or
;;                                     design merits (Section 1.2's Jerry Brown "hammer")
;;     'minimum-lot-size-setback    — minimum-lot-size, setback, FAR-cap, or height-cap
;;                                     zoning-code provisions that structurally exclude
;;                                     multifamily/infill by design (Section 1.1)
;;     'fiscal-zoning-prop13        — Prop-13-driven fiscalization of land use: a city
;;                                     favoring commercial/sales-tax-generating land use
;;                                     over housing because housing is a net fiscal cost
;;                                     under Prop 13's revenue structure
;;   Deliberately excludes mandatory-parking-minimums and permitting-fee-schedules as
;;   separate top-level values for now — Section 1.4's fee/timeline data is flagged in
;;   the source report itself as an unresolved gap ("not fully resolved... flagged as a
;;   gap needing direct municipal fee-schedule pulls"); adding a taxonomy value ahead of
;;   an actual instance would be enum inflation without evidence. Extend this list only
;;   when a real instance needs a value not already covered (constitution anti-over-
;;   engineering bias) — do not pre-populate speculative categories.
;; Source: reports/san-mateo-housing-structural-moats.md Section 1 (1.1-1.4)
;; Created: 2026-09-05 21:00:00
;;
;; @gherkin
;; Scenario: the taxonomy is closed and matches the source report's mechanism list
;;   Given (af:shenanigan-mechanism-type)
;;   Then the result contains exactly 'ceqa-litigation, 'discretionary-design-review,
;;     'ballot-box-supermajority, 'subjective-design-standard, 'pla-linked-appeal,
;;     'minimum-lot-size-setback, 'fiscal-zoning-prop13

(define (af:shenanigan-mechanism-type)
  (list 'ceqa-litigation
        'discretionary-design-review
        'ballot-box-supermajority
        'subjective-design-standard
        'pla-linked-appeal
        'minimum-lot-size-setback
        'fiscal-zoning-prop13))
