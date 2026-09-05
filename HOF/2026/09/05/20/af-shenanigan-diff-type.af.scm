;; path | HOF/2026/09/05/20/af-shenanigan-diff-type.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: shenanigan-diff-type
;; Order: 1 (Atomic — nullary constructor of a closed enum/taxonomy as pure data,
;;   matching the af:shenanigan-mechanism-type / af:shenanigan-beneficiary-class
;;   precedent of promoting a closed enum to its own queryable citizen rather than
;;   inlining a bare symbol list inside af:shenanigan-diff-entry's docstring only)
;; Signature: (af:shenanigan-diff-type) -> (listof symbol)
;; Description: The three closed classifications a diff query can assign to one
;;   instance comparison, exactly as named in the task:
;;     'new-instance                 — the instance did not exist as a known citizen as
;;                                      of the prior known-state date; first appearance
;;     'outcome-changed              — the instance existed previously AND its 'outcome
;;                                      field (or another tracked field) differs between
;;                                      before-state and after-state
;;     'status-confirmed-unchanged   — the instance existed previously and every tracked
;;                                      field is identical; the diff query re-confirmed
;;                                      it rather than silently omitting it, so a reader
;;                                      of the changelog can distinguish "nothing new
;;                                      happened" from "we didn't check"
;; Source: task framing (diff-type enum: new-instance | outcome-changed |
;;   status-confirmed-unchanged, verbatim)
;; Created: 2026-09-05 20:00:00
;;
;; @gherkin
;; Scenario: the taxonomy is closed and matches the task's own diff-type enum
;;   Given (af:shenanigan-diff-type)
;;   Then the result contains exactly 'new-instance, 'outcome-changed,
;;     'status-confirmed-unchanged

(define (af:shenanigan-diff-type)
  (list 'new-instance
        'outcome-changed
        'status-confirmed-unchanged))
