;; path | HOF/2026/09/05/20/hof-shenanigan-changelog-render.hof.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; hof: shenanigan-changelog-render
;; Order: 2 (Second Order — pure fold over a hof:shenanigan-daily-diff result into
;;   markdown text; no I/O, no fresh LLM call, per the /deep-research
;;   report-rendering pattern — the artifact is regenerable from the chronology alone
;;   any time the same diff-entry list is supplied again)
;; Composed from: af:shenanigan-diff-entry-shaped alists (the output of
;;   hof:shenanigan-daily-diff, HOF/2026/09/05/20/hof-shenanigan-daily-diff.hof.scm)
;; Signature: (hof:shenanigan-changelog-render report-date diff-entries) -> string
;;   report-date  : string — ISO 8601 "YYYY-MM-DD", used in the header and the
;;                  zero-activity sentence
;;   diff-entries : (listof alist) — af:shenanigan-diff-entry records, any order
;; Description: Groups diff-entries by 'diff-type into three sections — "New
;;   Instances", "Outcome Changes" (before -> after), "Confirmed Unchanged" (brief,
;;   one-line each) — and folds each group into markdown. Every non-brief entry cites
;;   jurisdiction, mechanism, beneficiary classes, and source links pulled straight out
;;   of after-state (an af:shenanigan-instance-shaped alist), so a hackathon judge can
;;   see WHO/HOW/SO-WHAT plus provenance without following a link first. The
;;   zero-entries case renders a plain sentence, not an empty section header or an
;;   error, per this task's explicit requirement ("render 'No new shenanigans activity
;;   detected for <date>.' — not an error"). Pure string-building only: no file I/O
;;   here (that is hof:shenanigan-changelog-write's job, kept separate per Constitution
;;   Art. I §2 one-function-per-file, mirroring hof:shenanigan-timeline vs
;;   hof:shenanigan-capture-score's own render/compute split).
;; Source: task framing (markdown changelog format: header, New Instances / Outcome
;;   Changes / Confirmed Unchanged sections, zero-activity sentence, /deep-research
;;   report-rendering pattern citation)
;; Created: 2026-09-05 20:00:00
;;
;; @gherkin
;; Scenario: zero diff entries renders the no-activity sentence, not an error
;;   Given report-date "2026-09-07" and diff-entries the empty list
;;   When hof:shenanigan-changelog-render is applied
;;   Then the result is the string
;;     "# Shenanigans Changelog — 2026-09-07\n\nNo new shenanigans activity detected for 2026-09-07.\n"
;;
;; Scenario: a mix of diff-types renders all three sections in order
;;   Given diff-entries containing one 'new-instance, one 'outcome-changed, and one
;;     'status-confirmed-unchanged entry
;;   When hof:shenanigan-changelog-render is applied
;;   Then the result contains a "## New Instances" section, then "## Outcome Changes"
;;     showing before -> after, then "## Confirmed Unchanged" with one-line entries,
;;     in that order
;;
;; Scenario: an outcome-changed entry shows before -> after
;;   Given one 'outcome-changed entry with before-state outcome 'capture-contested and
;;     after-state outcome 'capture-succeeded
;;   When hof:shenanigan-changelog-render is applied
;;   Then the rendered "## Outcome Changes" section contains the substring
;;     "capture-contested -> capture-succeeded"

(define (hof:shenanigan-changelog-render report-date diff-entries)
  (define (of key alist) (cdr (assoc key alist)))
  (define (entries-of type)
    (filter (lambda (e) (eq? (of 'diff-type e) type)) diff-entries))

  (define (source-links urls)
    (if (null? urls)
        "(no source url)"
        (apply string-append
               (map (lambda (u) (string-append "[source](" u ") ")) urls))))

  (define (instance-line inst)
    (string-append
      "**" (of 'jurisdiction inst) "** — "
      "mechanism: `" (symbol->string (of 'mechanism inst)) "`, "
      "beneficiaries: `"
      (apply string-append
             (map (lambda (b) (string-append (symbol->string b) " "))
                  (of 'beneficiary-classes inst)))
      "`, "
      "target: " (let ((tp (of 'target-project inst))) (if tp tp "(jurisdiction-wide)"))
      " — " (source-links (of 'source-urls inst))))

  (define (render-new entry)
    (string-append "- " (instance-line (of 'after-state entry))
                    " _(" (of 'instance-ref entry) ")_\n"))

  (define (render-changed entry)
    (define before (of 'before-state entry))
    (define after (of 'after-state entry))
    (string-append
      "- " (instance-line after) "\n"
      "  outcome: `" (symbol->string (of 'outcome before))
      "` -> `" (symbol->string (of 'outcome after)) "`"
      " _(" (of 'instance-ref entry) ")_\n"))

  (define (render-unchanged entry)
    (define after (of 'after-state entry))
    (string-append
      "- " (of 'jurisdiction after) " — `" (symbol->string (of 'mechanism after))
      "` still `" (symbol->string (of 'outcome after)) "` _("
      (of 'instance-ref entry) ")_\n"))

  (define (render-section title items renderer)
    (if (null? items)
        ""
        (string-append
          "## " title "\n\n"
          (apply string-append (map renderer items))
          "\n")))

  (define header (string-append "# Shenanigans Changelog — " report-date "\n\n"))

  (if (null? diff-entries)
      (string-append header
                      "No new shenanigans activity detected for " report-date ".\n")
      (string-append
        header
        (render-section "New Instances" (entries-of 'new-instance) render-new)
        (render-section "Outcome Changes" (entries-of 'outcome-changed) render-changed)
        (render-section "Confirmed Unchanged"
                         (entries-of 'status-confirmed-unchanged)
                         render-unchanged))))
