;; path | HOF/2026/09/05/21/af-shenanigan-carla-v-san-mateo.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: shenanigan-carla-v-san-mateo
;; Order: 1 (Atomic — nullary constructor, a single seeded af:shenanigan-instance
;;   application as pure data; a CAPTURE-ATTEMPT-DEFEATED instance, deliberately seeded
;;   to show the model tracks losses for the capturing side too, not only successes)
;; Signature: (af:shenanigan-carla-v-san-mateo) -> alist
;; Description: The City of San Mateo denied a 10-unit project using a subjective
;;   design standard; CARLA (California Renters Legal Advocacy and Education Fund)
;;   sued under the Housing Accountability Act (HAA). The First District Court of
;;   Appeal ruled the subjective-design-standard denial violated HAA; the city settled
;;   for $450,000 — a statewide landmark precedent originating in San Mateo County.
;;   This is the model's capture-defeated instance: the mechanism
;;   (subjective-design-standard denial, wielded by the city on behalf of the
;;   incumbent/fiscally-constrained-city interests that discretionary review usually
;;   serves) was struck down by state law (HAA), not by the market or by the
;;   applicant giving up. price-supply-effect is 'delays-supply rather than
;;   'blocks-supply because the project was ultimately not permanently blocked — the
;;   HAA suit and settlement restored the pathway, at the cost of delay and litigation
;;   overhead. outcome 'capture-defeated is the load-bearing field distinguishing this
;;   from the Pacifica/Menlo Park instances.
;; Source: reports/san-mateo-housing-structural-moats.md Section 2;
;;   reports/fact-check-verification.md (confirmed: CARLA v. City of San Mateo HAA
;;   settlement, $450,000)
;; Created: 2026-09-05 21:00:00
;;
;; @gherkin
;; Scenario: CARLA v. San Mateo is recorded as a defeated subjective-design-standard capture
;;   Given (af:shenanigan-carla-v-san-mateo)
;;   Then 'mechanism is 'subjective-design-standard and 'outcome is 'capture-defeated

(define (af:shenanigan-carla-v-san-mateo)
  (af:shenanigan-instance
    "san-mateo"
    'subjective-design-standard
    (list 'incumbent-homeowners 'fiscally-constrained-cities)
    'delays-supply
    "10-unit residential project (CARLA v. City of San Mateo)"
    #f
    'capture-defeated
    (list "https://law.cityofsanmateo.org/"
          "https://www.courts.ca.gov/")
    'confirmed))
