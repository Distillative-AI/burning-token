;; path | HOF/2026/09/05/21/af-shenanigan-beneficiary-class.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: shenanigan-beneficiary-class
;; Order: 1 (Atomic — nullary constructor of a closed enum/taxonomy as pure data; the
;;   "WHO" axis of the housing.shenanigans model, kept orthogonal to
;;   af:shenanigan-mechanism-type (the "HOW") and price-supply-effect (the "SO WHAT")
;;   per /pareto-razor cui-bono discipline)
;; Signature: (af:shenanigan-beneficiary-class) -> (listof symbol)
;; Description: The cui-bono taxonomy from reports/san-mateo-housing-structural-moats.md
;;   Section 1.6 "Cui bono — who benefits from the status quo" and Section 4's ranked
;;   "who structurally benefits" list, promoted to its own independently-queryable
;;   citizen (rather than inlined as a bare string field on af:shenanigan-instance) so
;;   the model can answer "which beneficiary class dominates this jurisdiction's
;;   capture pattern" without re-parsing every instance's prose. Five closed values,
;;   deliberately excluding Section 1.6's two-sided "some employers" entry (its own
;;   source calls it two-sided/ambiguous cui-bono, not a clean capture beneficiary —
;;   honestly omitted rather than forced into a symbol that would misrepresent it):
;;     'incumbent-homeowners        — zoning scarcity drives net-worth appreciation;
;;                                     highest-turnout local voting bloc
;;     'institutional-landlords     — existing landlords / institutional multifamily
;;                                     owners; scarcity supports rents without build risk
;;     'construction-trade-unions   — CEQA/discretionary review leveraged for PLA
;;                                     concessions, independent of environmental merit
;;                                     (Section 1.2, the Jerry Brown "hammer" quote)
;;     'large-landowners            — large low-density landowners capturing scarcity
;;                                     value without development risk (Woodside,
;;                                     Portola Valley, hillside estates)
;;     'fiscally-constrained-cities — Prop 13 "fiscalization of land use": commercial/
;;                                     sales tax revenue beats housing's net fiscal cost
;;   NOT a scoring function — af:shenanigan-instance selects one or more of these
;;   values per instance; hof:shenanigan-capture-score (HOF/2026/09/05/21/) is what
;;   turns a distribution over this taxonomy into a jurisdiction-level signal.
;; Source: reports/san-mateo-housing-structural-moats.md Section 1.6, Section 4
;; Created: 2026-09-05 21:00:00
;;
;; @gherkin
;; Scenario: the taxonomy is closed and matches the source report's cui-bono list
;;   Given (af:shenanigan-beneficiary-class)
;;   Then the result contains exactly 'incumbent-homeowners, 'institutional-landlords,
;;     'construction-trade-unions, 'large-landowners, 'fiscally-constrained-cities

(define (af:shenanigan-beneficiary-class)
  (list 'incumbent-homeowners
        'institutional-landlords
        'construction-trade-unions
        'large-landowners
        'fiscally-constrained-cities))
