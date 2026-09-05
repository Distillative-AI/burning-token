# Linkup Search API — Pricing & API Shape Notes

Source: https://docs.linkup.so/pages/documentation/platform/pricing (fetched 2026-09-05)

## Free plan / signup credit

- Linkup does not describe a distinct "free plan" tier as such. Instead: **new users
  signing up with a professional email receive $20 in automatic account credit**, with
  monthly top-ups to maintain that balance (per the pricing page text as fetched).
- No monthly request-count limit or rate limit is documented on this page.
- **No hackathon-specific "event credits" are mentioned anywhere on the pricing page.**
  If the challenge brief promises separate hackathon/event credits, that is coming from
  the hackathon organizers directly (a promo code / sponsor-provided key), not from
  Linkup's own published pricing tiers — verify with the event organizers, don't assume
  it stacks with or replaces the $20 signup credit automatically.
- Billing model: **credit is consumed per search call**, not a flat subscription; no
  credit is deducted on errors (missing parameter, internal server error, or "no
  relevant results found").

## Cost per search (verbatim from pricing page)

| Depth              | Output type                    | Cost per call |
|--------------------|---------------------------------|---------------|
| Fast / Standard    | `searchResults`                 | $0.005        |
| Fast / Standard    | `sourcedAnswer` / structured     | $0.006        |
| Deep               | `searchResults`                 | $0.05         |
| Deep               | `sourcedAnswer` / structured     | $0.055        |

Practical read: with the $20 signup credit, that's roughly **~3,600 fast searches**
(at $0.0055 blended) or **~360 deep searches** before hitting $0 — deep search is
~10x the cost of fast/standard. For a hackathon demo, default to `fast` or `standard`
depth and reserve `deep` for a small number of showcase queries.

## API shape (verified from quickstart)

Source: https://docs.linkup.so/pages/documentation/get-started/quickstart (fetched 2026-09-05)

- **Endpoint:** `GET https://api.linkup.so/v1/search`
- **Auth header:** `Authorization: Bearer $LINKUP_API_KEY`
- **Query parameters:**
  - `q` (required) — search query string
  - `depth` (optional) — `"fast"` (sub-second latency) or `"deep"` (multi-iteration search)
  - `outputType` (optional) — e.g. `"sourcedAnswer"` (also `searchResults` per pricing page naming)

### Example request (verbatim from docs)

```bash
curl "https://api.linkup.so/v1/search" \
    -G \
    -H "Authorization: Bearer $LINKUP_API_KEY" \
    --data-urlencode "q=What is Microsoft's 2024 revenue?" \
    --data-urlencode "depth=deep" \
    --data-urlencode "outputType=sourcedAnswer"
```

### Example response (200, verbatim from docs)

```json
{
  "answer": "Microsoft's revenue for fiscal year 2024 was $245.1 billion, reflecting a 16% increase from the previous year.",
  "sources": [
    {
      "name": "Source Name",
      "url": "https://example.com",
      "snippet": "Relevant content excerpt",
      "favicon": "https://example.com/favicon.ico"
    }
  ]
}
```

### Sanity-check checklist for the app's actual implementation

When reviewing `app/`'s Linkup integration, confirm it:
- [ ] Sends `Authorization: Bearer <key>` (not `X-API-Key` or a query-string key)
- [ ] Uses `GET` with `-G`/query-string params, not a JSON POST body
- [ ] Sets `depth=fast` (or `standard`) by default, not `deep`, to conserve credit
- [ ] Reads `outputType` correctly matched to how it parses the response (`answer` +
      `sources[]` for `sourcedAnswer`, vs a raw results array for `searchResults`)
- [ ] Handles the "no credit deducted on error" case gracefully (retries/error UI, not
      a wasted-credit assumption)
