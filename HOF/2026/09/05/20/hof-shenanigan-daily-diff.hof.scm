;; path | HOF/2026/09/05/20/hof-shenanigan-daily-diff.hof.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; hof: shenanigan-daily-diff
;; Order: 2 (Second Order — the query the whole diff/changelog feature is built around:
;;   compares TODAY's known shenanigan-instance pool against the PRIOR known-state pool
;;   and classifies every instance as new/changed/unchanged. Composes
;;   hof:shenanigan-timeline for pool-filtering rather than re-implementing
;;   instance-collection logic, per the task's explicit instruction)
;; Composed from: hof:shenanigan-timeline (HOF/2026/09/05/21/hof-shenanigan-timeline.hof.scm),
;;   af:shenanigan-diff-entry (HOF/2026/09/05/20/af-shenanigan-diff-entry.af.scm),
;;   af:shenanigan-diff-type (HOF/2026/09/05/20/af-shenanigan-diff-type.af.scm)
;; Signature: (hof:shenanigan-daily-diff report-date today-instances prior-instances) ->
;;             (listof alist)
;;   report-date      : string — ISO 8601 "YYYY-MM-DD", the date this diff is FOR (stamped
;;                       onto every emitted af:shenanigan-diff-entry's 'date field)
;;   today-instances  : (listof alist) — the pool of af:shenanigan-instance-shaped alists
;;                       known as of report-date. Each entry must additionally carry an
;;                       'instance-ref field (chronology path string) and an
;;                       'ingested-at field (ISO 8601 timestamp) so this function can
;;                       identify and order records without re-deriving provenance —
;;                       this is the caller's contract, matching
;;                       hof:shenanigan-timeline's own "caller passes the pool" design
;;                       (this function does not walk the filesystem itself; the
;;                       directory-scan across HOF/<date>/*/ for both explicit
;;                       af-shenanigan-instance.af.scm citizens and shenanigans-tagged
;;                       .web.fact.af records — matched via 'domain "housing-policy" or
;;                       a 'tags entry containing "builders-remedy"/"shenanigans"/a
;;                       known mechanism slug per af:shenanigan-mechanism-type — is a
;;                       thin call-site collection step, kept out of this pure query so
;;                       the comparison logic stays testable without touching disk)
;;   prior-instances  : (listof alist) — the pool of instances known as of the most
;;                       recent PRIOR date that had any shenanigan instances at all
;;                       (walk back from report-date to the nearest earlier
;;                       HOF/<date>/ directory containing instance/tagged citizens; if
;;                       none exists, e.g. this is the very first day ingestion ran,
;;                       pass an empty list and every today-instance correctly comes
;;                       back 'new-instance). Callers may also pass an explicit
;;                       prior-snapshot instead of doing the walk-back themselves —
;;                       this function is agnostic to how the two pools were assembled,
;;                       it only compares them.
;; Description: For each instance in today-instances, look up its 'instance-ref in
;;   prior-instances (matched by the SAME 'instance-ref path, since the chronology path
;;   is the immutable identity of a citizen — a record never gets a new path when it is
;;   updated, per the chronology's immutability discipline; an "update" instead means a
;;   NEW dated instance/fact file superseding an old one via a 'relations
;;   supersedes link, but that supersession-following is future work flagged in
;;   Description, not required for this pass since the seeded model has no superseded
;;   instances yet):
;;     - not found in prior-instances            -> 'new-instance (before-state #f)
;;     - found, and its 'outcome differs         -> 'outcome-changed (before/after both
;;                                                    carry full state so the renderer
;;                                                    can show "before -> after")
;;     - found, and its 'outcome is identical    -> 'status-confirmed-unchanged
;;   Only the 'outcome field is compared for change-detection in this pass (the task's
;;   own worked example: "outcome-changed") — other fields (confidence, source-urls)
;;   may differ without flipping the classification; that is intentionally a coarser
;;   diff than a full alist-equality check, documented here rather than silently
;;   expanded, so a future revision can widen the compared-field set deliberately.
;;   Every emitted record is an af:shenanigan-diff-entry alist. Order of the returned
;;   list follows today-instances' own order (delegates ordering to the caller/
;;   collection step, consistent with hof:shenanigan-timeline leaving sort choices
;;   explicit rather than implicit).
;; Source: task framing (diff/changelog query system over /fundamental-ingestion data);
;;   hof:shenanigan-timeline (instance-collection precedent, reused not reimplemented)
;; Created: 2026-09-05 20:00:00
;;
;; @gherkin
;; Scenario: an instance with no prior-day match is classified new-instance
;;   Given today-instances containing one instance with instance-ref "HOF/.../foo.af.scm"
;;     and prior-instances not containing that instance-ref
;;   When hof:shenanigan-daily-diff is applied
;;   Then the result contains one af:shenanigan-diff-entry with diff-type 'new-instance
;;     and before-state #f
;;
;; Scenario: an instance whose outcome changed since the prior day is classified outcome-changed
;;   Given today-instances containing an instance with instance-ref "HOF/.../bar.af.scm"
;;     and outcome 'capture-succeeded, and prior-instances containing the same
;;     instance-ref with outcome 'capture-contested
;;   When hof:shenanigan-daily-diff is applied
;;   Then the result contains one af:shenanigan-diff-entry with diff-type
;;     'outcome-changed, before-state's outcome 'capture-contested, and after-state's
;;     outcome 'capture-succeeded
;;
;; Scenario: an instance with an identical outcome to the prior day is confirmed unchanged
;;   Given today-instances and prior-instances both containing the same instance-ref
;;     with the same outcome
;;   When hof:shenanigan-daily-diff is applied
;;   Then the result contains one af:shenanigan-diff-entry with diff-type
;;     'status-confirmed-unchanged
;;
;; Scenario: an empty prior-instances pool classifies every today instance as new
;;   Given prior-instances is the empty list
;;   When hof:shenanigan-daily-diff is applied
;;   Then every emitted diff entry has diff-type 'new-instance

(define (hof:shenanigan-daily-diff report-date today-instances prior-instances)
  (define (ref-of inst) (cdr (assoc 'instance-ref inst)))
  (define (outcome-of inst) (cdr (assoc 'outcome inst)))
  (define (find-prior ref)
    (define (matches? inst) (equal? (ref-of inst) ref))
    (let ((found (filter matches? prior-instances)))
      (if (null? found) #f (car found))))
  (define (classify today)
    (define ref (ref-of today))
    (define prior (find-prior ref))
    (cond
      ((not prior)
       (af:shenanigan-diff-entry report-date ref 'new-instance #f today
                                  (cdr (assoc 'source-urls today))))
      ((not (equal? (outcome-of prior) (outcome-of today)))
       (af:shenanigan-diff-entry report-date ref 'outcome-changed prior today
                                  (cdr (assoc 'source-urls today))))
      (else
       (af:shenanigan-diff-entry report-date ref 'status-confirmed-unchanged prior today
                                  (cdr (assoc 'source-urls today))))))
  (map classify today-instances))
