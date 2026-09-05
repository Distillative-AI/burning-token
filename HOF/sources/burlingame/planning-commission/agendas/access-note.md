# Burlingame Planning Commission — access note (2026-09-05)

**CONFIRMED SIGN-IN WALL** at `https://www.burlingame.org/AgendaCenter/Planning-Commission-5/`
(and likely other guessed numeric slugs on this path) — redirects to a real CivicPlus
IdentityServer OAuth login (`cpauthentication.civicplus.com`, offers email/Apple/Facebook/
Google/Microsoft sign-in, "Don't have an account? Sign up"). This is a genuine account
requirement, not a rendering delay or bot-block — distinct from every other portal pulled so
far in this project (Menlo Park, San Mateo, Redwood City, Pacifica, Daly City, South San
Francisco, Millbrae all rendered fully public).

**However:** this may be the wrong path entirely. SOURCES.md's original prep identified
Burlingame's real Planning Commission archive as living on **Granicus**
(`burlingame.granicus.com`, confirmed archive Jan 2017–Aug 2026 via direct fetch in that
earlier pass), separate from this CivicEngage/CivicPlus AgendaCenter route. My attempted
`view_id=1` guess on Granicus 404'd; the correct view_id was not re-derived in this pass.

**Per founder instruction:** when a portal genuinely requires sign-up/login, stop and let the
human complete it via the browser extension rather than attempting it. If the Granicus path
turns out to also require login (unconfirmed), this becomes the actual human-in-the-loop case
to hand off. Recommend: human confirms live whether burlingame.granicus.com's real view_id is
public (matching the SOURCES.md prep finding) before treating AgendaCenter's sign-in wall as
the only path.

## Next
Live-confirm the correct Granicus view_id for Burlingame Planning Commission (try
burlingame.granicus.com root or a linked page from the city site) before concluding this city
requires sign-up.
