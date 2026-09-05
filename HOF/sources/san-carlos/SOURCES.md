# San Carlos, CA — Source Map

Researched via WebSearch/WebFetch only (no live browser). Confirmed URLs are marked;
anything I could not directly confirm is flagged explicitly rather than guessed.

---

## 1. Planning Commission — Agendas & Minutes

- **Name:** The city does **not** currently have a standalone "Planning
  Commission." As of June 2025 (confirmed via the city's own social post and
  its current commission page), the body is the **"Planning and
  Transportation Commission"** — a merged planning + traffic/circulation
  body. Meets 1st and 3rd Mondays, 7pm, City Hall Council Chambers, 600 Elm
  St. (confirmed via WebFetch).
- **Main landing page (confirmed via WebFetch):**
  https://www.cityofsancarlos.org/city_hall/boards_and_commissions/planning_and_transportation_commission.php
- **Current agenda portal:** `cityofsancarlos.org/agenda` — this URL is
  referenced by the city's own social posts and by the legacy IQM2 portal's
  own redirect notice (see below), but the page renders as mostly nav-only
  on WebFetch (appears **JS-driven**), so the underlying platform for the
  *current* system could **not** be confirmed by name in this pass. It is
  plausibly a newer Granicus-family front end (e.g. Legistar/PrimeGov-style),
  but that is inference, not confirmed.
- **Legacy archive platform (confirmed via WebFetch):** **IQM2** (a Granicus
  product) at https://sancarlosca.iqm2.com/Citizens/Default.aspx — the
  portal's own text states it "contains public meeting materials from
  meetings prior to September 9, 2022," and that current/upcoming meetings
  moved to `cityofsancarlos.org/agenda`. So: **platform = IQM2/Granicus for
  the pre-9/9/2022 archive**; the post-9/9/2022 current-system platform is
  **unconfirmed**.
- **Archive depth:** Could not get a hard oldest-date confirmation from IQM2
  via search (queries for 2010/2012/2015 San Carlos agendas returned no
  hits). Directly found (via search, not opened — file too large for
  WebFetch) a real historical PDF on the city's separate Revize CMS document
  center:
  `https://cms3.revize.com/revize/sancarlos/Document%20Center/.../2022-03-21%20Planning%20Commission%20-%20Full%20Agenda-3320.pdf`
  — confirms document-level archives exist back to at least **March 2022**.
  A second Revize-hosted City Council agenda dated **February 14, 2022** was
  also found. **No evidence found of agendas older than ~2022** — treat
  depth beyond that as unconfirmed, not as a hard floor.
- **Access notes:** No login wall or CAPTCHA on any of these pages. The
  `cityofsancarlos.org/agenda` and commission landing pages appear
  JS-rendered (client-side portal links), so WebFetch's static conversion
  misses embedded content — a live browser session is needed to see the
  current agenda platform clearly. The legacy IQM2 page, by contrast, is
  fully server-rendered ASP.NET and fetched cleanly.
- **Est. pull effort:** **Medium.** Legacy IQM2 archive (pre-Sept 2022) is a
  clean, confirmed, non-JS target. Current system (post-Sept 2022) requires
  a live browser to identify and pull, since WebFetch cannot render it.

---

## 2. Transportation-Equivalent Commission

- **Confirmed:** San Carlos does **not** have a standalone "Transportation
  Commission" today. Traffic/circulation/bike/pedestrian functions are
  folded into the same **Planning and Transportation Commission** described
  in Section 1 — per the city's own description of its scope: "matters
  having to do with traffic and circulation — including pedestrian and
  bicycling matters, and preliminary plans for capital improvement programs
  related to modes of transportation" (from a search snippet of the
  commission's page).
- **Discrepancy flagged:** The legacy IQM2 portal (confirmed via WebFetch)
  lists a separate historical entry called **"Transportation and
  Circulation Commission"** alongside "Planning Commission" as distinct
  line items — suggesting these were separate bodies before merging into
  today's "Planning and Transportation Commission." **The exact merger date
  is unconfirmed** — inferred only from the IQM2 listing juxtaposition, not
  from a dated council action.
