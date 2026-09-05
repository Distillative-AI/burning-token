# Citizen file template

One `(define ...)` per file. Header comment block first, then the `@gherkin` scenario(s),
then the definition. This is the exact format used throughout the burning-token chronology
— copy it precisely; the header fields are what make each record auditable later.

## Agenda item

```scheme
;; path | HOF/<YYYY>/<MM>/<DD>/<HH>/af-agenda-pc-<yyyymmdd>-<slug>.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-<yyyymmdd>-<slug>
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-<yyyymmdd>-<slug>) -> alist
;; Description: REAL ingestion instance. <City> <Body> meeting <date>, Item <N>:
;;   <what the item is, in your own words, citing the real numbers/names found>.
;;   <Note anything genuinely uncertain — do not round an uncertainty up to a fact.>
;; Source: <exact direct document URL>, verified <date> — <how: HTTP status +
;;   content-type check, plus what text you matched inside the document to confirm
;;   it's the right one>.
;; Pulled-date: <YYYY-MM-DD>
;; Created: <YYYY-MM-DD HH:00:00>
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-<yyyymmdd>-<slug>)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t

(define (af:agenda-pc-<yyyymmdd>-<slug>)
  (af:city-agenda-item
    "<city-slug>"
    'planning-commission
    "<YYYY-MM-DD>"
    "<agenda item text>"
    "<direct document URL>"))
```

## Adopted ordinance

```scheme
;; path | HOF/<YYYY>/<MM>/<DD>/<HH>/af-ord-<slug>.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: ord-<slug>
;; Order: 1 (Atomic — nullary constructor wrapping af:adopted-ordinance with real ingested data)
;; Signature: (af:ord-<slug>) -> alist
;; Description: REAL ingestion instance. Ordinance <number or "number not confirmed">
;;   adopted by <City> on <date>: <what it does>.
;; Source: <exact direct document URL>, verified <date> — <how>.
;; Pulled-date: <YYYY-MM-DD>
;; Created: <YYYY-MM-DD HH:00:00>
;;
;; @gherkin
;; Scenario: the ordinance is well-formed under the schema
;;   Given (af:ord-<slug>)
;;   Then the result is an alist with keys city, ordinance-number, title,
;;     adopted-date, effective-date, source-url

(define (af:ord-<slug>)
  (af:adopted-ordinance
    "<city-slug>"
    "<ordinance-number-or-#f>"
    "<title>"
    "<adopted-date-or-#f>"
    "<effective-date-or-#f>"
    "<direct document URL>"))
```

Use `#f` (unquoted, not the string `"#f"`) for any field that is genuinely unknown after a
real search — never invent a plausible-looking ordinance number or date.

## A real worked example (San Mateo, verified)

```scheme
;; path | HOF/2026/09/05/14/af-agenda-pc-20260728-clearview-way-222units.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260728-clearview-way-222units
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260728-clearview-way-222units) -> alist
;; Description: REAL ingestion instance — the most housing-substantive real fact pulled
;;   so far for San Mateo. San Mateo Planning Commission Regular Meeting 7/28/2026
;;   (meetingTemplateId=10723), Public Hearing Item 2: 3000/3155 Clearview Way Multi-Family
;;   Residential Development — 222 dwelling units. CEQA-exempt under Public Resources Code
;;   §21080.66 (state streamlining exemption for qualifying infill multi-family housing).
;; Source: direct Agenda Report PDF (verified by content — contains a link to
;;   https://www.cityofsanmateo.org/4907/3000-Clearview-Residential-Redevelopment), not the
;;   meeting portal page: the portal page lists three per-item "Download Agenda Report"
;;   attachments (JS-rendered, not visible to a plain fetch); this is the
;;   historyId=4c70c071-0bdd-4990-97d5-8c93439935cd one, downloaded and PDF-string-matched
;;   against "3000-Clearview" to confirm it's the right item.
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 14:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260728-clearview-way-222units)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records the CEQA exemption citation for the 222-unit development
;;   Given (af:agenda-pc-20260728-clearview-way-222units)
;;   Then the 'agenda-item field mentions "222 dwelling units" and "PRC § 21080.66"

(define (af:agenda-pc-20260728-clearview-way-222units)
  (af:city-agenda-item
    "san-mateo"
    'planning-commission
    "2026-07-28"
    "Public Hearing Item 2: 3000/3155 Clearview Way Multi-Family Residential Development — 222 dwelling units; Site Plan and Architectural Review + Site Development Planning Application + Vesting Tentative Parcel Map; CEQA-exempt under Public Resources Code § 21080.66 (state streamlining exemption, no MND/EIR required)"
    "https://sanmateo.primegov.com/api/compilemeetingattachmenthistory/historyattachment/?historyId=4c70c071-0bdd-4990-97d5-8c93439935cd"))
```
