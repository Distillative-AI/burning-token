;; path | HOF/2026/09/05/00/af-ord-atherton-sb79-chapter1759.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: ord-atherton-sb79-chapter1759
;; Order: 1 (Atomic — nullary constructor wrapping af:adopted-ordinance with real ingested data)
;; Signature: (af:ord-atherton-sb79-chapter1759) -> alist
;; Description: REAL /fundamental-ingestion instance for Atherton. Town of Atherton City
;;   Council ordinance adding Chapter 17.59 ("Regulations and Objective Standards for
;;   Development Projects sought Pursuant to Government Code Section 65912.157 (SB 79)")
;;   and amending Chapter 17.60 of the Atherton Municipal Code. This is Atherton's local
;;   implementing ordinance for SB 79 (the Abundant and Affordable Homes Near Transit Act,
;;   signed Oct. 10, 2025, effective July 1, 2026), setting the Town's own objective
;;   development standards (setbacks, architectural design, vehicular circulation, parking,
;;   privacy screening, landscaping) for housing projects on parcels within the state-
;;   mandated transit radius of the Menlo Park Caltrain station (seven eligible Atherton
;;   lots per athertonca.gov/745/SB-79---FAQs) — standards that may not conflict with or
;;   reduce the state-mandated height (up to 75 ft), density (up to 120 du/ac, minimum 30
;;   du/ac to qualify), or FAR (up to 3.5) minimums SB 79 imposes.
;;   Sequence confirmed via athertonca.gov/672/Multi-Family-Housing and
;;   athertonca.gov/745/SB-79---FAQs: Planning Commission recommended adoption at its
;;   regular Jan. 28, 2026 meeting; City Council held first reading/introduction Feb. 18,
;;   2026; City Council held second reading and ADOPTED the ordinance Mar. 18, 2026; the
;;   adopted ordinance was submitted to HCD for review Mar. 26, 2026; per
;;   athertonca.gov/745/SB-79---FAQs, "As of June 10, 2026, the ordinance has been found in
;;   substantial compliance with SB 79 by HCD."
;;   Ordinance-number: the PDF text itself (draft/administrative-draft stamped "March 2026")
;;   shows the ordinance-number line as a BLANK ("Draft Ordinance No. ___") — no formal
;;   ordinance number is visible in the fetched document — so ordinance-number is recorded
;;   as #f per the schema's own convention for "not yet assigned"/not confirmed, rather than
;;   guessed. effective-date is likewise not stated in the sources found and is recorded
;;   as #f.
;; Source: https://www.athertonca.gov/DocumentCenter/View/12538/Chapter-1759-SB-79-Ordinance
;;   — verified via `curl -s -o /dev/null -w "%{http_code} %{content_type}"` returning
;;   "200 application/pdf" (26-page PDF). Confirmed as the correct document by extracting
;;   PDF text (zlib-inflating the PDF's content streams and pulling parenthesized text
;;   operands) and matching it against "Atherton Municipal Code", "SB 79 Ordinance
;;   (Administrative Draft)", "AN ORDINANCE OF THE CITY COUNCIL OF THE TOWN OF ATHERTON TO
;;   ADD CHAPTER 17.59 ... AND TO AMEND CHAPTER 17.60", and the January 28 / February 18 /
;;   March 18, 2026 hearing-date recitals. Title and the March 18, 2026 adoption date and
;;   June 10, 2026 HCD-compliance finding are independently corroborated by the Town's own
;;   published FAQ page https://athertonca.gov/745/SB-79---FAQs, which links this exact
;;   DocumentCenter/View/12538 URL as "Chapter 17.59, Regulations and Objective Standards
;;   for Development Projects sought Pursuant to Government Code Section 65912.157 (SB 79)".
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 00:00:00
;;
;; @gherkin
;; Scenario: the ordinance record has provenance for its adoption date
;;   Given (af:ord-atherton-sb79-chapter1759)
;;   Then the 'adopted-date field is "2026-03-18"
;;
;; Scenario: unknown fields are recorded as #f, not guessed
;;   Given (af:ord-atherton-sb79-chapter1759)
;;   Then the 'ordinance-number field is #f
;;   And the 'effective-date field is #f

(define (af:ord-atherton-sb79-chapter1759)
  (af:adopted-ordinance
    "atherton"
    #f
    "Chapter 17.59, Regulations and Objective Standards for Development Projects sought Pursuant to Government Code Section 65912.157 (SB 79); amending Chapter 17.60 — Atherton Municipal Code (SB 79 local implementing ordinance)"
    "2026-03-18"
    #f
    "https://www.athertonca.gov/DocumentCenter/View/12538/Chapter-1759-SB-79-Ordinance"))
