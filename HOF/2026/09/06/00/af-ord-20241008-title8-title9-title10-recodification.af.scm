;; path | HOF/2026/09/06/00/af-ord-20241008-title8-title9-title10-recodification.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: ord-20241008-title8-title9-title10-recodification
;; Order: 1 (Atomic — nullary constructor wrapping af:adopted-ordinance with real ingested data)
;; Signature: (af:ord-20241008-title8-title9-title10-recodification) -> alist
;; Description: REAL /fundamental-ingestion instance for unincorporated San Mateo County.
;;   An ordinance adopted by the Board of Supervisors on October 8, 2024, repealing
;;   Division VI (Planning and Subdivision Regulations), Division VII (Building
;;   Regulations), and Division VIII (Natural Resources Protection) of the San Mateo
;;   County Ordinance Code, and recodifying/renumbering those provisions as Title 8 —
;;   Zoning & Development Regulations, Title 9 — Subdivision Regulations, and Title 10 —
;;   Building Regulations, plus amending Part III of the County's Local Coastal Program
;;   Implementation Plan. Housing-relevant: the new Title 8 explicitly organizes Article 6
;;   as "Accessory Dwelling Unit Regulations (ADUs)" and Article 9 as "Special Housing
;;   Requirements & Programs" per the County's own "County Ordinance Code Update" summary
;;   page and the "New and Updated Zoning Code Chapter Reference Sheet" cross-walk PDF
;;   (/media/153324/download) confirmed at the same source. CONFIRMED from the actual
;;   ordinance PDF text: the recitals, SECTION 1 (repeal + adoption of Titles 8/9/10 as
;;   Attachments A/B/C), and SECTION 4 (effective date). NOT CONFIRMED: the ordinance
;;   number itself — the PDF pulled is the unsigned/pre-numbering ordinance exhibit and
;;   literally reads "ORDINANCE NO._______________" (blank), so ordinance-number is
;;   recorded as #f per the schema's own convention rather than inventing a number. The
;;   effective date is likewise NOT a fixed calendar date: SECTION 4 of the ordinance text
;;   states it "will take effect thirty (30) days after certification by the California
;;   Coastal Commission" — a conditional/event-triggered date, not stated anywhere in the
;;   pulled documents as an actual calendar date, so effective-date is recorded as #f
;;   rather than guessing. Adopted-date "2024-10-08" is corroborated by the County's own
;;   "County Ordinance Code Update" page prose ("An ordinance was adopted by the Board of
;;   Supervisors on October 8th, 2024...") in addition to the ordinance PDF itself, which
;;   does not print its own adoption date on the pages extracted.
;; Source: direct ordinance PDF, https://www.smcgov.org/media/153283/download?inline=
;;   (verified: HTTP 200, content-type application/pdf, 3 pages; PDF text-extracted and
;;   confirmed to contain "AN ORDINANCE REPEALING DIVISION VI ... AND RECODIFYING AND
;;   RENUMBERING THOSE PROVISIONS AS TITLE 8 ... TITLE 9 ... AND TITLE 10" verbatim, plus
;;   SECTION 4's Coastal-Commission-certification effective-date language quoted above).
;;   Cross-referenced against https://www.smcgov.org/planning/county-ordinance-code-update
;;   (HTTP 200, HTML page whose visible text states the October 8, 2024 adoption date and
;;   lists Title 8 Article 6 as "Accessory Dwelling Unit Regulations (ADU's)" and Article 9
;;   as "Special Housing Requirements & Programs"), both linked from the same page. NOTE:
;;   an earlier research pass in HOF/sources/unincorporated-county/SOURCES.md §3c had
;;   flagged a *different* Legistar PDF (View.ashx?GUID=F815FDBA...&ID=13559974&M=F) as
;;   "likely-correct-but-unconfirmed" for this same October 8, 2024 item — that PDF was
;;   opened and text-extracted this pass and is actually an unrelated Green Building/
;;   Energy Code ordinance (all-electric buildings / Chapter 10.40), NOT the Title 8/9/10
;;   recodification. That Legistar link should be treated as a confirmed MISMATCH, not a
;;   source for this record; the /media/153283/download PDF from the County's own
;;   "county-ordinance-code-update" page is the correct, directly-verified source instead.
;; Pulled-date: 2026-09-05
;; Created: 2026-09-06 00:00:00
;;
;; @gherkin
;; Scenario: the record is well-formed under the schema
;;   Given (af:ord-20241008-title8-title9-title10-recodification)
;;   Then the result is an alist with keys city, ordinance-number, title, adopted-date,
;;     effective-date, source-url
;;
;; Scenario: unknown fields are recorded as #f rather than fabricated
;;   Given (af:ord-20241008-title8-title9-title10-recodification)
;;   Then 'ordinance-number is #f and 'effective-date is #f, per the source ordinance PDF
;;     printing a blank ordinance number and a Coastal-Commission-certification-triggered
;;     (not fixed-calendar) effective date

(define (af:ord-20241008-title8-title9-title10-recodification)
  (af:adopted-ordinance
    "unincorporated-county"
    #f
    "An Ordinance Repealing Division VI (Planning and Subdivision Regulations), Division VII (Building Regulations), and Division VIII (Natural Resources Protection) of the San Mateo County Ordinance Code and Recodifying and Renumbering Those Provisions as Title 8 – Zoning & Development Regulations, Title 9 – Subdivision Regulations, and Title 10 – Building Regulations of the San Mateo County Ordinance Code, and Amending Part III of the San Mateo County Local Coastal Program Implementation Plan"
    "2024-10-08"
    #f
    "https://www.smcgov.org/media/153283/download?inline="))
