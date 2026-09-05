# Unincorporated San Mateo County Planning Commission — portal note

Confirmed live (2026-09-05, human-in-the-loop browser session, no login wall):
- Main hub: https://www.smcgov.org/planning/planning-commission — lists current-year upcoming
  hearings (Sep 9, Sep 23, Oct 14, 2026 as of this pull) and links to the full archive.
- Archive: https://www.smcgov.org/planning/planning-commission-hearing-archive — confirmed
  live, paginated (5 pages seen), back to 2013. Individual hearing pages exist per date
  (e.g. /planning/event/planning-commission-hearing-december-10-2025).

**Limitation found:** individual hearing event pages (the /event/... URLs) show only meeting
logistics (date, time, Zoom link, location) — **no agenda item content inline**. The actual
agenda/staff-report PDFs are not linked from the page text extracted in this pass; they may
be behind a "Documents" tab/section not captured by get_page_text, or hosted on a separate
document-management system entirely (unconfirmed).

**Also found:** clicking hearing-date links from the main hub page did not navigate in this
session (same JS-postback pattern seen at other portals) — needs either a direct URL guess
per date-slug pattern or a follow-up with more deliberate DOM interaction.

## Next
- Read the December 10, 2025 (or Sep 9, 2026) event page's full DOM (read_page, not just
  get_page_text) for a hidden Documents/Agenda tab or download link.
- Cross-reference against SOURCES.md's separately-confirmed SMCTA Hyland Cloud portal
  (smctd.hylandcloud.com/ta) for the transportation-equivalent body instead, which may have
  a cleaner agenda-access pattern worth trying first.
