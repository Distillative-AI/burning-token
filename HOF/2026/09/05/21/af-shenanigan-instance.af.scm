;; path | HOF/2026/09/05/21/af-shenanigan-instance.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: shenanigan-instance
;; Order: 1 (Atomic — constructor for a single regulatory-capture instance as pure data;
;;   composes the two sibling closed taxonomies af:shenanigan-mechanism-type (HOW) and
;;   af:shenanigan-beneficiary-class (WHO) plus a third orthogonal axis, price-supply-
;;   effect (SO WHAT), rather than flattening all three into one enum)
;; Signature: (af:shenanigan-instance jurisdiction mechanism beneficiary-classes
;;              price-supply-effect target-project date outcome source-urls confidence)
;;              -> alist
;;   jurisdiction        : string       — city/agency slug matching HOF/sources/<slug>/
;;   mechanism           : symbol       — one value from (af:shenanigan-mechanism-type)
;;   beneficiary-classes : (listof symbol) — one or more values from
;;                          (af:shenanigan-beneficiary-class); a list because a single
;;                          instance often serves more than one beneficiary class at once
;;                          (e.g. a discretionary denial can serve both incumbent
;;                          homeowners AND a fiscally-constrained city simultaneously)
;;   price-supply-effect : symbol       — one of 'raises-prices 'blocks-supply
;;                          'delays-supply 'both — the framing task's own required
;;                          effect axis: "drive housing prices higher or prevent
;;                          affordable housing supply"
;;   target-project      : string|#f    — the specific project/parcel/proposal targeted,
;;                          if any; #f for jurisdiction-wide mechanisms (e.g. a blanket
;;                          zoning code provision) with no single named target
;;   date                : string|#f    — ISO 8601 "YYYY-MM-DD" of the capture event
;;                          (vote, filing, settlement, election); #f if only a date
;;                          range/period is known
;;   outcome             : symbol       — 'capture-succeeded 'capture-defeated
;;                          'capture-contested (active/unresolved as of pull date)
;;   source-urls         : (listof string) — direct URLs; never a bare citation string
;;   confidence          : symbol       — 'confirmed 'reported 'contested, mirroring the
;;                          verification-log discipline already used in
;;                          reports/fact-check-verification.md (confirmed/outdated/
;;                          partially-unverifiable) so an instance's evidentiary
;;                          strength is queryable, not just its content
;; Description: SINGLE regulatory-capture instance. Every instance must name the specific
;;   mechanism wielded, who captures/benefits (cui bono), and the price/supply effect —
;;   this is NOT a generic NIMBY-tactic log (an instance without all three axes filled is
;;   incomplete per the task framing). Real instances are seeded as their own sibling
;;   citizens in this directory (af-shenanigan-*-instance.af.scm, one function per file
;;   per Constitution Art. I §2) rather than inlined here, matching the
;;   af:adopted-ordinance / af:adopted-ordinance-example split already used in
;;   HOF/2026/09/05/12/.
;; Source: reports/san-mateo-housing-structural-moats.md Section 1 + 1.6;
;;   reports/fact-check-verification.md (Pacifica Quarry correction)
;; Created: 2026-09-05 21:00:00
;;
;; @gherkin
;; Scenario: construct a capture instance with a single beneficiary class
;;   Given jurisdiction "redwood-city", mechanism 'ceqa-litigation,
;;     beneficiary-classes (list 'construction-trade-unions),
;;     price-supply-effect 'blocks-supply, target-project "603 Jefferson Ave",
;;     date "2019-01-01", outcome 'capture-succeeded,
;;     source-urls (list "http://sfbamo.com/news/lawsuit-eliminates-23-homes-from-redwood-city-condo-proposal/"),
;;     confidence 'confirmed
;;   When af:shenanigan-instance is applied
;;   Then the result is an alist with keys jurisdiction, mechanism, beneficiary-classes,
;;     price-supply-effect, target-project, date, outcome, source-urls, confidence
;;
;; Scenario: a defeated capture attempt is still a valid instance
;;   Given outcome 'capture-defeated
;;   When af:shenanigan-instance is applied
;;   Then the result records the defeat, not just successful captures — the model
;;     tracks capture ATTEMPTS and their fate, not only wins

(define (af:shenanigan-instance jurisdiction mechanism beneficiary-classes
                                 price-supply-effect target-project date outcome
                                 source-urls confidence)
  (list (cons 'jurisdiction jurisdiction)
        (cons 'mechanism mechanism)
        (cons 'beneficiary-classes beneficiary-classes)
        (cons 'price-supply-effect price-supply-effect)
        (cons 'target-project target-project)
        (cons 'date date)
        (cons 'outcome outcome)
        (cons 'source-urls source-urls)
        (cons 'confidence confidence)))
