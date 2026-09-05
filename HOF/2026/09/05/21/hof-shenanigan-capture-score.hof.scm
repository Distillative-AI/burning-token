;; path | HOF/2026/09/05/21/hof-shenanigan-capture-score.hof.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; hof: shenanigan-capture-score
;; Order: 2 (Second Order — computes a jurisdiction-specific capture-intensity signal
;;   over a hof:shenanigan-timeline result; a /pareto-razor-style instrument — which
;;   structural cause is probably load-bearing for THIS jurisdiction specifically, not
;;   a countywide average)
;; Composed from: hof:shenanigan-timeline (HOF/2026/09/05/21/hof-shenanigan-timeline.hof.scm),
;;   af:shenanigan-beneficiary-class (HOF/2026/09/05/21/af-shenanigan-beneficiary-class.af.scm)
;; Signature: (hof:shenanigan-capture-score timeline) -> alist
;;   timeline : (listof alist) — the output of hof:shenanigan-timeline for one
;;              jurisdiction (already filtered to that jurisdiction; this function does
;;              not re-filter, keeping the single-responsibility split from its sibling)
;; Description: Computes frequency-weighted beneficiary-class CONCENTRATION, not a flat
;;   average across the county. For each beneficiary class in
;;   (af:shenanigan-beneficiary-class), counts how many instances in the timeline name
;;   that class in their 'beneficiary-classes list (an instance naming 2 classes counts
;;   toward both — it is not split 0.5/0.5, because /pareto-razor cui-bono framing asks
;;   "does this class benefit at all from this capture," not "what fraction"). Reports:
;;     'instance-count          — length of the timeline
;;     'beneficiary-frequencies — alist of (class . count) over ALL 5 classes, so a
;;                                zero-count class is visible, not silently omitted
;;     'dominant-class          — the class with the highest count (first-seen wins a
;;                                tie, matching af:shenanigan-beneficiary-class's fixed
;;                                enum order, so ties are deterministic not arbitrary)
;;     'dominant-share          — dominant class's count / instance-count (0 if
;;                                instance-count is 0, to avoid division by zero)
;;     'capture-intensity       — 'high if dominant-share >= 0.8, 'moderate if >= 0.5,
;;                                'low otherwise (or 'insufficient-data if
;;                                instance-count is 0) — the 80%+ threshold is the
;;                                task's own stated example ("a jurisdiction where 80%+
;;                                of instances benefit incumbent-homeowners scores high
;;                                capture"), not an invented cutoff
;;   This is deliberately a per-jurisdiction signal, computed only from that
;;   jurisdiction's own timeline — comparing capture-intensity across jurisdictions
;;   requires calling this once per jurisdiction's own hof:shenanigan-timeline output,
;;   never one shared/blended computation, per the task's explicit "not a generic
;;   average" instruction.
;; Source: task framing (frequency-weighted beneficiary-class concentration,
;;   80%+ threshold example); reports/san-mateo-housing-structural-moats.md Section 1.6
;; Created: 2026-09-05 21:00:00
;;
;; @gherkin
;; Scenario: a jurisdiction with all instances benefiting incumbent-homeowners scores high
;;   Given a timeline of 4 instances, all with 'incumbent-homeowners in
;;     'beneficiary-classes
;;   When hof:shenanigan-capture-score is applied
;;   Then 'dominant-class is 'incumbent-homeowners, 'dominant-share is 1.0, and
;;     'capture-intensity is 'high
;;
;; Scenario: an empty timeline reports insufficient data, not a false zero score
;;   Given an empty timeline
;;   When hof:shenanigan-capture-score is applied
;;   Then 'capture-intensity is 'insufficient-data

(define (hof:shenanigan-capture-score timeline)
  (define classes (af:shenanigan-beneficiary-class))
  (define n (length timeline))
  (define (count-for class)
    (length (filter (lambda (inst)
                       (member class (cdr (assoc 'beneficiary-classes inst))))
                     timeline)))
  (define freqs (map (lambda (c) (cons c (count-for c))) classes))
  (define (higher? a b) (> (cdr a) (cdr b)))
  (define dominant (if (null? freqs) #f (car (sort freqs higher?))))
  (define dominant-class (if dominant (car dominant) #f))
  (define dominant-count (if dominant (cdr dominant) 0))
  (define dominant-share (if (> n 0) (/ dominant-count n) 0))
  (define intensity
    (cond ((= n 0) 'insufficient-data)
          ((>= dominant-share 0.8) 'high)
          ((>= dominant-share 0.5) 'moderate)
          (else 'low)))
  (list (cons 'instance-count n)
        (cons 'beneficiary-frequencies freqs)
        (cons 'dominant-class dominant-class)
        (cons 'dominant-share dominant-share)
        (cons 'capture-intensity intensity)))