- **Parks, Recreation and Culture Commission** (confirmed via WebFetch of
  https://www.cityofsancarlos.org/city_hall/boards_and_commissions/parks_recreation_and_culture_commission.php)
  has **no transportation function** — scope is limited to parks/recreation
  programs and facilities; meets quarterly. Ruled out as a transportation
  equivalent.
- **No separate Bicycle/Pedestrian Advisory Committee was found** for San
  Carlos specifically (distinct from the county-level C/CAG BPAC, which
  covers multiple San Mateo County cities but is not a San Carlos body).
- **Bottom line:** For transportation-equivalent agendas/minutes, use the
  same Planning and Transportation Commission portal as Section 1 (both
  current `cityofsancarlos.org/agenda` and legacy IQM2 archive); there is no
  separate transportation-only portal today.

---

## 3. Recently Adopted Ordinances / Housing Element Compliance

- **Municipal code host (confirmed via redirect trace):** **Code Publishing
  Co.** (codepublishing.com), not eCode360 and not Municode. Base:
  https://www.codepublishing.com/CA/SanCarlos/ — direct WebFetch returned
  403, but the host was confirmed live via a working 301 redirect traced
  from `https://cityofsancarlos.org/municode/` → `https://www.codepublishing.com/CA/SanCarlos/`
  (redirect header captured via WebFetch).
- **Zoning title:** Title 18 is the Zoning Ordinance (confirmed via search
  snippet URLs, not independently WebFetched):
  - https://www.codepublishing.com/CA/SanCarlos/html/SanCarlos18/SanCarlos1801.html
    (Ch. 18.01 Introductory Provisions)
  - https://www.codepublishing.com/CA/SanCarlos/html/SanCarlos18/SanCarlos1835.html
    (Ch. 18.35 Amendments to Zoning Ordinance and Map)
  - https://www.codepublishing.com/CA/SanCarlos/html/SanCarlos18/SanCarlos1810.html
    (Ch. 18.10 Planned Development District)
  - A search snippet states the code is "current through Ordinance 1635,
    passed April 13, 2026" — **this specific ordinance number/date is from a
    search snippet only, not independently confirmed by WebFetch**
    (codepublishing.com blocked WebFetch with 403 on every direct attempt).
  - Chapter 2.24 (Commissions), also on this host: search snippet only —
    https://www.codepublishing.com/CA/SanCarlos/html/SanCarlos02/SanCarlos0224.html
- **Housing Element 2023–2031 (6th RHNA cycle):**
  - Reportedly adopted **January 23, 2023**, with accompanying zoning
    ordinance amendments (removing minimum private open space, guest
    parking, and side/rear stepback requirements in mixed-use/multi-family
    zones) to meet RHNA obligations — search-snippet sourced, moderately
    confident given corroborating HCD `.gov` documents, but not directly
    WebFetch-confirmed as a single primary resolution document.
  - HCD state-hosted review documents (high confidence — `.ca.gov` domain,
    consistent naming pattern with other cities in this project):
    - https://www.hcd.ca.gov/sites/default/files/docs/planning-and-community/housing-element/smaSanCarlosDraftOut010623.pdf
      (HCD's Jan 6, 2023 review letter on the draft)
    - https://www.hcd.ca.gov/housing-elements/docs/san-carlos-6th-draft101422.pdf
      (Oct 14, 2022 draft)
  - City-hosted Housing Element materials:
    - Final adopted-version PDF, **content directly read via WebFetch**:
      https://www.sancarlos2040.org/files/managed/Document/162/HE%20HCDV4%20_041124.pdf
      (labeled with an April 18, 2024 publish date in the fetched content)
    - Appendix B (search snippet only, not fetched):
      https://cms3.revize.com/revize/sancarlos/Document%20Center/Housing%20Element/09_AppendixB_Final.pdf
  - Rezoning/General Plan Amendment resolution found by search (URL looks
    authentic/city-hosted, but content **unconfirmed by WebFetch**):
    https://cms3.revize.com/revize/sancarlos/Att%202%20308%20Phelps_Reso%20GPA%20and%20RZ%20and%20Exhibit%20A%20and%20B.pdf
    — a 2024 "Resolution No. 2024-___" General Plan Amendment + Rezone
    (Phelps site); resolution number is incomplete in the snippet.
  - Additional General Plan amendments per search snippet (**unconfirmed by
    direct fetch**): adopted **May 27, 2025** (Land Use, Circulation &
    Scenic Highways, Environmental Management, Parks & Recreation, Noise
    elements) and **November 24, 2025** (**Resolution No. 2025-134**).
  - City's Housing Element / General Plan hub pages (presumed live via
    search, not individually WebFetched):
    - https://www.cityofsancarlos.org/city_hall/departments_and_divisions/community_development/planning/plans_and_standards/general_plan_capacity_revision.php
      ("2045 General Plan Reset")
    - https://www.cityofsancarlos.org/city_hall/departments_and_divisions/community_development/planning/plans_and_standards/focused_general_plan_and_zoning_update_(2020-2023).php
  - **No Builder's Remedy activity found** for San Carlos in this research
    pass — treat as "not found," not "confirmed absent"; not exhaustively
    searched.
  - Secondary (non-government) commentary source, useful for narrative
    cross-check only: https://sancarloslife.com/2023-2031-san-carlos-housing-element/
- **Access notes:** codepublishing.com returned **HTTP 403 Forbidden** on
  every direct WebFetch attempt — a bot wall, not a true login requirement.
  One Revize-hosted PDF (`2022-03-21 Planning Commission - Full
  Agenda-3320.pdf`) failed WebFetch specifically due to a **file-size limit**
  (`maxContentLength 10485760 exceeded`), not a block — the file itself is
  real and reachable, just too large for this tool's fetch/convert pipeline;
  a live browser or direct download would work.
- **Est. pull effort:** **Medium–High.** HCD's own PDFs and the
  `sancarlos2040.org` adopted Housing Element are directly fetchable
  primary sources. The municipal code (Title 18 zoning text) and several
  2024–2025 rezoning/General-Plan-amendment resolutions are real but
  blocked or oversized for automated fetch and need a live session to pull
  cleanly.

---

## 4. Login Walls / CAPTCHA / Pagination Notes for a Human+Browser Session

- **cityofsancarlos.org (main site):** No login wall or CAPTCHA encountered.
  However, key pages — `city_hall/public_meetings.php` and the
  `planning_and_transportation_commission.php` commission page — rendered
  as **mostly-empty/nav-only** on WebFetch, strongly suggesting they are
  **JS-rendered** (portal links load client-side). This is the specific
  reason the current (post-Sept-2022) agenda platform name could not be
  pinned down here — a live browser session is required to see it.
- **sancarlosca.iqm2.com (legacy IQM2/Granicus archive):** No login wall or
  CAPTCHA. Fully server-rendered static ASP.NET page, fetched cleanly. This
  is the more reliable automated-fetch target for pre-September-2022
  materials.
- **codepublishing.com (municipal code):** Returned HTTP 403 to every direct
  WebFetch attempt on both the base URL and individual chapter pages — a
  bot wall / WebFetch-user-agent block. Confirmed as the real code host only
  via a traced 301 redirect from `cityofsancarlos.org/municode/`. A real
  browser session should load normally.
- **cms3.revize.com (city document-center CMS):** No login wall or CAPTCHA,
  but at least one PDF hit a **file-size limit** in the automated fetch
  tool (10MB cap) rather than an access block — treat large PDFs here as
  reachable but requiring a direct download/browser rather than WebFetch.
- **hcd.ca.gov:** No access barriers of any kind encountered; state PDFs
  fetched normally where attempted.
- **No CAPTCHA was encountered** on any site in this research pass.

---

## Pull Plan

Ordered list of exact pages for a human+browser-extension session to visit
first:

1. https://www.cityofsancarlos.org/city_hall/boards_and_commissions/planning_and_transportation_commission.php
   — start here for the current commission's meeting schedule and portal
   link (renders JS-only content in a live browser that WebFetch missed).
2. https://www.cityofsancarlos.org/agenda — load live to identify the
   current agenda platform (name unconfirmed in this pass) and pull the
   trailing 6–12 months of Planning and Transportation Commission agendas.
3. https://sancarlosca.iqm2.com/Citizens/Default.aspx — legacy IQM2/Granicus
   archive for all meetings prior to September 9, 2022, including the
   separate historical "Transportation and Circulation Commission" listing
   (confirm the merger date/history live).
4. https://www.codepublishing.com/CA/SanCarlos/ — municipal code host
   (403'd to automated fetch); load live to confirm the "current through
   Ordinance 1635, passed April 13, 2026" banner and drill into Title 18
   (Zoning).
5. https://www.codepublishing.com/CA/SanCarlos/html/SanCarlos18/SanCarlos1835.html
   — Ch. 18.35, Amendments to Zoning Ordinance and Map — most direct path
   to recent zoning amendment history.
6. https://www.sancarlos2040.org/files/managed/Document/162/HE%20HCDV4%20_041124.pdf
   — adopted Housing Element (confirmed fetchable), for the housing-element
   compliance paper trail.
7. https://www.hcd.ca.gov/sites/default/files/docs/planning-and-community/housing-element/smaSanCarlosDraftOut010623.pdf
   — HCD's Jan 6, 2023 review letter on the draft Housing Element.
8. https://cms3.revize.com/revize/sancarlos/Att%202%20308%20Phelps_Reso%20GPA%20and%20RZ%20and%20Exhibit%20A%20and%20B.pdf
   — 2024 General Plan Amendment + Rezone resolution (Phelps site); confirm
   the full resolution number live (incomplete in snippet).
9. https://www.cityofsancarlos.org/city_hall/departments_and_divisions/community_development/planning/plans_and_standards/general_plan_capacity_revision.php
   — "2045 General Plan Reset" hub page, likely the fastest path to the
   May 27, 2025 and November 24, 2025 (Resolution No. 2025-134) General
   Plan amendment actions cited only from search snippets here.
10. https://cms3.revize.com/revize/sancarlos/Document%20Center/.../2022-03-21%20Planning%20Commission%20-%20Full%20Agenda-3320.pdf
    — earliest confirmed Revize-hosted Planning Commission agenda PDF
    (March 2022); download directly rather than via WebFetch (hit the
    tool's 10MB size limit in this pass).
