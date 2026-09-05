// Storage layer for searches/findings.
//
// DEPLOYMENT NOTE: Vercel's serverless filesystem is ephemeral/read-only at
// runtime, so a plain better-sqlite3 file DB does NOT persist across
// requests/deploys there. This module therefore branches on env:
//   - If TURSO_DATABASE_URL is set, use @libsql/client (Turso/libSQL) — a
//     real persistent, SQLite-compatible store that works on Vercel.
//   - Otherwise, fall back to a local better-sqlite3 file under app/data/
//     (gitignored) for local dev, where the filesystem is real and persistent.
//
// Both branches expose the same small async API (getDb-less; call the
// exported functions directly) so route/pipeline code never touches the
// driver directly and doesn't change when the backing store changes.

import path from 'node:path';
import fs from 'node:fs';

export interface SearchRow {
  id: number;
  session_id: string;
  jurisdiction: string;
  query: string;
  depth: string;
  output_type: string;
  trigger_reason: string;
  timestamp: string;
  raw_json: string | null;
  status: string;
  error: string | null;
}

export interface FindingRow {
  id: number;
  search_id: number;
  jurisdiction: string;
  claim: string;
  topic: string;
  source_url: string | null;
  source_name: string | null;
  confidence: string;
  origin: string;
}

const SCHEMA_SQL = `
  CREATE TABLE IF NOT EXISTS searches (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    session_id TEXT NOT NULL,
    jurisdiction TEXT NOT NULL,
    query TEXT NOT NULL,
    depth TEXT NOT NULL,
    output_type TEXT NOT NULL,
    trigger_reason TEXT NOT NULL DEFAULT 'initial',
    timestamp TEXT NOT NULL,
    raw_json TEXT,
    status TEXT NOT NULL DEFAULT 'pending',
    error TEXT
  );

  CREATE TABLE IF NOT EXISTS findings (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    search_id INTEGER NOT NULL REFERENCES searches(id),
    jurisdiction TEXT NOT NULL,
    claim TEXT NOT NULL,
    topic TEXT NOT NULL,
    source_url TEXT,
    source_name TEXT,
    confidence TEXT NOT NULL DEFAULT 'medium',
    origin TEXT NOT NULL DEFAULT 'linkup'
  );

  CREATE INDEX IF NOT EXISTS idx_searches_session ON searches(session_id);
  CREATE INDEX IF NOT EXISTS idx_findings_search ON findings(search_id);
`;

// ---- Driver abstraction --------------------------------------------------

interface Driver {
  run(sql: string, params?: unknown[]): { lastInsertRowid: number | bigint };
  all<T>(sql: string, params?: unknown[]): T[];
  get<T>(sql: string, params?: unknown[]): T | undefined;
  exec(sql: string): void;
}

declare global {
  // eslint-disable-next-line no-var
  var __brcDriver: Driver | undefined;
}

function useTurso(): boolean {
  return !!process.env.TURSO_DATABASE_URL;
}

function buildBetterSqlite3Driver(): Driver {
  // Lazy require so this optional-for-prod dependency doesn't need to load
  // in a Turso-backed deployment.
  // eslint-disable-next-line @typescript-eslint/no-var-requires
  const Database = require('better-sqlite3');
  const DATA_DIR = path.join(process.cwd(), 'data');
  if (!fs.existsSync(DATA_DIR)) fs.mkdirSync(DATA_DIR, { recursive: true });
  const DB_PATH = path.join(DATA_DIR, 'builders-remedy-checker.sqlite');

  const db = new Database(DB_PATH);
  db.pragma('journal_mode = WAL');

  return {
    run(sql, params = []) {
      const info = db.prepare(sql).run(...params);
      return { lastInsertRowid: info.lastInsertRowid };
    },
    all<T>(sql: string, params: unknown[] = []) {
      return db.prepare(sql).all(...params) as T[];
    },
    get<T>(sql: string, params: unknown[] = []) {
      return db.prepare(sql).get(...params) as T | undefined;
    },
    exec(sql: string) {
      db.exec(sql);
    },
  };
}

/**
 * Turso/libSQL driver. Note: @libsql/client's execute() is async, but this
 * app's call sites are already inside async route handlers / server
 * functions, so we expose a sync-looking API backed by a queued promise the
 * first caller in a request awaits — in practice each exported function
 * below (insertSearch, etc.) is declared async when TURSO is active. To keep
 * one call-site API for both drivers without sprinkling `await` conditionally,
 * we resolve Turso calls via a blocking-style wrapper is NOT possible in JS,
 * so instead the public functions in this file are all `async` and both
 * drivers are used through async methods. See the async wrappers below.
 */
