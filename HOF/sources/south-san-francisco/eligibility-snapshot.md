# South San Francisco — Builder's Remedy / SB9 / SB35 / SB10 Eligibility Snapshot

Compiled 2026-09-05. Research method: WebSearch (partially, session budget exhausted mid-pass)
+ WebFetch against ssfca.gov, HCD dashboard, sfyimby.com, and hlcsmc.org. **This pass hit a
session-wide WebSearch quota limit (200/200) before exhausting the target query list** —
coverage here is thinner than the other six city snapshots in this batch and should be
re-run/extended in a follow-up pass. Nothing below should be treated as independently confirmed
unless explicitly marked so.

**Follow-up pass (same session, later):** WebSearch remained fully exhausted (200/200,
non-recoverable within this session). Two additional direct WebFetch attempts were made:
(1) re-fetching the AHFP FY2025-2027 PDF directly — still not text-extractable (encoded
fonts/images; a real PDF, 275KB, exists at the URL, but no readable fee figures came through);
(2) HCD's Housing Element APR dashboard page — confirmed it is a landing page only, not
jurisdiction-queryable via static fetch (real data lives behind the CA Open Data Portal /
interactive dashboard, not this URL); (3) a guessed ssfca.gov Housing Element URL 404'd. No new
facts were confirmed. Closing these gaps requires either a live browser session (to read the PDF
visually / query the HCD dashboard interactively) or a fresh WebSearch budget.

---

## Current Compliance Status

**UNCONFIRMED (this pass) — best-available inference: likely compliant, not independently verified.**

- Neither `reports/san-mateo-housing-structural-moats.md` nor `reports/fact-check-verification.md`
  lists South San Francisco among the "8 non-compliant SMC jurisdictions as of Sept 2024"
  (Pacifica, Half Moon Bay, Daly City, San Bruno, Belmont, Atherton, Woodside, unincorporated
  county) — its absence from that list is consistent with SSF having a certified 6th-cycle
  Housing Element, but this pass could not independently pull a dated HCD certification letter
  or the HCD APR compliance dashboard entry to confirm directly (HCD dashboard page fetched
  only returned the tool description, not jurisdiction-level data — needs a live browser/API
  session against the actual dashboard, not a static fetch).
- No news, lawsuit, or decertification story for SSF's Housing Element was found in this pass
  (checked ssfca.gov homepage, hlcsmc.org, sfyimby.com search — none surfaced anything).

## SB9 / SB35 / SB10 Status

**UNCONFIRMED (this pass).**

- No local SB9 ordinance, SB35 objective design standards, or SB10 transit-density adoption was
  found or ruled out in this pass. SSF's own SOURCES.md (planning-commission/, new-laws/) does
  not contain this information — it is a portal/access map, not a policy-content summary.
