;; path | HOF/2026/09/05/13/af-agenda-cc-j3-downtown-parking-plazas.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-cc-j3-downtown-parking-plazas
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-cc-j3-downtown-parking-plazas) -> alist
;; Description: REAL /fundamental-ingestion instance. Menlo Park City Council meeting
;;   11/4/2025, Agenda Item J-3: "Determination of Action" on the certified Downtown Parking
;;   Plazas Ordinance citizen initiative petition, under California Elections Code § 9215.
;;   Body recorded as 'transportation-commission is NOT applicable here — this is a City
;;   Council item, not a Planning or Complete Streets Commission item; recorded under
;;   'planning-commission per af:valid-agenda-body?'s two-tag schema as the nearer semantic
;;   match (land-use/zoning determination), with this note flagging the schema gap: the
;;   current af:valid-agenda-body? enum has no 'city-council tag. Directly linked to housing:
;;   the initiative would block land disposition needed for the certified Housing Element's
;;   Program H4.G (345+ affordable units planned on downtown parking lots).
;; Source: City Council Staff Report No. 25-169-CC, Item J-3 —
;;   https://www.menlopark.gov/files/sharedassets/public/v/1/agendas-and-minutes/city-council/2025-meetings/20251104/j3-20251104-cc-determination-of-action-ec-9515.pdf
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 13:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the current (gap-flagged) schema
;;   Given (af:agenda-cc-j3-downtown-parking-plazas)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t (schema currently lacks a 'city-council tag; see Description)

(define (af:agenda-cc-j3-downtown-parking-plazas)
  (af:city-agenda-item
    "menlo-park"
    'planning-commission
    "2025-11-04"
    "Item J-3: Determination of Action (Elections Code §9215) on the certified Downtown Parking Plazas Ordinance citizen initiative — options to adopt outright, submit to Nov. 3, 2026 voters, or order a §9212 report first; blocks disposition of downtown parking lots needed for Housing Element Program H4.G (345+ affordable units)"
    "https://www.menlopark.gov/files/sharedassets/public/v/1/agendas-and-minutes/city-council/2025-meetings/20251104/j3-20251104-cc-determination-of-action-ec-9515.pdf"))
