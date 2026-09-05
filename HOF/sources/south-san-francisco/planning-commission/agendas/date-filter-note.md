# South San Francisco Legistar — date-filter limitation noted

The DepartmentDetail page (https://ci-ssf-ca.legistar.com/DepartmentDetail.aspx?ID=32898)
defaults to "Date: This Month" and only shows 2 records. A "This Year" option exists in the
dropdown but clicking it did not visibly change the results in this session (likely requires
a full page postback the click tool didn't trigger, or a subsequent explicit "Group"/refresh
action). Confirmed via curl+pdftotext instead that individual meeting agendas (via
View.ashx?M=A&ID=...) are real, public PDFs with no login wall — see
2026-09-03-agenda-detail.md for the one pulled.

**Next attempt strategy:** either (a) find each year's individual View.ashx IDs via the
Legistar "calendar view" toggle instead of list view, or (b) use Legistar's public
Legislation.aspx search with a POST request (previously found to reject GET-only fetches) via
a live browser form submission rather than a bare link click.
