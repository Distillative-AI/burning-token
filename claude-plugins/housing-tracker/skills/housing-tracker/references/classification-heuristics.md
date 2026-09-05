# Classification heuristics

Two regex-based classifiers, applied to an ingested item's raw text at read time (not
baked into the stored data — so improving a heuristic improves every existing record for
free, with no re-ingestion needed). Both are heuristics: tune them against real text,
don't trust a single keyword match blindly.

## 1. Housing-signal (residential vs. everything else)

```js
const HOUSING_SIGNAL =
  /\b(dwelling units?|residential|multi-family|housing|adu\b|density bonus|builder'?s remedy|apartments?|condominiums?|units?\b|rhna|sb\s?9|sb\s?35|sb\s?79|sb\s?10|zoning|upzon|rezon)/i;
```

**Known failure mode, fixed in this project**: a keyword match on "housing" fires even
when the surrounding text explicitly says the item is *not* a housing item — e.g. a
commercial R&D building's description explaining, in prose, why it's being recorded as a
non-housing contrast case still contains the word "housing" several times. Guard with an
explicit self-declared-exclusion check that runs *first* and short-circuits to `false`:

```js
const NOT_HOUSING_OVERRIDE = /\bnot\b[^.;]{0,20}\bhousing\b|non-housing/i;

function isHousingSignal(text) {
  if (NOT_HOUSING_OVERRIDE.test(text)) return false;
  return HOUSING_SIGNAL.test(text);
}
```

## 2. Capture-mechanism taxonomy (the "HOW" of opposition)

A closed, seven-value enum — sourced from this project's own structural-moats research,
not invented ad hoc. Each pattern is checked in order; first match wins:

| Key | Pattern (illustrative, not exhaustive) | Meaning |
|---|---|---|
| `ceqa-litigation` | `ceqa (lawsuit|litigation|appeal|challenge|suit|complaint)` | An environmental-review lawsuit/appeal used against the project |
| `ballot-box-supermajority` | `measure [A-Z]`, `ballot`, `voter approval`, `initiative` | Routing the decision through an election |
| `discretionary-design-review` | `discretionary`, `design review`, `use permit`, `conditional use` | A judgment-call hearing, not a fixed checklist |
| `subjective-design-standard` | `objective design standards?` (i.e. a *reference* to the ODS concept, used to detect when a city is discussing its own standards) | A vague "neighborhood compatibility" style standard |
| `pla-linked-appeal` | `project labor agreement`, `\bpla\b` | An appeal used as labor-negotiation leverage |
| `minimum-lot-size-setback` | `setback`, `lot size`, `floor area ratio`, `height cap` | Baseline zoning rules that exclude density by design |
| `fiscal-zoning-prop13` | `prop(osition)? ?13`, `fiscal(ization)?`, `sales[- ]tax`, `commercial zoning` | Preferring tax-generating commercial use over housing |

**Important asymmetry to preserve**: a CEQA *exemption* (e.g. "CEQA-exempt under PRC
§21080.66") is the *opposite* of CEQA-litigation-as-capture-mechanism — it means the
review step was bypassed, not weaponized. Do not match plain "CEQA" mentions; require
litigation-specific language (`ceqa lawsuit`, `ceqa appeal`, etc.), otherwise every
CEQA-exempt infill-housing item gets mislabeled as under litigation attack.

## 3. Per-item risk checklist (built from #2, cross-referenced against city data)

For a given item, score each of the seven mechanisms above as `confirmed` / `possible` /
`not-evidenced`, using two evidence sources only:

1. **Direct textual evidence** in the item's own text (e.g. it IS a discretionary hearing,
   or it explicitly requests a zoning exception → `confirmed`).
2. **Cross-referenced evidence** from that same jurisdiction's other ingested records
   (e.g. a `ballot-box-supermajority` ordinance already on file for this city is real
   evidence that lever exists there → `confirmed`, cited by ordinance title — not present
   → `not-evidenced`, not a guess).

Never invent a third evidence source (sentiment, inference from unrelated cities,
speculation about intent) — the whole point of the `not-evidenced` bucket is to keep the
tool honest about what it doesn't actually know yet.