- Default assumption per state law: absent a confirmed local ordinance, SSF property owners
  retain **state-default SB9 lot-split/duplex eligibility** and the city is **SB35-eligible**
  (streamlined ministerial approval applies per state formula whether or not the city has
  adopted its own objective design standards — lack of local standards does not remove SB35
  eligibility, it removes the city's ability to substitute its own review criteria).
- SB10 requires affirmative local legislative adoption to have any effect; no evidence either
  way was found, so treat as **not adopted** by default (consistent with the county-wide pattern
  found in prior research — "no jurisdiction in the county has actually adopted SB10").

## Builder's Remedy Projects

| Project | Units | Status | Date |
|---|---|---|---|
| *(none found)* | — | — | — |

No Builder's Remedy project filed, pending, approved, or rejected in South San Francisco was
found in this pass (checked sfyimby.com Builder's Remedy search results — surfaced Menlo Park
and San Jose projects but nothing tagged South San Francisco; checked ssfca.gov and hlcsmc.org
directly — no hits). This is consistent with prior research's original finding of no SSF
Builder's Remedy activity. Absence of evidence is not strong proof of absence here given the
thin search coverage this pass — flag for a follow-up direct check of SSF's Planning Commission
Legistar agendas (see SOURCES.md pull plan) before treating "zero Builder's Remedy exposure" as
fully confirmed.

## Recent Ballot/Ordinance Changes

- **UNCONFIRMED**: no 2025-2026 ballot measure affecting housing approval was found for South
  San Francisco in this pass.
- **Zoning Ordinance and Map Update** — SSF's own SOURCES.md flags an **unverified** claim
  (WebSearch-synthesized only, never independently fetched) that this was adopted as
  **Ordinance No. 1656 on 2024-06-12**. Still unconfirmed as of this pass — the underlying
  eCode360 chapter (20.350) returns HTTP 403 to automated fetch, and Legistar's
  `Legislation.aspx` requires interactive JS search. This ordinance, if real, likely affects
  height/density Use-Permit and CUP thresholds referenced in
  `reports/san-mateo-housing-structural-moats.md` (SSF "Height above base limits requires a
  discretionary Use Permit; added multifamily floor area requires a Conditional Use Permit" —
  Ch. 20.350). If Ordinance 1656 changed those thresholds, the report's characterization could
  be stale; this needs a live-browser confirmation pass.

## In-Lieu Fee Verification ($424,840.11/unit)

**STILL UNVERIFIABLE.** Attempted direct WebFetch of the SSF Affordable Housing Financing Plan
FY2025-2027 PDF
(`https://www.ssfca.gov/files/assets/public/v/2/economic-amp-community-development/documents/south-san-francisco-ahfp-fy2025-2027.pdf`)
— the PDF was retrieved (275KB) but the fetch tool could not extract readable text from it
(binary/encoded content). The document exists at the expected URL (not a dead link), which is
itself mild corroboration that the report cited a real source, but the specific $424,840.11
figure remains unconfirmed pending either a text-extraction-capable fetch or a direct human
read of the PDF. No FY2026-2027 update/successor document was located.

## Sources

- https://www.ssfca.gov/ (homepage, fetched — no housing-compliance content on front page)
- https://sfyimby.com (Builder's Remedy search — no SSF-specific results found)
- https://www.hlcsmc.org (Housing Leadership Council of San Mateo County — no SSF-specific compliance/BR content found)
- https://www.hcd.ca.gov/planning-and-community-development/housing-open-data-tools/housing-element-implementation-and-apr-dashboard (dashboard page exists; jurisdiction-level data not retrievable via static fetch)
- https://www.ssfca.gov/files/assets/public/v/2/economic-amp-community-development/documents/south-san-francisco-ahfp-fy2025-2027.pdf (PDF exists, unreadable via text fetch)
- `/mnt/ithicc/git/hackathons/housing/HOF/sources/south-san-francisco/SOURCES.md` (existing portal map — Legistar, Granicus, eCode360 access notes; flags Ordinance 1656 as unconfirmed)

## Unconfirmed / Uncertain

- **Housing Element compliance status and certification date** — not independently confirmed this pass; inferred likely-compliant only from absence off the "8 non-compliant" list in prior research (an indirect, non-dispositive signal).
- **SB9/SB35/SB10 local adoption status** — no confirmation either way; defaulted to state-baseline assumptions per California law, not verified against SSF municipal code.
- **Zero Builder's Remedy filings** — plausible but based on thin negative-result search coverage (session hit WebSearch quota mid-pass); recommend a follow-up direct check of SSF Planning Commission Legistar agendas for any BR-flagged applications.
- **Ordinance No. 1656 (2024-06-12 Zoning Ordinance and Map Update)** — unconfirmed by any primary-document fetch (eCode360 403s, Legistar needs JS search); if real, its effect on height/density discretionary-review thresholds is unknown and could update the structural-moats report's SSF characterization.
- **$424,840.11/unit in-lieu fee figure** — PDF located but not text-extractable; figure remains unverified pending direct read.
- **This pass was materially constrained by a session-wide WebSearch quota exhaustion (200/200 calls used across the full 7-city batch) before SSF-specific queries could be run** — treat this snapshot as the thinnest of the batch and prioritize a re-run with a fresh search budget.
