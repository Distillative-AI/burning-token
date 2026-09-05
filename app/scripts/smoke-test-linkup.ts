// One-shot live verification of the Linkup integration once LINKUP_API_KEY
// lands. Run with: npm run smoke:linkup
//
// Fires a single, cheap `depth=fast`-equivalent (we use standard, since this
// query needs a couple of facts) query for one real jurisdiction, prints the
// raw response, and exits non-zero on any failure so it's CI-friendly.

import { linkupSearch, getLinkupApiKey } from '../src/lib/linkup';
import { buildInitialQuery } from '../src/lib/queries';

async function main() {
  console.log('Checking LINKUP_API_KEY is set...');
  getLinkupApiKey(); // throws a clear error if missing

  const query = buildInitialQuery('Redwood City');
  console.log('Query:', JSON.stringify(query, null, 2));

  console.log('Calling Linkup Search API...');
  const response = await linkupSearch(query);

  console.log('\n--- Response ---');
  console.log(JSON.stringify(response, null, 2));

  const resultCount = (response.results ?? response.sources ?? []).length;
  console.log(`\nOK: received ${resultCount} result item(s).`);
}

main().catch((err) => {
  console.error('Smoke test FAILED:', err instanceof Error ? err.message : err);
  process.exit(1);
});
