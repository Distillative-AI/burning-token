# South San Francisco — Source Map

Research method: WebSearch + WebFetch only (no live browser session used to produce this
file). URLs below were returned directly by search/fetch results and are marked CONFIRMED
where a fetch succeeded against them; anything not independently fetched is marked
UNCONFIRMED — verify with a human-in-the-loop browser session before relying on it.

---

## 1. Planning Commission

**Name:** City of South San Francisco Planning Commission

**URL(s):**
- Department/meeting-archive page (Legistar): `https://ci-ssf-ca.legistar.com/DepartmentDetail.aspx?ID=32898&GUID=00089F17-549D-4750-BEAB-D874B7DB6D86` — CONFIRMED (fetched successfully)
- Legistar master calendar (all bodies): `https://ci-ssf-ca.legistar.com/Calendar.aspx` — CONFIRMED (linked from the city's own Legislative-Body page)
- Video/audio archive (Granicus): `https://ci-ssf-ca.granicus.com/ViewPublisher.php?view_id=4` — UNCONFIRMED (returned by search, not independently fetched)
- Recordings landing page: `https://www.ssfca.gov/Government/Video-Streaming-City-and-Council-Meetings/Planning-Commission` — UNCONFIRMED
- Agenda e-packets (WebLink document store, city-wide, not Planning-Commission-specific): `weblink.ssf.net` — UNCONFIRMED, host only (path not resolved)

**Access notes:**
- Legistar DepartmentDetail page is public, no login required to view.
- The page exposes a date-range filter going back to at least 2016 ("2026" through "2016" selectable), i.e. a 10-year nominal archive window is offered in the UI, but actual populated meeting rows may be much sparser — only 2 upcoming records were visible in the live fetch (9/3/2026, 9/17/2026); historical population depth was NOT verified per month/year.
- A "Sign In" link exists in the page header (`SignIn.aspx?ReturnUrl=...`) but is only needed for Legistar personal accounts (e.g. saved searches/notifications) — public agenda/minutes viewing does not require it.
- No CAPTCHA observed on this page in the fetch.

**Est. pull effort:** Low-medium. Legistar's calendar/list view supports date-range export (Excel/PDF/Word) per the UI chrome seen on the sibling Traffic Safety Commission page — likely same on Planning Commission. A human-in-the-loop session should first set the date filter to the target 6–12 month window, then export/list, then open each agenda PDF link individually (PDFs appeared to be direct links, not paywalled).

---

## 2. Transportation / Bicycle & Pedestrian equivalent

South San Francisco does **not** have a single "Transportation Commission" — the closest
equivalents, confirmed via the Legistar Departments/Bodies list, are:

**Name:** Traffic Safety Commission

**URL:** `https://ci-ssf-ca.legistar.com/DepartmentDetail.aspx?ID=42488&GUID=7825AC79-585F-46F9-BA5A-C696515927CF` — CONFIRMED (fetched successfully)

**Access notes:**
- Public, no login required.
- Live fetch (as of 2026-09-05) showed "No records to display" for the current date-window default — the archive requires switching the date-range selector to "All Years" or a specific past range to surface historical meetings; depth of that historical archive was NOT verified (could not confirm how far back records go without changing the filter in an interactive session).
- Export options present (Excel/PDF/Word) and multiple views (calendar/list/timeline).
- Meets at Corporation Yard Conference Room, 550 N Canal St.

**Name:** Bicycle and Pedestrian Advisory Committee (BPAC)

**URL:** `https://ci-ssf-ca.legistar.com/DepartmentDetail.aspx?ID=32889&GUID=C0C575B4-3C32-4F1D-A324-8020B248F76D` — **CONFIRMED** (2026-09-05). Resolved by fetching `https://ci-ssf-ca.legistar.com/Departments.aspx` directly and locating the BPAC entry, then independently re-fetched the resulting DepartmentDetail URL itself, which shows "City of South San Francisco - Bicycle and Pedestrian Advisory Committee" as the page title and in the body-selection dropdown — two independent fetches agree. Meets at "ANNEX Conference Room, 315 Maple Avenue" (as previously noted from the Departments list).

- Also noted: a "Joint Special Meeting of the Bicycle and Pedestrian Advisory Committee and the Traffic Safety Commission" body exists in Legistar — worth checking for combined agendas covering both topics.
- A general Bicycle and Pedestrian Master Plan document (not an agenda/minutes portal) is at `https://www.ssfca.gov/files/assets/public/v/1/city-manager/documents/active-south-city-ssf-bic.pdf` — UNCONFIRMED beyond the search snippet, useful as background/plan text, not a meeting archive.

**Est. pull effort:** Medium. Same Legistar UI pattern as Planning Commission once the correct department page is located; extra step required to resolve the BPAC DepartmentDetail URL (5 min in a live session via the Departments/Bodies index) before scripted pulls.

---

## 3. Recently adopted ordinances / housing-related municipal code updates

**Name:** SSF Municipal Code Title 20 (Zoning Ordinance), including Chapter 20.350 (Standards
and Requirements for Specific Uses and Activities)

**URL:**
- Chapter 20.350 (current codified text, hosted by eCode360/General Code): `https://ecode360.com/43452068` — UNCONFIRMED live fetch (WebFetch returned HTTP 403 Forbidden on direct fetch; content below is from search-snippet only, not a verified full-text fetch)
- Sibling chapter, Lot and Development Standards (20.300): `https://ecode360.com/43450964` — UNCONFIRMED (same 403 pattern likely)
- Zoning Ordinance Update project materials (Granicus MetaViewer, city council/public draft packets):
  - `https://ci-ssf-ca.granicus.com/MetaViewer.php?view_id=2&clip_id=309&meta_id=23192` (public draft) — UNCONFIRMED
  - `https://ci-ssf-ca.granicus.com/MetaViewer.php?view_id=4&clip_id=108&meta_id=6588` (Module 2: Residential Development) — UNCONFIRMED
  - `https://ci-ssf-ca.granicus.com/MetaViewer.php?view_id=4&clip_id=128&meta_id=8383` (Module 2A: Non-Residential) — UNCONFIRMED
  - `https://ci-ssf-ca.granicus.com/MetaViewer.php?view_id=4&clip_id=169&meta_id=11034` (Module 3) — UNCONFIRMED
  - `https://ci-ssf-ca.granicus.com/MetaViewer.php?view_id=4&clip_id=254&meta_id=19324` (Initial Study / CEQA) — UNCONFIRMED

**Adopted ordinance identified:** Search results (not an independently fetched primary
document) indicate **Ordinance No. 1656, adopted 2024-06-12**, as the city's Zoning Ordinance
and Map Update. **STILL UNCONFIRMED after a second attempt (2026-09-05)** — a re-search
surfaced one additional WebSearch-synthesized detail (that Ordinance 1656 specifically concerns
form-based/transect-district building-frontage-type standards, which is plausible but a
different framing than "the Ch. 20.350 update" broadly), but no independently fetched primary
document (ordinance text, City Clerk adopted-ordinances list, or council-minutes PDF) was
reached that states the ordinance number in its own words:
- `https://ci-ssf-ca.legistar.com/Legislation.aspx` was fetched directly this pass and
  **confirmed to require interactive/JS search** — it loads with 0 records and an empty
  results grid ("Please enter your search criteria"); a plain WebFetch cannot submit the
  search form, so this route needs a live/browser session, not a bot-fetch.
- `https://ci-ssf-ca.granicus.com/MetaViewer.php?view_id=2&clip_id=309&meta_id=23192` (the
  City Council/public-draft PDF) was fetched directly this pass — it is a large (6.9MB)
  PDF/image-based scan; the fetch tool could not extract readable text from it, so it neither
  confirms nor refutes the ordinance number.
- `https://ecode360.com/43452068` (Chapter 20.350 codified text, which would carry a
  History/amendment footnote citing the enacting ordinance) still returns **HTTP 403** to
  automated fetch, including via a Google-cache fallback attempt (which itself returned a
  Google error page, not cached content) — still unresolved.

**Net: Ordinance No. 1656 / 2024-06-12 remains an unverified WebSearch synthesis.** Do not
cite it as confirmed. The next viable path is a live human-in-the-loop browser session against
either Legistar's `Legislation.aspx` search form or eCode360's Chapter 20.350 History footnote,
or a council-meeting-minutes PDF from the June 2024 timeframe (not yet located).

**Access notes:**
- eCode360 (General Code) pages return 403 to the automated WebFetch tool used here — likely
  a bot-block (User-Agent/rate-limit gate) rather than a login wall; a real browser session
  should load them fine, but plan for possible rate limiting on rapid sequential chapter pulls.
- Granicus MetaViewer links are PDF viewers embedded in the city's Granicus meeting-video
  system — no login observed in search snippets, but not independently fetched to confirm.
- No CAPTCHA evidence either way for eCode360 or Granicus from this research; the 403 could
  also indicate an actual bot-block that a live browser with normal headers would clear.

**Est. pull effort:** Medium-high. Chapter 20.350 full text needs a live-browser fetch (WebFetch
403'd); the ordinance adoption record needs Legistar `Legislation.aspx` search rather than
trusting the search-engine synthesis. The multi-module "Zoning Ordinance Update" packets are
large PDFs (multiple modules) — expect several distinct documents to assemble the full
height/density/Use-Permit history, not one canonical page.

---

## 4. Login walls, CAPTCHA, pagination quirks (human-in-the-loop browser notes)

- **Legistar** (`ci-ssf-ca.legistar.com`) — no login required for public agenda/minutes
  viewing; "Sign In" is only for personal Legistar accounts. Calendar defaults to a narrow
  date window (e.g. current month) and must be manually switched to "All Years" or a custom
  range to surface historical meetings — this was directly observed (Traffic Safety Commission
  showed "No records to display" until the date filter would need changing). No CAPTCHA
  observed on any Legistar page reached in this research.
- **eCode360 / General Code** (`ecode360.com`) — returned HTTP 403 to the automated fetch tool
  used here. Unconfirmed whether this is a genuine bot-block, a login wall, or a transient
  rate limit; treat as requiring a real browser session with normal headers/cookies. No direct
  evidence of CAPTCHA, but the 403 should be re-tested with a live browser before assuming it's
  simply open.
- **Granicus** (`ci-ssf-ca.granicus.com`) — video/audio archive and MetaViewer PDF links;
  not independently fetched in this research, so login/CAPTCHA status is UNCONFIRMED. No
  indication of a login wall from search snippets.
- **ssf.net → ssfca.gov** — the city migrated domains; `ssf.net` URLs 301-redirect to
  `ssfca.gov`. Any hardcoded `ssf.net` links in older documents/bookmarks should be re-resolved
  through the redirect, not assumed dead.
- **weblink.ssf.net** (WebLink document store for agenda e-packets) — host identified but no
  path/structure was resolved in this research; likely needs its own folder-browse discovery
  pass in a live session.
- No pagination-depth numbers (e.g. "N pages of history") were confirmed for any portal in this
  research — all date-range/archive-depth claims above are either directly observed UI
  selector ranges (Legistar's year dropdown to 2016) or explicitly flagged UNCONFIRMED.

---

## Pull Plan (ordered, for 6–12 months of agendas + adopted-ordinance list)

1. `https://ci-ssf-ca.legistar.com/DepartmentDetail.aspx?ID=32898&GUID=00089F17-549D-4750-BEAB-D874B7DB6D86` — Planning Commission: set date range to last 12 months, list/export agendas + minutes.
2. `https://ci-ssf-ca.legistar.com/DepartmentDetail.aspx?ID=42488&GUID=7825AC79-585F-46F9-BA5A-C696515927CF` — Traffic Safety Commission: switch date filter off default (try "All Years" or last 12 months explicitly) to surface historical records, then pull agendas/minutes.
3. `https://ci-ssf-ca.legistar.com/DepartmentDetail.aspx?ID=32889&GUID=C0C575B4-3C32-4F1D-A324-8020B248F76D` — BPAC (Bicycle and Pedestrian Advisory Committee): CONFIRMED this pass (2026-09-05, two independent fetches); pull agendas/minutes same as other Legistar department pages.
4. `https://ci-ssf-ca.legistar.com/Legislation.aspx` — **confirmed this pass to require interactive/JS form submission** (plain fetch returns 0 records); needs a live browser session to search "zoning ordinance" / "Ordinance 1656" / "20.350" and get the authoritative adopted-ordinance record (date, number, linked PDF), still superseding the unconfirmed search-snippet claim above — NOT YET RESOLVED after two attempts.
5. `https://ecode360.com/43452068` (Chapter 20.350) and `https://ecode360.com/43450964` (Chapter 20.300) — pull current codified text in a real browser session (WebFetch 403'd again this pass, including via Google-cache fallback); capture the chapter's History/amendment footnote for exact ordinance cross-references.
6. Granicus MetaViewer packets for the Zoning Ordinance Update modules (Module 2, 2A, 3, public draft, initial study — URLs listed in Section 3) — the public-draft PDF (`clip_id=309`) was fetched this pass but is a large scanned/image PDF the text-fetch tool could not read; pull as supporting legislative-history documents once the adopted ordinance number is confirmed in step 4, using an OCR-capable or live-browser view.
7. `https://www.ssfca.gov/Services/Legislative-Body-Meeting-Notices-Materials` — cross-check for any additional boards/commissions or e-packet (`weblink.ssf.net`) links not surfaced via Legistar directly.
8. NEW candidate path (not yet tried): search for a June 2024 South San Francisco City Council **meeting minutes PDF** (not the ordinance text itself) referencing second-reading/adoption of the Zoning Ordinance and Map Update — minutes PDFs are often plain-text and may avoid both the eCode360 403 and the Legistar JS-search wall.
