;; path | HOF/2026/09/05/21/af-shenanigan-redwood-city-603-jefferson.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: shenanigan-redwood-city-603-jefferson
;; Order: 1 (Atomic — nullary constructor, a single seeded af:shenanigan-instance
;;   application as pure data)
;; Signature: (af:shenanigan-redwood-city-603-jefferson) -> alist
;; Description: "Redwood City Residents for Responsible Development" used environmental
;;   (CEQA) litigation to force the 603 Jefferson Ave downtown condo proposal down from
;;   an 8-story, 91-unit project to 6 stories/68 units — a confirmed loss of 23 homes
;;   via settlement. Named plaintiff group reads as a residents'-association vehicle
;;   consistent with incumbent-homeowner interests; no PLA/union angle is documented
;;   for this specific case (contrast with the Jerry-Brown-hammer instance, this
;;   directory, which IS the union/PLA-leverage pattern) so beneficiary-classes here is
;;   incumbent-homeowners only, not construction-trade-unions — do not conflate the two
;;   just because both use the ceqa-litigation mechanism.
;; Source: reports/san-mateo-housing-structural-moats.md Section 1.2;
;;   reports/fact-check-verification.md (confirmed: 91->68 unit loss);
;;   http://sfbamo.com/news/lawsuit-eliminates-23-homes-from-redwood-city-condo-proposal/
;; Created: 2026-09-05 21:00:00
;;
;; @gherkin
;; Scenario: 603 Jefferson Ave is recorded as a succeeded CEQA-litigation capture
;;   Given (af:shenanigan-redwood-city-603-jefferson)
;;   Then 'mechanism is 'ceqa-litigation, 'outcome is 'capture-succeeded, and
;;     'price-supply-effect is 'blocks-supply

(define (af:shenanigan-redwood-city-603-jefferson)
  (af:shenanigan-instance
    "redwood-city"
    'ceqa-litigation
    (list 'incumbent-homeowners)
    'blocks-supply
    "603 Jefferson Ave (91-unit condo proposal downsized to 68 units)"
    #f
    'capture-succeeded
    (list "http://sfbamo.com/news/lawsuit-eliminates-23-homes-from-redwood-city-condo-proposal/")
    'confirmed))
