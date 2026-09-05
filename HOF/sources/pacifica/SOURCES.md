# Pacifica, CA — Source Map (Planning / Transportation / Housing Ordinances)

Research method: WebSearch + WebFetch only (no live browser). `www.cityofpacifica.org` pages
return **HTTP 403 Forbidden** to the WebFetch tool (likely bot-blocking) — content for those pages
below is reconstructed from WebSearch result snippets, NOT a direct fetch, and is flagged
accordingly. The `pacificacityca.iqm2.com` (Granicus IQM2) portal and `planpacifica.org` DID
fetch successfully.

---

## 1. Planning Commission — Agendas & Minutes

**Name:** City of Pacifica Planning Commission — Meeting Portal (Granicus IQM2)

**URL:** https://pacificacityca.iqm2.com/Citizens/Default.aspx
(calendar view: https://pacificacityca.iqm2.com/Citizens/Calendar.aspx)

Secondary/pointer page (city site, unconfirmed by direct fetch — 403):
https://www.cityofpacifica.org/government/commissions-committees/planning-commission

**Access notes:**
- Portal is Granicus IQM2 (`pacificacityca.iqm2.com`), publicly viewable. A "Log in / Register"
  link exists in the header, but agendas, packets, and minutes were retrievable in the fetched
  view **without authentication** — login appears optional (e.g., for personalized alerts), not
  a wall over content.
- No CAPTCHA observed on the calendar or default landing page.
- Calendar.aspx offers **year-based filtering, 2012–2026**, plus an "All" option spanning
  1900–9999 — i.e., the portal claims coverage back to at least 2012 for Planning Commission
  meetings (unverified whether every year in that range has actual populated records — only
  confirmed that the year-filter UI goes back that far).
- Individual meeting rows expose Agenda / Agenda Packet / Minutes / Minutes Packet / Video links.
- Pagination on the default page uses a "See more..." expander plus a separate "Full Calendar"
  link rather than numbered pages.
- A file-open utility path (`Citizens/FileOpen.aspx?...`) exists for direct document downloads;
  hitting it with no `Type`/`ID` params redirects to a login-branded error page ("The File Type
  is not supported for download") — this is a parameter-validation error page, not proof of an
  auth wall on real document links.
- Email subscription alternative: send an email to **permittech@pacifica.gov** to receive
  Planning Commission agendas when posted (per city site snippet — unconfirmed by direct fetch).

**Est. pull effort:** LOW-MEDIUM. Public, unauthenticated, structured Granicus portal. Can likely
script/paginate via IQM2's calendar+detail-page pattern; 6–12 months of agendas/minutes is a
handful of meeting-detail page fetches (Planning Commission meets ~2x/month).

**Update (2026-09-05, WebFetch confirmation pass):** `Calendar.aspx` does support filtering by
board via a **"Group" dropdown** with the options `All Meeting Groups`, `City Council`,
`Parks, Beaches & Recreation Commission`, `Planning Commission` — confirming the three-board
roster from §2 directly on the calendar UI (not just the separate board-list page). The exact
query-string parameter name for the Group filter was still not resolved by this fetch (the
rendered page didn't expose it in the text-extracted view) — still needs a live-browser
DOM/network inspection to capture the literal `?...Group=...` param for direct-link scripting.
Confirmed fetchable 2026 Planning Commission meeting rows (dates/times only, no doc links
resolved in this pass): Jan 20, Feb 17, Apr 20, May 4, Jun 1, Jul 20, Aug 3, Aug 25 (6:00 PM Joint
Study Session + 7:00 PM Special Meeting), Sep 21, Oct 5, Oct 19, Nov 2, Nov 16, Dec 7, Dec 21 —
several marked cancelled. **Direct link for the Pull Plan:**
`https://pacificacityca.iqm2.com/Citizens/Calendar.aspx?From=1/1/2026&To=12/31/2026` (with the
Group dropdown set to Planning Commission) rather than the bare default landing page.

---

## 2. Transportation Commission (or equivalent) — Agendas & Minutes

**Finding: Pacifica does NOT appear to have a standing "Transportation Commission."**

This is a confirmed-negative, not an unconfirmed guess of a wrong URL. Evidence:
- The IQM2 portal's board list (fetched directly) shows only three groups: **City Council**,
  **Planning Commission**, and **Parks, Beaches & Recreation Commission**. No Transportation
  Commission entry.
- WebSearch for `site:cityofpacifica.org Transportation Commission` returned no matching city
  pages (only unrelated statewide/regional "Transportation Commission" hits — MTC, CTC, etc.).
- Closest functional equivalent found: the **Parks, Beaches, and Recreation (PB&R) Commission**
  reportedly also serves as Pacifica's **Bicycle and Pedestrian Advisory Committee (BPAC)**
  function (per WebSearch snippet, city page — unconfirmed by direct fetch due to 403). Regular
  PB&R meetings are the 4th Wednesday monthly, 7:00 PM, Council Chambers, 2212 Beach Blvd.
- Regional transportation planning for Pacifica routes through **City/County Association of
  Governments of San Mateo County (C/CAG)** and its own Bicycle & Pedestrian Advisory Committee
  (a COUNTY body, not a Pacifica city commission): https://ccag.ca.gov/committees/bicycle-and-pedestrian-advisory-committee/
  (URL found via WebSearch snippet — not directly fetched/verified in this session).
- City-level transportation/engineering project pages exist under Public Works, e.g.
  `https://www.cityofpacifica.org/departments/public-works/engineering/bicycle-pedestrian-master-plan`
  and `.../esplanade-palmetto-bicyle-pedestrian-improvement-project` (URLs from WebSearch
  snippets only — not directly fetched, 403 on the domain; treat as unconfirmed pending a
  successful fetch or human-in-the-loop browser check).

**Access notes:** If a live browser session is used, verify by (a) opening the PB&R Commission
page at https://www.cityofpacifica.org/government/commissions-committees/parks-beaches-and-recreation-commission
and confirming/denying the BPAC dual-role claim, and (b) checking the full commissions/committees
index at https://www.cityofpacifica.org/government/commissions-committees for any additional
body not surfaced by search (e.g., an Infrastructure or Capital Improvement committee that
handles transportation-adjacent items).

**Est. pull effort:** LOW once scope is corrected — pull PB&R Commission agendas/minutes from the
same IQM2 portal (same access pattern as Planning Commission above) rather than hunting for a
nonexistent Transportation Commission.

---

## 3. Recently Adopted Ordinances / Housing-Related Updates (incl. Quarry Builder's Remedy)

### 3a. Housing Element 2023–2031 (certified) — the compliance response that closed the
builder's-remedy exposure window

- **Adopted (City Council):** March 24, 2025
- **HCD certification effective:** September 19, 2025 ("substantially compliant")
- **Related rezoning ordinance (General Plan + Zoning Code text/map amendments to meet RHNA
  capacity, 1,892 units):** City Council public hearing and adoption **August 11, 2025**
- **Pointer/index page (fetched successfully):** https://www.planpacifica.org/housing-element
- **Document repository (fetched successfully):** https://www.planpacifica.org/project-docs
  — confirmed to list (by title, not yet confirmed with direct file URLs in this pass):
  - "Housing Element Certification Letter" (HCD, Sept 19, 2025)
  - "Housing Element with Rezoning Submittal to HCD" (Aug 30, 2025)
  - "Pacifica Housing Element 2023-2031 Adopted" (Mar 24, 2025)
  - HCD email threads on rezoning review (Jun–Jul 2025)
  - Draft EIR / NOA / NOP for the "Targeted General Plan Amendments & Rezoning Program"
  - **Note:** the project-docs page, as fetched, does NOT itself contain any document titled
    with "quarry" or "builder's remedy" — those terms did not appear in the listing pulled.
    Direct per-document URLs on planpacifica.org were not individually resolved in this pass
    (the fetch summarized titles/dates, not file hrefs) — a follow-up fetch or live browser
    click-through is needed to get the exact PDF/HTML URLs for each listed document.
- City-site pointer (unconfirmed by direct fetch, 403): https://www.cityofpacifica.org/departments/community-development/planning-division/pacifica-connects-let-s-talk-housing

### 3b. Quarry site / "Coastal Crest Residences" builder's-remedy project (1,021–1,225 units)

- **Official city project page (title/URL confirmed present via WebSearch listing; STILL NOT
  directly fetched — 403 to WebFetch, and 2026-09-05 retry via Google-cache URL, Bing-search
  HTML, and generic `cache.google.com` all failed to surface page content or a working
  alternate-host mirror — no cache/archive copy could be located this pass):**
  https://www.cityofpacifica.org/departments/community-development/planning-division/quarry-site-sb-330-preliminary-application
  — titled "Quarry Site Housing Development Application: Coastal Crest Residences." Confirmed
  (2026-09-05) that this exact URL is indexed and live per WebSearch's own result title/snippet,
  and the snippet corroborates project specifics below — but the underlying page HTML/PDF
  content remains **unverified by direct fetch of any kind**; a live-browser session is still
  required. Do not treat the snippet-derived detail below as primary-source-confirmed.
- **Preliminary application submitted:** May 7, 2025 (developer: Eenhoorn / Zeist, ~86-acre
  Rockaway Quarry site, between Hwy 1 and the Pacific Ocean).
- Because the City's Housing Element was NOT yet HCD-certified when this preliminary application
  was filed, the project qualifies for Builder's Remedy review under the Housing Accountability
  Act — this is the direct causal link between item 3a's certification timeline and this project.
- Unit count reported inconsistently across secondary sources: 1,021 units (SF Chronicle/other
  early coverage, all-affordable framing: 80% moderate-income / 20% low-income) vs. 1,225 units
  (later SF Chronicle coverage). **2026-09-05 update:** a WebSearch snippet citing the same city
  project-page title adds a **File No. 2025-036**, ~86.39-acre site (three vacant parcels), 21
  buildings, ~1,000,000 sq ft total floor area (988,000 sq ft housing + 25,000 sq ft retail) — but
  this is still WebSearch-snippet-derived (secondary aggregation), NOT a direct fetch of the city
  page or a staff report PDF; treat the File No. as a strong lead to verify live, not as confirmed.
  Also found (secondary, not yet cross-checked against a primary doc): coastsidenews.com reports
  the Quarry proposal was sent back to the applicant for revision at least once ("Pacifica sends
  Quarry housing proposal back for revision again") — suggests the project is iterating through
  resubmittals, useful context for interpreting which unit-count figure is most current.
- Secondary press coverage (not primary sources, but useful for narrative/dates):
  - https://www.sfchronicle.com/bayarea/article/pacifica-affordable-housing-project-quarry-20267188.php
  - https://www.sfchronicle.com/bayarea/article/pacifica-housing-project-city-22413580.php
  - https://therealdeal.com/san-francisco/2025/04/09/developers-invoke-builders-remedy-for-1k-homes-in-pacifica/
  - https://sfyimby.com/2025/04/preliminary-plans-for-pacifica-quarry-residential-redevelopment-san-mateo-county.html
  - https://www.coastsidenews.com/news/developer-files-plans-for-housing-at-pacifica-quarry/article_64038a47-9a8b-412d-9202-69a2395c0f66.html
  - https://www.coastsidenews.com/review/news/pacifica-sends-quarry-housing-proposal-back-for-revision-again/article_2fabecab-2dda-45b1-8d6b-3db6fe7c72c0.html
    (found 2026-09-05 — reports a resubmittal/revision cycle; not yet fetched directly)

### 3c. General ordinance archive pages (URLs found via WebSearch; NOT directly fetched — 403 on domain)

- https://www.cityofpacifica.org/departments/ordinances-and-resolutions
- https://www.cityofpacifica.org/government/city-council/city-council-ordinances
- https://www.cityofpacifica.org/government/city-council/city-council-resolutions
- https://www.cityofpacifica.org/departments/community-development/planning-commission-resolutions
- Zoning code (current, consolidated — Municode; **also returned 403 to WebFetch** in this
  session, so its own access behavior — login wall vs. bot-block — is unconfirmed):
  https://library.municode.com/ca/pacifica/codes/code_of_ordinances?nodeId=TIT9PLZO_CH4ZO
- A short-term-rental ordinance was reportedly adopted ~July 2025 and later had its coastal
  provisions rejected in part by California Coastal Commission staff (per WebSearch snippet,
  secondary source https://www.bookwithhaven.com/blog/california-coastal-commission-short-term-rental-rules)
  — not housing-production-related but flagged since it surfaced in the same ordinance search;
  not independently verified against a primary city ordinance document.

**Access notes for all of §3:** every `cityofpacifica.org` URL in this section returned HTTP 403
to WebFetch — this looks like bot/User-Agent blocking on the main CMS (Granicus CivicPlus-style
site), not necessarily a login wall or CAPTCHA for a human browser. **Requires human-in-the-loop
browser confirmation** to determine whether normal browser access is unrestricted (most likely,
given IQM2 and planpacifica.org — both Granicus-family — were fetchable) or whether there is an
actual gate.

**Est. pull effort:** MEDIUM. The narrative/date scaffold is solid from secondary sources and the
two successfully-fetched Granicus/Plan Pacifica pages, but exact primary-document URLs (the
certification letter PDF, the rezoning ordinance number/text, the quarry project's staff-report
PDFs) need one human-in-the-loop browser pass over `cityofpacifica.org` and `planpacifica.org/project-docs`
click-throughs.

---

## 4. Login Walls / CAPTCHA / Pagination — Summary for Human-in-the-Loop Session

| Site | Login wall? | CAPTCHA? | Pagination quirks |
|---|---|---|---|
| `pacificacityca.iqm2.com` (Granicus IQM2, Planning Commission + Council + PB&R) | No — public content fetched without auth. Login/Register links present but appear optional (personalization/alerts only). | None observed. | Default view shows a rolling recent-months list with "See more..."; use `Calendar.aspx` with year filter (2012–2026, or "All") for full-year listings instead of relying on default pagination. |
| `www.cityofpacifica.org` (main CMS site) | **Unknown — returned 403 to automated WebFetch on every URL tried**, which is more consistent with bot-blocking (WAF/Cloudflare-style) than a real login wall. A human browser session should be tried first before assuming credentials are needed. | Unknown — could not observe; possible if 403 is served after a JS challenge. | Unknown; not reachable this session. |
| `www.planpacifica.org` (Housing Element microsite, Granicus-family) | No — fetched freely. | None observed. | `project-docs` page lists documents by section/date; appears to be a single long index page rather than paginated — confirm during live session whether there's a "load more." |
| `library.municode.com` (zoning code) | **Returned 403 to WebFetch** — Municode sites sometimes bot-block scrapers even though they're normally publicly browsable; verify with a live browser before assuming any real auth requirement. | Unknown. | Municode uses a left-nav tree (Title/Chapter/Article) rather than pagination — standard for their platform. |

**Bottom line:** No confirmed CAPTCHA or genuine login wall anywhere in this research pass. The
403s on `cityofpacifica.org` and `library.municode.com` are very likely automated-fetch blocking
(User-Agent/WAF), not authentication — this should resolve immediately in a real browser
human-in-the-loop session; if it does NOT resolve, that itself is a notable finding to log.

---

## Pull Plan (ordered — human-in-the-loop browser session)

1. **`https://pacificacityca.iqm2.com/Citizens/Calendar.aspx`** — set year filter to cover the
   last 6–12 months (2026, and tail of 2025 if needed); filter/select **Planning Commission**.
   Open each meeting row, pull Agenda + Minutes (+ Packet if available) links.
2. Same portal, same calendar — repeat step 1 filtered to **Parks, Beaches & Recreation
   Commission** (the de facto Transportation/BPAC equivalent) for the same 6–12 month window.
3. **`https://www.cityofpacifica.org/government/commissions-committees`** — load in a live
   browser to get the authoritative, complete commission/committee index (confirm no separate
   Transportation Commission was missed, confirm/deny PB&R's BPAC dual-role).
4. **`https://www.cityofpacifica.org/departments/community-development/planning-division/quarry-site-sb-330-preliminary-application`** —
   primary city page for the Coastal Crest Residences / Quarry builder's-remedy project; pull all
   linked staff reports, applicant submittals, and any city response letters. **Still 403/blocked
   to every non-browser fetch attempted as of 2026-09-05** (direct WebFetch, Google-cache URL,
   Bing search HTML, `cache.google.com` — none produced a mirror or cached body). Confirm File
   No. 2025-036 (from a WebSearch snippet only) once live; also check
   coastsidenews.com's "sends Quarry housing proposal back for revision again" report against
   the primary page for the current/latest submittal status and unit count.
5. **`https://www.planpacifica.org/project-docs`** — click through each Housing-Element-Update
   document (certification letter, rezoning submittal, adopted Housing Element, EIR/NOA/NOP) and
   record the resolved direct-file URLs (PDF hrefs), since the text-only fetch in this pass could
   not resolve them.
6. **`https://www.cityofpacifica.org/departments/ordinances-and-resolutions`** and
   **`https://www.cityofpacifica.org/government/city-council/city-council-ordinances`** — pull
   the adopted-ordinance list for the last 6–12 months; specifically capture the August 11, 2025
   rezoning-program ordinance (General Plan/Zoning Code text + map amendments) by ordinance
   number and exact URL.
7. **`https://library.municode.com/ca/pacifica/codes/code_of_ordinances?nodeId=TIT9PLZO_CH4ZO`** —
   confirm current in-force zoning chapter text and cross-check its "last amended" date against
   the August 11, 2025 ordinance from step 6.
8. If a Transportation-adjacent body is confirmed to exist outside PB&R (e.g. a
   county-facing liaison committee), pull its agendas from whatever portal it uses — likely
   C/CAG (`ccag.ca.gov`) rather than a Pacifica-hosted IQM2 board, per §2 above.

**Explicit non-fabrication note:** every URL above is either (a) directly fetched and verified
working in this session, or (b) sourced from a WebSearch result snippet and marked "unconfirmed
by direct fetch — 403" / "needs live-browser confirmation." No URL was invented or guessed by
pattern-matching city-site conventions.
