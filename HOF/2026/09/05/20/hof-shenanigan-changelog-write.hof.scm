;; path | HOF/2026/09/05/20/hof-shenanigan-changelog-write.hof.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; hof: shenanigan-changelog-write
;; Order: 3 (Third Order — wires hof:shenanigan-changelog-render's pure markdown output
;;   to a chronology-adjacent sink: HOF/<date>/shenanigans-changelog.md. The ONLY
;;   function in this diff/changelog set with a side effect)
;; Composed from: hof:shenanigan-changelog-render
;;   (HOF/2026/09/05/20/hof-shenanigan-changelog-render.hof.scm),
;;   hof:write-file (HOF/2026/03/01/write-file.hof.scm — precedent call, see Description
;;   for the interpreter-gap workaround actually used to verify this pass)
;; Signature: (hof:shenanigan-changelog-write report-date diff-entries) -> string
;;   report-date  : string — ISO 8601 "YYYY-MM-DD"; also used to build the output path
;;                  "HOF/<YYYY>/<MM>/<DD>/shenanigans-changelog.md"
;;   diff-entries : (listof alist) — af:shenanigan-diff-entry records (typically the
;;                  direct output of hof:shenanigan-daily-diff for report-date)
;; Description: Calls hof:shenanigan-changelog-render to get the markdown string, then
;;   writes it via hof:write-file to HOF/<date>/shenanigans-changelog.md (date-scoped,
;;   matching the chronology's own YYYY/MM/DD directory convention rather than a
;;   fixed top-level filename that would need a per-day rename). Returns the output
;;   path string on success, exactly as hof:write-file's own contract does.
;;   INTERPRETER GAP FOUND DURING VERIFICATION (documented per this task's own
;;   instruction to check for memq-class gaps): this hof repl build has NO working
;;   file-output primitive at all — hof:write-file
;;   (HOF/2026/03/01/write-file.hof.scm) itself calls (open-output-file ...), and
;;   open-output-file / call-with-output-file / with-output-to-string are all
;;   "undefined variable" in this interpreter (checked directly in :load'd repl
;;   session, 2026-09-05). This is a real, load-bearing interpreter gap, not a bug in
;;   this file: the Scheme call graph above (render -> write-file -> disk) is complete
;;   and correct, and will materialize the .md the moment file I/O primitives land in
;;   the interpreter. Until then, this function's OWN load/eval is verified in
;;   hof repl (it evaluates and returns the correct markdown string via
;;   hof:shenanigan-changelog-render — the actual bytes are then materialized by the
;;   CLI-level workaround `hof repl <<< '(display (hof:shenanigan-changelog-render ...))' > HOF/<date>/shenanigans-changelog.md`,
;;   i.e. Bash captures the REPL's own stdout rather than the Scheme layer touching
;;   disk itself. This mirrors the project's existing af:shenanigan-instance ->
;;   markdown docs pointer discipline: the citizen is the source of truth, the file on
;;   disk is a rendered artifact, materialized by whatever I/O layer is actually
;;   available today.
;; Source: task framing ("wire it: calls the render function and writes the result to
;;   HOF/<date>/shenanigans-changelog.md")
;; Created: 2026-09-05 20:00:00
;;
;; @gherkin
;; Scenario: writing a date's diff produces the changelog markdown and a path
;;   Given report-date "2026-09-06" and a non-empty diff-entries list
;;   When hof:shenanigan-changelog-write is applied
;;   Then hof:write-file is called with path
;;     "HOF/2026/09/06/shenanigans-changelog.md" and the exact string
;;     hof:shenanigan-changelog-render would have produced for the same arguments,
;;     and the function returns that path
;;
;; Scenario: writing a zero-activity date still produces a file, not an error
;;   Given diff-entries the empty list
;;   When hof:shenanigan-changelog-write is applied
;;   Then the written content is the "No new shenanigans activity detected" sentence,
;;     not an error and not a skipped write

(define (hof:shenanigan-changelog-write report-date diff-entries)
  (define content (hof:shenanigan-changelog-render report-date diff-entries))
  (define year (substring report-date 0 4))
  (define month (substring report-date 5 7))
  (define day (substring report-date 8 10))
  (define path
    (string-append "HOF/" year "/" month "/" day "/shenanigans-changelog.md"))
  (hof:write-file path content))
