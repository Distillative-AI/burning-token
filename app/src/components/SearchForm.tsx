'use client';

import { useRouter } from 'next/navigation';
import { useState } from 'react';
import { CITIES } from '@/lib/cities';

export default function SearchForm() {
  const router = useRouter();
  const [address, setAddress] = useState('');
  const [jurisdictionSlug, setJurisdictionSlug] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  async function submit(e: React.FormEvent) {
    e.preventDefault();
    setError(null);
    setLoading(true);
    try {
      const res = await fetch('/api/search', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ address: address || undefined, jurisdictionSlug: jurisdictionSlug || undefined }),
      });
      const data = await res.json();
      if (!res.ok) {
        setError(data.error ?? 'Search failed.');
        setLoading(false);
        return;
      }
      router.push(`/results/${data.sessionId}`);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Unexpected error.');
      setLoading(false);
    }
  }

  return (
    <form onSubmit={submit} className="space-y-4 rounded-lg border border-slate-200 bg-white p-6 shadow-sm">
      <div>
        <label className="block text-sm font-medium text-slate-700">Property address (optional)</label>
        <input
          type="text"
          value={address}
          onChange={(e) => setAddress(e.target.value)}
          placeholder="123 Main St, Redwood City, CA"
          className="mt-1 w-full rounded-md border border-slate-300 px-3 py-2 text-sm focus:border-brick-500 focus:outline-none focus:ring-1 focus:ring-brick-500"
        />
        <p className="mt-1 text-xs text-slate-400">
          We match this to a jurisdiction by name — it is not a geocoder. If it doesn&rsquo;t match, pick a city below.
        </p>
      </div>

      <div>
        <label className="block text-sm font-medium text-slate-700">Or pick a jurisdiction</label>
        <select
          value={jurisdictionSlug}
          onChange={(e) => setJurisdictionSlug(e.target.value)}
          className="mt-1 w-full rounded-md border border-slate-300 px-3 py-2 text-sm focus:border-brick-500 focus:outline-none focus:ring-1 focus:ring-brick-500"
        >
          <option value="">Select a city…</option>
          {CITIES.map((c) => (
            <option key={c.slug} value={c.slug}>
              {c.name}
            </option>
          ))}
        </select>
      </div>

      {error && <p className="text-sm text-red-600">{error}</p>}

      <button
        type="submit"
        disabled={loading || (!address && !jurisdictionSlug)}
        className="w-full rounded-md bg-brick-600 px-4 py-2 text-sm font-medium text-white hover:bg-brick-700 disabled:cursor-not-allowed disabled:opacity-50"
      >
        {loading ? 'Researching… (this calls Linkup live, may take 10–30s)' : 'Check eligibility'}
      </button>
    </form>
  );
}