function buildTursoDriver() {
  // eslint-disable-next-line @typescript-eslint/no-var-requires
  const { createClient } = require('@libsql/client');
  const client = createClient({
    url: process.env.TURSO_DATABASE_URL!,
    authToken: process.env.TURSO_AUTH_TOKEN,
  });
  return client;
}

let driverHandle: ReturnType<typeof buildTursoDriver> | Driver | undefined;
let schemaReady = false;

function getLocalDriver(): Driver {
  if (!global.__brcDriver) {
    global.__brcDriver = buildBetterSqlite3Driver();
    global.__brcDriver.exec(SCHEMA_SQL);
  }
  return global.__brcDriver;
}

async function ensureTursoSchema(client: ReturnType<typeof buildTursoDriver>) {
  if (schemaReady) return;
  const statements = SCHEMA_SQL.split(';').map((s) => s.trim()).filter(Boolean);
  for (const stmt of statements) {
    await client.execute(stmt);
  }
  schemaReady = true;
}

// ---- Public API (all async; local driver wraps sync calls in Promise.resolve) ----

export async function insertSearch(row: Omit<SearchRow, 'id'>): Promise<number> {
  const sql = `
    INSERT INTO searches (session_id, jurisdiction, query, depth, output_type, trigger_reason, timestamp, raw_json, status, error)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  `;
  const params = [
    row.session_id,
    row.jurisdiction,
    row.query,
    row.depth,
    row.output_type,
    row.trigger_reason,
    row.timestamp,
    row.raw_json,
    row.status,
    row.error,
  ];

  if (useTurso()) {
    const client = buildTursoDriver();
    await ensureTursoSchema(client);
    const res = await client.execute({ sql, args: params });
    return Number(res.lastInsertRowid);
  }

  const driver = getLocalDriver();
  const info = driver.run(sql, params);
  return Number(info.lastInsertRowid);
}

export async function updateSearchResult(id: number, raw_json: string, status: string, error: string | null = null) {
  const sql = `UPDATE searches SET raw_json = ?, status = ?, error = ? WHERE id = ?`;
  if (useTurso()) {
    const client = buildTursoDriver();
    await ensureTursoSchema(client);
    await client.execute({ sql, args: [raw_json, status, error, id] });
    return;
  }
  getLocalDriver().run(sql, [raw_json, status, error, id]);
}

export async function insertFinding(row: Omit<FindingRow, 'id'>): Promise<number> {
  const sql = `
    INSERT INTO findings (search_id, jurisdiction, claim, topic, source_url, source_name, confidence, origin)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)
  `;
  const params = [
    row.search_id,
    row.jurisdiction,
    row.claim,
    row.topic,
    row.source_url,
    row.source_name,
    row.confidence,
    row.origin,
  ];

  if (useTurso()) {
    const client = buildTursoDriver();
    await ensureTursoSchema(client);
    const res = await client.execute({ sql, args: params });
    return Number(res.lastInsertRowid);
  }

  const driver = getLocalDriver();
  const info = driver.run(sql, params);
  return Number(info.lastInsertRowid);
}

export async function getSearchesBySession(sessionId: string): Promise<SearchRow[]> {
  const sql = `SELECT * FROM searches WHERE session_id = ? ORDER BY id ASC`;
  if (useTurso()) {
    const client = buildTursoDriver();
    await ensureTursoSchema(client);
    const res = await client.execute({ sql, args: [sessionId] });
    return res.rows as unknown as SearchRow[];
  }
  return getLocalDriver().all<SearchRow>(sql, [sessionId]);
}

export async function getFindingsBySession(sessionId: string): Promise<FindingRow[]> {
  const sql = `SELECT f.* FROM findings f JOIN searches s ON f.search_id = s.id WHERE s.session_id = ? ORDER BY f.id ASC`;
  if (useTurso()) {
    const client = buildTursoDriver();
    await ensureTursoSchema(client);
    const res = await client.execute({ sql, args: [sessionId] });
    return res.rows as unknown as FindingRow[];
  }
  return getLocalDriver().all<FindingRow>(sql, [sessionId]);
}

export async function getSearchById(id: number): Promise<SearchRow | undefined> {
  const sql = `SELECT * FROM searches WHERE id = ?`;
  if (useTurso()) {
    const client = buildTursoDriver();
    await ensureTursoSchema(client);
    const res = await client.execute({ sql, args: [id] });
    return (res.rows[0] as unknown as SearchRow) ?? undefined;
  }
  return getLocalDriver().get<SearchRow>(sql, [id]);
}
