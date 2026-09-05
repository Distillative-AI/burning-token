;; path | HOF/2026/09/05/21/af-shenanigan-pacifica-quarry-rejection.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: shenanigan-pacifica-quarry-rejection
;; Order: 1 (Atomic — nullary constructor, a single seeded af:shenanigan-instance
;;   application as pure data; live-capture instance, corrected per the fact-check pass)
;; Signature: (af:shenanigan-pacifica-quarry-rejection) -> alist
;; Description: Pacifica Planning Commission voted 5-0 on 2026-08-03 to reject the
;;   Coastal Crest Residences Builder's-Remedy-eligible proposal (grown from "1,000+"
;;   to 1,225 units), arguing that the city's voter-approved land-use requirement
;;   overrides state Builder's Remedy law — a discretionary-review capture happening in
;;   real time, reframed by reports/fact-check-verification.md from "pipeline success"
;;   to "active, contested legal fight over whether Builder's Remedy overrides local
;;   control." Mechanism is discretionary-design-review because the vote itself is the
;;   capture act (a Commission asserting local override authority), distinct from
;;   ballot-box-supermajority (the underlying voter-approved rule the Commission is
;;   invoking, which predates this specific vote and is not itself dated here).
;;   Beneficiary classes: incumbent-homeowners (the voter-approved rule's constituency)
;;   AND fiscally-constrained-cities (a jurisdiction resisting a state-forced allocation
;;   it did not choose) — both apply simultaneously per af:shenanigan-instance's
;;   beneficiary-classes list design. Outcome is 'capture-contested, not
;;   'capture-succeeded, because as of the source pull the fight is active/unresolved
;;   (a Builder's Remedy legal challenge to the rejection is the expected next move,
;;   not yet confirmed) — this is exactly the kind of instance
;;   hof:shenanigan-pattern-detector should flag for a Linkup follow-up search.
;; Source: reports/fact-check-verification.md (Pacifica Quarry correction, row 7);
;;   https://www.sfchronicle.com/bayarea/article/pacifica-housing-project-city-22413580.php
;;   https://sfyimby.com/2025/04/preliminary-plans-for-pacifica-quarry-residential-redevelopment-san-mateo-county.html
;; Created: 2026-09-05 21:00:00
;;
;; @gherkin
;; Scenario: the Pacifica Quarry rejection is recorded as a contested discretionary capture
;;   Given (af:shenanigan-pacifica-quarry-rejection)
;;   Then 'mechanism is 'discretionary-design-review, 'outcome is 'capture-contested,
;;     and 'beneficiary-classes contains both 'incumbent-homeowners and
;;     'fiscally-constrained-cities

(define (af:shenanigan-pacifica-quarry-rejection)
  (af:shenanigan-instance
    "pacifica"
    'discretionary-design-review
    (list 'incumbent-homeowners 'fiscally-constrained-cities)
    'blocks-supply
    "Pacifica Quarry / Coastal Crest Residences (1,225 units)"
    "2026-08-03"
    'capture-contested
    (list "https://www.sfchronicle.com/bayarea/article/pacifica-housing-project-city-22413580.php"
          "https://sfyimby.com/2025/04/preliminary-plans-for-pacifica-quarry-residential-redevelopment-san-mateo-county.html"
          "https://therealdeal.com/san-francisco/2025/04/09/developers-invoke-builders-remedy-for-1k-homes-in-pacifica/")
    'reported))
