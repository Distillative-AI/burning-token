// Reads the pre-existing per-city research citizens under HOF/sources/<city>/
// as a starting cache, so live Linkup calls only need to fill genuine gaps
// rather than re-deriving what the project already researched.
//
// This deliberately does NOT try to be a full HOF/.scm interpreter — it just
// walks the directory, reads .md/.scm files, and returns their raw text plus
// path, which is enough for gap-detection to check "do we already have
// something on topic X for this city" and for the UI to cite it as a source.

import fs from 'node:fs';
import path from 'node:path';

// HOF/sources/ lives at the housing project root, one level up from app/.
const HOF_SOURCES_ROOT = path.join(process.cwd(), '..', 'HOF', 'sources');

export interface CachedDoc {
  jurisdiction: string;
  relativePath: string;
  absolutePath: string;
  content: string;
}

function walk(dir: string, out: string[]) {
  let entries: fs.Dirent[];
  try {
    entries = fs.readdirSync(dir, { withFileTypes: true });
  } catch {
    return;
  }
  for (const entry of entries) {
    const full = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      walk(full, out);
    } else if (entry.name.endsWith('.md') || entry.name.endsWith('.scm')) {
      out.push(full);
    }
  }
}

/** Loads every cached .md/.scm doc for a given city slug under HOF/sources/<slug>/. */
export function loadCityCache(citySlug: string): CachedDoc[] {
  const cityDir = path.join(HOF_SOURCES_ROOT, citySlug);
  const files: string[] = [];
  walk(cityDir, files);

  return files.map((absolutePath) => ({
    jurisdiction: citySlug,
    relativePath: path.relative(HOF_SOURCES_ROOT, absolutePath),
    absolutePath,
    content: safeRead(absolutePath),
  }));
}

function safeRead(p: string): string {
  try {
    return fs.readFileSync(p, 'utf-8');
  } catch {
    return '';
  }
}

/**
 * Very lightweight topic detector over the cached docs: does the existing
 * cache already say anything about a given topic keyword set for this city?
 * Used by gap detection to decide whether a Linkup call is actually needed.
 */
export function cacheCoversTopic(docs: CachedDoc[], keywords: string[]): boolean {
  const haystack = docs.map((d) => d.content.toLowerCase()).join('\n');
  return keywords.some((k) => haystack.includes(k.toLowerCase()));
}

export function cacheSourceList(docs: CachedDoc[]): { path: string }[] {
  return docs.map((d) => ({ path: d.relativePath }));
}
