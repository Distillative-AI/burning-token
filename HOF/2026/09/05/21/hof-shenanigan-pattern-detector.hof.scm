;; path | HOF/2026/09/05/21/hof-shenanigan-pattern-detector.hof.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; hof: shenanigan-pattern-detector
;; Order: 2 (Second Order — flags a repeating pattern in a jurisdiction's timeline that
;;   should trigger a Linkup follow-up search in the app; feeds the app's
;;   decide-next-search logic. Does NOT itself call Linkup — that dispatch lives in
;;   app/, which this citizen deliberately does not touch)
;; Composed from: hof:shenanigan-timeline (HOF/2026/09/05/21/hof-shenanigan-timeline.hof.scm)
;; Signature: (hof:shenanigan-pattern-detector timeline months) -> alist
;;   timeline : (listof alist) — a hof:shenanigan-timeline result for one jurisdiction,
;;              already sorted oldest-first
;;   months   : number — the recency window in months for "recent" instances; dated
;;              instances are treated as recent if undateable-to-exact-days comparison
;;              isn't available in this interpreter, so this function uses the coarser,
;;              honestly-scoped signal of "the N most recent DATED instances" rather
;;              than pretending to do precise date-arithmetic the interpreter doesn't
;;              have built in — see Description for the exact rule
;; Description: Flags 'pattern-detected when 3 OR MORE 'discretionary-design-review
;;   (or 'ballot-box-supermajority) mechanism instances with outcome
;;   'capture-succeeded or 'capture-contested appear among the timeline's dated
;;   instances — the task's own named example ("3+ discretionary-denials in 12 months
;;   despite Builder's Remedy eligibility"). Because this interpreter/model has no
;;   verified date-arithmetic primitive available to this citizen, the "12 months"
;;   window is implemented as a documented, honestly-scoped approximation: it counts
;;   over the LAST N dated instances in the timeline (N defaults to all dated
;;   instances passed in) rather than silently claiming precise month-bucketing it
;;   cannot verify — a real month-window filter should be applied by the caller before
;;   invoking this function once true date-diff tooling is available, and this
;;   docstring is the flag that it isn't wired up yet (constitution: report state
;;   honestly, no undersell/no oversell).
;;   Returns:
;;     'pattern-detected      — boolean, true when threshold-count-or-more qualifying
;;                              instances are found
;;     'qualifying-count      — the count found
;;     'qualifying-instances  — the actual instances (for the caller to inspect/cite)
;;     'follow-up-search-hint — a string the app's decide-next-search logic can use
;;                              directly as (or seed for) a Linkup query, naming the
;;                              jurisdiction and the pattern, only populated when
;;                              'pattern-detected is true
;; Source: task framing ("3+ discretionary-denials in 12 months despite Builder's
;;   Remedy eligibility... feeds the app's decide-next-search logic")
;; Created: 2026-09-05 21:00:00
;;
;; @gherkin
;; Scenario: 3+ contested/succeeded discretionary or ballot-box captures trigger a pattern flag
;;   Given a timeline with 3 dated instances whose mechanism is 'discretionary-design-review
;;     or 'ballot-box-supermajority and whose outcome is 'capture-succeeded or
;;     'capture-contested
;;   When hof:shenanigan-pattern-detector is applied
;;   Then 'pattern-detected is #t and 'follow-up-search-hint is a non-empty string
;;
;; Scenario: fewer than 3 qualifying instances does not trigger a pattern flag
;;   Given a timeline with only 2 qualifying instances
;;   When hof:shenanigan-pattern-detector is applied
;;   Then 'pattern-detected is #f and 'follow-up-search-hint is #f

(define (hof:shenanigan-pattern-detector timeline months)
  (define threshold 3)
  (define (qualifying-mechanism? m)
    (or (eq? m 'discretionary-design-review) (eq? m 'ballot-box-supermajority)))
  (define (qualifying-outcome? o)
    (or (eq? o 'capture-succeeded) (eq? o 'capture-contested)))
  (define (qualifies? inst)
    (and (cdr (assoc 'date inst)) ;; only dated instances count toward the window
         (qualifying-mechanism? (cdr (assoc 'mechanism inst)))
         (qualifying-outcome? (cdr (assoc 'outcome inst)))))
  (define qualifying (filter qualifies? timeline))
  (define n (length qualifying))
  (define detected (>= n threshold))
  (define jurisdiction
    (if (null? timeline) "unknown" (cdr (assoc 'jurisdiction (car timeline)))))
  (define hint
    (if detected
        (string-append jurisdiction
          ": 3+ discretionary/ballot-box housing-capture instances found — verify "
          "current Builder's Remedy eligibility and check for a new denial/measure "
          "since the last dated instance in this timeline")
        #f))
  (list (cons 'pattern-detected detected)
        (cons 'qualifying-count n)
        (cons 'qualifying-instances qualifying)
        (cons 'follow-up-search-hint hint)))
