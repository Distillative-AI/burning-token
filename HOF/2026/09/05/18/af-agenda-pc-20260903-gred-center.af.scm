;; path | HOF/2026/09/05/18/af-agenda-pc-20260903-gred-center.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260903-gred-center
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260903-gred-center) -> alist
;; Description: REAL /fundamental-ingestion instance from South San Francisco Planning
;;   Commission's Sep 3, 2026 Regular Meeting agenda (Item 3, Public Hearing): Genentech
;;   Research and Early Development Center (gRED Center) — a new R&D building in the
;;   Genentech Master Plan (GMP) Zoning District, under Titles 19/20 of the SSF Municipal
;;   Code. Item 3a is the Use Permit + Design Review + Tentative Map approval resolution.
;;   Item 3b is the CEQA determination: no new environmental document is prepared; the
;;   project relies on the existing 2020 Genentech Master Plan EIR plus the SSF 2040 General
;;   Plan EIR, supplemented by a 2026 CEQA Checklist/Addendum, invoking CEQA Guidelines
;;   §§15162, 15164, 15168, and 15183 — the "adequately covered by a prior EIR"
;;   exemption/streamlining class, DISTINCT from the infill-housing exemption pathways used
;;   elsewhere in this chronology (e.g. SB 35/infill CEQA streamlining for housing projects).
;;
;;   IMPORTANT — this is NOT a housing project. The gRED Center is commercial/institutional
;;   R&D (life-sciences research building), not residential development, and contributes no
;;   housing units. It is recorded here deliberately as a CONTRAST CASE: it demonstrates how
;;   the same CEQA-streamlining machinery (tiering off / relying on a prior master-plan-level
;;   EIR instead of preparing a new environmental document) is applied by South San Francisco
;;   to non-housing, commercial development — useful for comparing against how (or whether)
;;   housing projects in SSF specifically receive equivalent prior-EIR streamlining treatment,
;;   and for testing whether the structural advantage of "already covered by an EIR" is being
;;   extended more readily to commercial/biotech tenants than to housing applicants in the
;;   same jurisdiction.
;; Source: https://ci-ssf-ca.legistar.com/View.ashx?M=A&ID=1426914&GUID=9FCC5A61-B80E-425D-A00E-492451B8FDC9
;;   (Legistar portal, View.ashx serves a real PDF directly with a browser User-Agent, no
;;   login wall; pulled live 2026-09-05 via curl+pdftotext)
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 18:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260903-gred-center)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item honestly records this as a non-housing contrast case
;;   Given (af:agenda-pc-20260903-gred-center)
;;   Then the 'agenda-item field mentions "NOT a housing project" and "CEQA" and
;;     "prior EIR" and "contrast case"

(define (af:agenda-pc-20260903-gred-center)
  (af:city-agenda-item
    "south-san-francisco"
    'planning-commission
    "2026-09-03"
    "Item 3 (Public Hearing): Genentech Research and Early Development Center (gRED Center) — construct new R&D building in the Genentech Master Plan (GMP) Zoning District under Titles 19/20 of the SSF Municipal Code. 3a: Use Permit + Design Review + Tentative Map approval resolution. 3b: CEQA determination — no new environmental document; relies on the existing 2020 Genentech Master Plan EIR + SSF 2040 General Plan EIR + a 2026 CEQA Checklist/Addendum, under CEQA Guidelines §§15162, 15164, 15168, 15183 (\"adequately covered by a prior EIR\" exemption class, distinct from the infill-housing exemption used elsewhere). NOTE: this is NOT a housing project — it is commercial/institutional R&D development — and is recorded here as a contrast case for how CEQA-streamlining-via-prior-EIR is applied to non-housing development in the same jurisdiction."
    "https://ci-ssf-ca.legistar.com/View.ashx?M=A&ID=1426914&GUID=9FCC5A61-B80E-425D-A00E-492451B8FDC9"))
