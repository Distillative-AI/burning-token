;; path | HOF/2026/09/05/21/hof-shenanigan-timeline.hof.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; hof: shenanigan-timeline
;; Order: 2 (Second Order — composes af:shenanigan-instance applications for a single
;;   jurisdiction into a chronological ordering; consumes the atomic seeded instances
;;   in this same directory, produces no new data of its own)
;; Composed from: af:shenanigan-instance (HOF/2026/09/05/21/af-shenanigan-instance.af.scm)
;;   and the seeded instance citizens in this directory
;;   (af-shenanigan-pacifica-quarry-rejection, af-shenanigan-menlo-park-ballot-measure,
;;   af-shenanigan-carla-v-san-mateo, af-shenanigan-redwood-city-603-jefferson,
;;   af-shenanigan-san-mateo-measure-ty-history, af-shenanigan-ceqa-pla-hammer)
;; Signature: (hof:shenanigan-timeline jurisdiction instances) -> (listof alist)
;;   jurisdiction : string       — jurisdiction slug to filter on (matches an instance's
;;                  'jurisdiction field exactly; "san-mateo-county" for county-wide
;;                  pattern instances is treated as its own distinct slug, not folded
;;                  into "san-mateo" the city)
;;   instances    : (listof alist) — the full pool of af:shenanigan-instance alists to
;;                  filter and sort; callers pass the seeded set (or any superset as
;;                  ingestion grows it) rather than this function hard-coding the roster
;; Description: Filters the instance pool down to one jurisdiction and orders the
;;   result chronologically by 'date (oldest first; instances with date=#f — undated
;;   standing patterns like the CEQA-as-PLA-leverage hammer — sort last, since they
;;   describe an ongoing tactic rather than a point-in-time event). Pure filter+sort;
;;   deliberately does NOT compute any capture signal itself — that is
;;   hof:shenanigan-capture-score's job, kept as a separate composition per
;;   Constitution Art. I §2's one-function-per-file discipline and to keep "what
;;   happened, in order" separate from "what does it mean."
;; Source: composes reports/san-mateo-housing-structural-moats.md seeded instances
;; Created: 2026-09-05 21:00:00
;;
;; @gherkin
;; Scenario: filter to a single jurisdiction and sort chronologically
;;   Given instances containing entries for "pacifica", "menlo-park", and "san-mateo"
;;   When hof:shenanigan-timeline is applied with jurisdiction "san-mateo"
;;   Then only the "san-mateo" entries are returned, ordered oldest-date-first, with
;;     any date=#f entries last
;;
;; Scenario: an undated standing-pattern instance sorts last
;;   Given a "san-mateo-county" instance with date #f alongside dated instances
;;   When hof:shenanigan-timeline is applied
;;   Then the undated instance appears after all dated instances

(define (hof:shenanigan-timeline jurisdiction instances)
  (define (for-jurisdiction? inst)
    (equal? (cdr (assoc 'jurisdiction inst)) jurisdiction))
  (define (date-of inst) (cdr (assoc 'date inst)))
  (define (date-key inst)
    (let ((d (date-of inst)))
      (if d d "9999-99-99"))) ;; #f (undated standing patterns) sorts after any real date
  (define (older? a b) (string<? (date-key a) (date-key b)))
  (sort (filter for-jurisdiction? instances) older?))
