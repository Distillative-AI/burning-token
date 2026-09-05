// Background pre-research pass: reads HOF/sources/<city>/ for every
// jurisdiction and reports what's already cached vs. what a live Linkup
// pass would need to fill, WITHOUT calling Linkup. Run with:
//   npm run seed:cities
//
// This does not need LINKUP_API_KEY -- it only exercises the cache-check step
// of the pipeline so you can see, before spending any Linkup budget, which
// cities already have starting material for each required topic.

import { CITIES } from '../src/lib/cities';
import { loadCityCache } from '../src/lib/hofCache';

const REQUIRED_TOPIC_KEYWORDS: Record<string, string[]> = {
  housing_element_compliance: ['housing element', 'hcd', 'compliant'],
  sb9: ['sb9', 'sb 9', 'senate bill 9'],
  sb35: ['sb35', 'sb 35', 'senate bill 35'],
  sb10: ['sb10', 'sb 10', 'senate bill 10'],
  builders_remedy: ["builder's remedy", 'builders remedy'],
};

function main() {
  console.log(`Scanning HOF/sources/ for ${CITIES.length} jurisdictions...\n`);

  for (const city of CITIES) {
    const docs = loadCityCache(city.slug);
    const haystack = docs.map((d) => d.content.toLowerCase()).join('\n');

    const covered: string[] = [];
    const gaps: string[] = [];
    for (const [topic, keywords] of Object.entries(REQUIRED_TOPIC_KEYWORDS)) {
      const hit = keywords.some((k) => haystack.includes(k));
      (hit ? covered : gaps).push(topic);
    }

    console.log(`${city.name} (${city.slug})`);
    console.log(`  cached docs: ${docs.length}`);
    console.log(`  covered by cache: ${covered.length ? covered.join(', ') : '(none)'}`);
    console.log(`  gaps for live Linkup pass: ${gaps.length ? gaps.join(', ') : '(none — cache looks complete)'}`);
    console.log('');
  }
}

main();
