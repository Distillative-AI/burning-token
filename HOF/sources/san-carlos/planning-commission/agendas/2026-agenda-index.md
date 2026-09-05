# San Carlos — Public Meetings Portal (confirmed, no login)

Pulled live 2026-09-05 from https://www.cityofsancarlos.org/city_hall/public_meetings.php
(human-in-the-loop browser session). Embedded PrimeGov-style widget, no login wall.

## Confirmed: merged body name and full boards list

**"Planning and Transportation Commission"** — confirmed as the real current merged body
(Planning Commission + Transportation Commission merged, per SOURCES.md's earlier finding).
Full boards/commissions list on this portal: City Council, Downtown Advisory Committee,
Economic Development Advisory Commission, Parks/Recreation & Culture Commission,
**Planning and Transportation Commission**, Two Plus Two, Youth Advisory Council, Zoning
Administrator Hearing.

## Current/upcoming (as of pull date)
| Meeting | Date | Docs |
|---|---|---|
| Planning and Transportation Commission Regular Meeting | Sep 8, 2026 | Cancellation Notice |
| Youth Advisory Council Regular Meeting | Sep 9, 2026 | Agenda |

## 2026 archive (72 total entries across all boards, first page shown)
| Meeting | Date | Docs |
|---|---|---|
| Youth Advisory Council Special Meeting | Aug 26, 2026 | Agenda |
| Economic Development Advisory Commission Regular Meeting | Aug 25, 2026 | Agenda, HTML Packet, Packet |
| City Council Regular Meeting | Aug 24, 2026 | HTML Packet, Agenda, Packet, Video |
| City Council Special Meeting | Aug 24, 2026 | Agenda |
| **Planning and Transportation Commission Regular Meeting** | **Aug 17, 2026** | Agenda, HTML Packet, Packet, Video |

## Access limitation encountered
The widget's document links (Agenda/HTML Packet/Packet) open in a new browser
window/tab that did not attach to this automation session (same pattern seen with
Pacifica's IQM2 calendar) — the click registered but no navigable content resulted in
this session. Item-level content for the Aug 17, 2026 Planning and Transportation
Commission meeting was NOT successfully extracted this pass.

## Next
Retry opening the Aug 17, 2026 "HTML Packet" link directly, or try constructing the URL from
the page's underlying API pattern (likely PrimeGov, matching San Mateo's `meetingTemplateId`
pattern) if this becomes a priority re-visit.
