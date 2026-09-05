;; path | HOF/2026/09/05/20/af-shenanigan-diff-entry.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: shenanigan-diff-entry
;; Order: 1 (Atomic — constructor for a single diff-line record as pure data; the unit
;;   emitted by hof:shenanigan-daily-diff and consumed by
;;   hof:shenanigan-changelog-render, kept as its own citizen per Constitution Art. I §2
;;   rather than an inline alist shape decided ad-hoc inside the HOF that produces it)
;; Signature: (af:shenanigan-diff-entry date instance-ref diff-type before-state
;;              after-state source-urls) -> alist
;;   date         : string  — ISO 8601 "YYYY-MM-DD", the diff-report date this entry
;;                  belongs to (not necessarily the instance's own 'date field — this is
;;                  "when the diff noticed it", matching the changelog's own date header)
;;   instance-ref : string  — chronology path to the source citizen this entry describes
;;                  (an af-shenanigan-*.af.scm instance file or a .web.fact.af path),
;;                  so every diff line is traceable back to its immutable source record
;;   diff-type    : symbol  — one of 'new-instance 'outcome-changed
;;                  'status-confirmed-unchanged (closed enum; see
;;                  af:shenanigan-diff-type below for the authoritative list)
;;   before-state : alist|#f — the instance's prior-day known state (an
;;                  af:shenanigan-instance-shaped alist, or the relevant subset); #f
;;                  when diff-type is 'new-instance (there is no "before")
;;   after-state  : alist   — the instance's current state (always present — even
;;                  'status-confirmed-unchanged carries the current state so the
;;                  changelog renderer never needs to re-fetch it)
;;   source-urls  : (listof string) — direct URLs backing this specific diff observation
;;                  (usually after-state's own 'source-urls, but kept as an explicit
;;                  field so a diff entry can cite a NEW corroborating source distinct
;;                  from the instance's original source list)
;; Description: ONE line of the daily shenanigans changelog. Deliberately mirrors
;;   af:shenanigan-instance's provenance discipline (source-urls never a bare string)
;;   and its confidence/verdict field with a diff-specific twist: before/after-state are
;;   raw alists (not re-parsed prose) so hof:shenanigan-changelog-render can pure-fold
;;   over them with no LLM call, per the /deep-research report-rendering pattern this
;;   task explicitly points at. Not itself a query — hof:shenanigan-daily-diff is the
;;   query that produces a (listof af:shenanigan-diff-entry) result; this file only
;;   shapes one record.
;; Source: task framing ("track the shenanigans as a 'diff' or changelog... a query
;;   system that can produce the output from our data we ingest using
;;   /fundamental-ingestion"); af-shenanigan-instance.af.scm (field-shape precedent)
;; Created: 2026-09-05 20:00:00
;;
;; @gherkin
;; Scenario: construct a new-instance diff entry (no before-state)
;;   Given date "2026-09-06", instance-ref "HOF/2026/09/06/09/af-shenanigan-foo.af.scm",
;;     diff-type 'new-instance, before-state #f, after-state <alist>,
;;     source-urls (list "http://example.com")
;;   When af:shenanigan-diff-entry is applied
;;   Then the result is an alist with keys date, instance-ref, diff-type, before-state,
;;     after-state, source-urls, and before-state is #f
;;
;; Scenario: construct an outcome-changed diff entry with both states populated
;;   Given diff-type 'outcome-changed, before-state an alist with
;;     (outcome . capture-contested), after-state an alist with
;;     (outcome . capture-succeeded)
;;   When af:shenanigan-diff-entry is applied
;;   Then the result carries both before-state and after-state so a renderer can show
;;     "before -> after" without re-querying the chronology

(define (af:shenanigan-diff-entry date instance-ref diff-type before-state
                                   after-state source-urls)
  (list (cons 'date date)
        (cons 'instance-ref instance-ref)
        (cons 'diff-type diff-type)
        (cons 'before-state before-state)
        (cons 'after-state after-state)
        (cons 'source-urls source-urls)))
