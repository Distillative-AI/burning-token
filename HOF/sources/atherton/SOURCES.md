# Atherton, CA — Source Map

Researched via WebSearch/WebFetch only (no live browser). Confirmed URLs are marked;
anything I could not directly confirm is flagged explicitly rather than guessed.

---

## 1. Planning Commission — Agendas & Minutes

- **Name:** Town of Atherton Planning Commission
- **URL (current, primary):** https://www.athertonca.gov/143/Planning-Commission
  (landing page for the commission; links out to the town-wide Agendas &
  Minutes hub at https://www.athertonca.gov/641/Agendas-Minutes)
- **Platform:** **CivicPlus** (confirmed via page footer: "Government Websites
  by CivicPlus®"). This is a different platform family than Menlo Park's
  Granicus/OpenCities and Woodside's mixed CivicPlus AgendaCenter setup (see
  below) — same vendor as Woodside, different from Menlo Park.
- **Legacy domain:** `www.ci.atherton.ca.us` mirrors resolve to the same
  CivicPlus content (e.g. `https://www.ci.atherton.ca.us/641/Agendas-Minutes`
  and `https://www.ci.atherton.ca.us/199/Planning` both surfaced in search).
  Treat `athertonca.gov` as canonical and `ci.atherton.ca.us` as a legacy
  alias/redirect — not independently verified which is authoritative at the
  DNS/redirect level, but both returned live content in search results.
- **Archive depth:** **Not confirmed.** The Agendas & Minutes page references
  an "Agenda Archive" and "Minutes Archive" (parameterized as
  `Archive.aspx?AMID=<n>` per-body IDs — see Pull Plan) but no year-range
  floor was visible in the fetched content. Search results surfaced
  individual document hits (e.g. a Planning Commission special-meeting packet
  from June 23, 2022 at
  https://www.athertonca.gov/DocumentCenter/View/10444/Planning-Commission-Special-Meeting-6232022-Final-Packet
  and draft minutes from August 11, 2021 at
  https://www.athertonca.gov/DocumentCenter/View/9243/Atherton-Planning-Commission-August-11-2021-Draft-Minutes),
  so at least 2021–2022 is reachable, but a confirmed hard floor (e.g. "goes
  back to year X") was not located in this pass.
- **Access notes:** No CAPTCHA encountered. A "Create a Website Account"
  option exists for notification subscriptions but does not appear to gate
  read access to agendas/minutes (CivicPlus's standard pattern — optional
  account for subscriptions, public read for documents).
- **Est. pull effort:** **Low–Medium.** CivicPlus AgendaCenter/Archive.aspx
  structure is well-trodden; per-body Archive IDs need to be read off the live
  page rather than guessed (see Pull Plan item 2).

---

## 2. Transportation-equivalent Body

- **Confirmed: Atherton DOES have a dedicated body** — the **Transportation,
  Bicycle and Pedestrian Safety Committee** (evolved from what was historically
  called the "Transportation Committee"; older agendas/minutes from 2009–2019
  use the old name, e.g.
  https://www.athertonca.gov/ArchiveCenter/ViewFile/Item/1138 (Sept. 2009
  agenda) and https://www.athertonca.gov/ArchiveCenter/ViewFile/Item/1124
  (July 2011 agenda)).
- **URL (current):** https://www.athertonca.gov/286/Transportation-Bike-and-Ped-Safety-Commi
- **Charter/structure (confirmed via search snippet):** Seven members — two
  Council Members and five appointed members. Notably, **the Police
  Department has overall responsibility for the committee**, not Public
  Works; the Police Chief coordinates with Public Works staff as needed. This
  is a structurally different arrangement than a typical Public-Works-run
  transportation body and is worth flagging for any cross-town comparison —
  Atherton routes traffic/ped/bike safety policy through police
  administration, not planning or engineering.
- **Meets at:** 80 Fair Oaks Lane, Atherton, CA 94027 (Council Chambers) —
  per committee page.
- **Platform:** Same CivicPlus Agendas & Minutes hub; archive links appear to
  be `Archive.aspx?AMID=50` (agendas) and `Archive.aspx?AMID=51` (minutes) per
  a fetch of the committee page — **treat these AMID numbers as unconfirmed
  precision** (fetched via a summarizing tool, not visually verified against
  the raw page markup) and re-check live before relying on them.
- **Do NOT assume** there is a separate "Circulation Committee" or "Complete
  Streets Commission" in Atherton — no such body surfaced in search; the
  Transportation, Bicycle and Pedestrian Safety Committee is the sole
  transportation-adjacent body found. There is also a **Trails Committee** and
  an **Environment & Open Space Committee**, both listed as separate town
  committees but oriented toward open-space/trails rather than roadway
  transportation — do not conflate with the Transportation, Bike and Ped
  Safety Committee.
- **Est. pull effort:** **Low**, same CivicPlus structure as Planning
  Commission.

---

## 3. Recently Adopted Ordinances / Housing-Related Zoning Updates

Atherton's Housing Element saga is the most directly relevant thread for the
project's large-lot/estate-zoning structural-moats framing: Atherton is
essentially 100% single-family-estate zoned pre-cycle, so the 6th Cycle
Housing Element forced the town's **first-ever multifamily rezoning**.

- **Municipal Code host:** **`atherton.municipal.codes`** — e.g. Title 17
  Zoning at https://atherton.municipal.codes/Code/17 , the Zoning Plan
  section at https://atherton.municipal.codes/Code/17.30.020 , and the
  Ordinance List and Disposition Table at
  https://atherton.municipal.codes/Code/OT (best single entry point for a
  chronological adopted-ordinance list). **This is a different platform
  family than both Menlo Park (eCode360/General Code) and Woodside
  (Municode/library.municode.com)** — `municipal.codes` appears to be a
  separate code-hosting vendor/aggregator. I was **not able to fetch this
  page directly** — `atherton.municipal.codes/Code/OT` returned **HTTP 403**
  to WebFetch, same bot-gating pattern seen on Menlo Park's eCode360 and on
  Woodside's Municode Library (see below) — treat as public-but-bot-hostile,
  not a true login wall, pending live browser confirmation.
  - A `codepublishing.com/CA/atherton.html` URL was also referenced in one
    search snippet as a possible alternate host, but a direct fetch of
    `codepublishing.com/CA/atherton.html` returned **HTTP 403** as well and
    the search-engine characterization of it as Atherton's host is
    **unconfirmed** — do not rely on this URL without live verification;
    `municipal.codes` is the better-evidenced current host (surfaced
    directly as page titles, e.g. "Title 17 Zoning | Atherton Municipal
    Code").
- **6th Cycle Housing Element adoption timeline (well-sourced via secondary
  reporting, cross-checked across multiple Almanac articles):**
  - Housing Element originally adopted **January 21, 2023** (an earlier/first
    draft cycle).
  - Town identified **seven additional candidate multifamily sites** in fall
    2023, per almanacnews.com coverage.
  - Full Housing Element + associated Zoning Ordinance Amendment package
    adopted **October 20, 2024** — HCD found this **non-compliant** in a
    letter dated **December 30, 2024**.
  - City Council adopted **revisions** to the 2023–2031 Housing Element on
    **February 19, 2025** to address HCD's objections; also introduced an
    ordinance to amend the municipal code/zoning ordinances accordingly
    (multifamily-site rezoning, per state RHNA mandate).
  - Re-submitted to HCD; **state certification granted May 5, 2025** (per
    almanacnews.com, "Atherton housing element certified by state," 2025-05-27
    coverage, and the Town's own May 2025 announcement).
  - **Ordinance 667** was referenced in one aggregated-search summary as the
    zoning ordinance amendment implementing the certified Housing Element —
    **this ordinance number is unconfirmed against a primary Town document in
    this pass** and should be verified directly against
    https://atherton.municipal.codes/Code/OT or a Town Council agenda packet
    before citing it as authoritative.
  - Package explicitly included: **objective design/development standards
    for multifamily housing** (density, height, setbacks, parking) and an
    **Inclusionary Housing Ordinance** — both per CEQAnet project description
    (SCH# 2024050574, https://ceqanet.lci.ca.gov/Project/2024050574).
  - RHNA obligation: **348 new units by 2031** across income categories (per
    search-aggregated Town FAQ content,
    https://www.athertonca.gov/FAQ.aspx?QID=224 — a specific 6th-cycle RHNA
    figure worth a live re-check since it's cited secondhand here).
- **Primary Town documents (confirmed live links, not yet content-verified
  beyond title/filename):**
  - Housing Element Update hub: https://www.athertonca.gov/627/Housing-Element-Update
  - Draft Council Resolution (Attachment 6):
    https://athertonca.gov/DocumentCenter/View/12105/Attachment-6---Draft-Resolution?bidId=
  - Zoning Map Proposed Amendments (July 24, 2024) — before/after maps:
    https://www.athertonca.gov/DocumentCenter/View/11964
  - HCD non-compliance letter reference (per search snippet dated 2024-09-04
    Almanac coverage) — no direct HCD PDF link located in this pass, unlike
    Menlo Park's confirmed HCD technical-assistance-letter link; a live
    search of hcd.ca.gov's Atherton page is needed.
- **Secondary reporting (Almanac News, cross-checked across dates):**
  - https://www.almanacnews.com/atherton/2025/02/24/atherton-city-council-approves-changes-to-housing-element/
  - https://www.almanacnews.com/atherton/2025/01/23/atherton-closer-to-certified-housing-element/
  - https://www.almanacnews.com/atherton/2024/08/14/athertons-draft-housing-element-documents-and-environmental-analysis-show-which-sites-are-under-consideration-for-multifamily-housing/
  - https://www.almanacnews.com/atherton/2024/09/04/atherton-is-still-working-to-get-its-housing-plans-approved-in-the-wake-of-enforcement-letter-from-the-state/
  - https://www.almanacnews.com/atherton/2025/05/27/atherton-housing-element-certified-by-state/
  - Fair Housing Elements progress tracker (third-party watchdog site, useful
    cross-reference, not primary): https://cities.fairhousingelements.org/cities/atherton
- **Large-lot/estate zoning context:** Atherton's baseline zoning is
  essentially entirely single-family-residential large-lot (historically
  1-acre-minimum in parts of town) — this is the structural backdrop that
  makes even a modest multifamily RHNA allocation (348 units) a first-ever
  rezoning event rather than an incremental code update, distinct from
  Menlo Park's pre-existing multifamily zoning base. Confirm exact minimum
  lot-size figures directly against Title 17 (Zoning) at
  https://atherton.municipal.codes/Code/17 in a live session — this pass
  could not fetch the title's numeric content past the 403 gate.
- **Est. pull effort:** **Medium–High**, same bot-gating issue as Menlo
  Park's eCode360 and Woodside's Municode (see below); the Housing Element
  hub page and Almanac secondary coverage are the reliable low-friction path,
  the primary zoning-code text itself is the high-friction path.

---

## 4. Login/CAPTCHA/Pagination Notes

- **athertonca.gov / ci.atherton.ca.us (CivicPlus):** No CAPTCHA encountered.
  Optional "Create a Website Account" for notifications does not appear to
  gate document read access. Two per-body archive IDs
  (`Archive.aspx?AMID=50`/`AMID=51` for the Transportation, Bike and Ped
  Safety Committee) were surfaced via a summarizing fetch and should be
  re-verified against the raw page before being treated as exact — CivicPlus
  AMID values are assigned per body and the Planning Commission's own
  AMID values were **not confirmed** in this pass (only the committee's
  were surfaced).
- **atherton.municipal.codes:** Returned **HTTP 403** to WebFetch — bot/JS
  challenge gating consistent with the same class of blocking seen on
  eCode360 (Menlo Park) and Municode (Woodside, below). Not believed to be a
  true credentialed login wall; a live browser session should load normally
  or clear an interstitial.
- **codepublishing.com/CA/atherton.html:** Also returned HTTP 403; unclear
  if this is a legitimate alternate/legacy host or a stale/incorrect URL —
  do not rely on it without live confirmation; `municipal.codes` is the
  better-evidenced host.
- **No pagination issues** noted on any athertonca.gov landing page fetched
  in this pass (CivicPlus AgendaCenter-style pages typically list a rolling
  set of recent items with an explicit "Archive" link for older records,
  rather than true numbered pagination).

---

## Pull Plan

Ordered list of exact pages for a human+browser-extension session to visit
first:

1. https://www.athertonca.gov/641/Agendas-Minutes — start here; grab current
   Planning Commission agenda/minutes rows directly.
2. https://www.athertonca.gov/143/Planning-Commission — confirm the correct
   Archive.aspx AMID values for Planning Commission specifically (not yet
   confirmed in this pass — only the Transportation committee's were
   surfaced) by clicking through "Agenda Archive"/"Minutes Archive" links.
3. https://www.athertonca.gov/286/Transportation-Bike-and-Ped-Safety-Commi —
   Transportation, Bicycle and Pedestrian Safety Committee hub; verify
   AMID=50 (agendas) / AMID=51 (minutes) live.
4. https://www.athertonca.gov/627/Housing-Element-Update — Housing Element
   hub; the fastest path to the full adoption/certification document trail.
5. https://www.athertonca.gov/DocumentCenter/View/11964 — Zoning Map
   Proposed Amendments (July 24, 2024), before/after maps for the
   multifamily rezoning sites.
6. https://athertonca.gov/DocumentCenter/View/12105/Attachment-6---Draft-Resolution?bidId=
   — draft Council resolution attachment for the Housing Element revisions.
7. https://atherton.municipal.codes/Code/OT — Ordinance List and Disposition
   Table; the fastest confirmed path to a chronological adopted-ordinance
   list once past the bot gate. Use this to verify/refute the "Ordinance
   667" reference above.
8. https://atherton.municipal.codes/Code/17 — Title 17 Zoning; confirm
   current minimum-lot-size and multifamily-district provisions post-Housing
   Element amendment.
9. https://ceqanet.lci.ca.gov/Project/2024050574 — CEQA project record for
   the Housing Element + Zoning Ordinance Amendment + Inclusionary Housing
   Ordinance package; likely links to the EIR/negative declaration and staff
   reports not otherwise indexed.
10. HCD's Atherton housing-element page (URL not confirmed in this pass —
    search `hcd.ca.gov` live) — to locate the December 30, 2024
    non-compliance letter directly, mirroring the confirmed Menlo Park HCD
    technical-assistance-letter pattern from that town's SOURCES.md.
