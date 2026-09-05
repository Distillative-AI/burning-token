;; path | HOF/2026/09/05/15/af-agenda-pc-20260505-zoning-housing-element-implementation.af.scm
;; (C) Asher Bond HOF Cognition Lab 2026
;; af: agenda-pc-20260505-zoning-housing-element-implementation
;; Order: 1 (Atomic — nullary constructor wrapping af:city-agenda-item with real ingested data)
;; Signature: (af:agenda-pc-20260505-zoning-housing-element-implementation) -> alist
;; Description: REAL /fundamental-ingestion instance — the key housing-substantive fact for
;;   Redwood City so far. Redwood City Planning Commission Regular Meeting 5/5/2026, Item 6.B:
;;   Recommendation to the City Council to adopt Zoning Code amendments that IMPLEMENT General
;;   Plan Housing Element programs and development review streamlining strategies, plus other
;;   code changes for clarity. Recommendation: adopt Resolution 26-02 recommending Council
;;   adopt the proposed Zoning Code amendments. CEQA: Common Sense Exemption (CEQA Guidelines
;;   §15061(b)(3)); statutory exemption also cited.
;;   This is a code-amendment item (city-initiated zoning text change implementing Housing
;;   Element programs), distinct in kind from the project-specific development applications
;;   ingested for San Mateo/Menlo Park (e.g. HOF/2026/09/05/14's Clearview Way 222-unit item) —
;;   it is process/policy-implementing, not a parcel-specific entitlement. The underlying
;;   Zoning Code amendment TEXT was not present on the bare agenda/ViewMeeting page pulled;
;;   it is referenced as living in the "Agenda Packet" link (distinct from "Agenda") on the
;;   same ViewMeeting page, not yet opened — do not invent amendment section numbers not
;;   present in the source.
;; Source: https://meetings.redwoodcity.org/AgendaOnline/Meetings/ViewMeeting?id=2701&doctype=1
;;   (resolved from Granicus clip_id=3680; confirms Granicus and OnBase Agenda Online are
;;   linked/same underlying system for Redwood City, not two separate silos)
;; Pulled-date: 2026-09-05
;; Created: 2026-09-05 15:00:00
;;
;; @gherkin
;; Scenario: the item is well-formed under the schema
;;   Given (af:agenda-pc-20260505-zoning-housing-element-implementation)
;;   When af:valid-agenda-body? is applied to its 'body field
;;   Then the result is #t
;;
;; Scenario: the item records the Housing-Element-implementing zoning action
;;   Given (af:agenda-pc-20260505-zoning-housing-element-implementation)
;;   Then the 'agenda-item field mentions "Housing Element" and "Resolution 26-02"

(define (af:agenda-pc-20260505-zoning-housing-element-implementation)
  (af:city-agenda-item
    "redwood-city"
    'planning-commission
    "2026-05-05"
    "Item 6.B: Recommendation to the City Council to adopt Zoning Code amendments that implement General Plan Housing Element programs and development review streamlining strategies, plus other code changes for clarity; Recommendation: adopt Resolution 26-02 recommending Council adopt the proposed Zoning Code amendments; CEQA: Common Sense Exemption (CEQA Guidelines § 15061(b)(3)); statutory exemption also cited"
    "https://meetings.redwoodcity.org/AgendaOnline/Meetings/ViewMeeting?id=2701&doctype=1"))
