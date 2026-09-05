import { findCityBySlug } from '@/lib/cities';
import { loadPipelineResultFromSession } from '@/lib/pipeline';
import { getSearchesBySession } from '@/lib/db';
import { PathwayVerdict } from '@/lib/eligibility';
import { notFound } from 'next/navigation';

function statusBadge(status: PathwayVerdict['status']) {
  const styles: Record<PathwayVerdict['status'], string> = {
    likely_applies: 'bg-green-100 text-green-800 border-green-300',
    possibly_applies: 'bg-yellow-100 text-yellow-800 border-yellow-300',
    likely_does_not_apply: 'bg-slate-100 text-slate-600 border-slate-300',
    unknown: 'bg-red-50 text-red-700 border-red-200',
  };
  const labels: Record<PathwayVerdict['status'], string> = {
    likely_applies: 'Likely applies',
    possibly_applies: 'Possibly applies',
    likely_does_not_apply: 'Likely does not apply',
    unknown: 'Could not confirm',
  };
  return <span className={`inline-block rounded-full border px-3 py-1 text-xs font-medium ${styles[status]}`}>{labels[status]}</span>;
}

export default async function ResultsPage({ params }: { params: { sessionId: string } }) {
  const searches = await getSearchesBySession(params.sessionId);
  if (searches.length === 0) notFound();

  const city = findCityBySlug(searches[0].jurisdiction);
  if (!city) notFound();

  const result = await loadPipelineResultFromSession(params.sessionId, city);

  const allSourceUrls = Array.from(
    new Set(result.findings.map((f) => f.source_url).filter((u): u is string => !!u))
  );

  return (
    <div className="space-y-10">
      <div>
        <h1 className="text-2xl font-bold text-slate-900">{city.name}</h1>
        <p className="text-sm text-slate-500">Eligibility summary — research session {result.sessionId.slice(0, 8)}</p>
      </div>

      <section>
        <h2 className="mb-3 text-lg font-semibold text-slate-800">Pathway eligibility</h2>
        <div className="grid gap-3 sm:grid-cols-2">
          {result.eligibility.map((v) => (
            <div key={v.pathway} className="rounded-lg border border-slate-200 bg-white p-4 shadow-sm">
              <div className="mb-2 flex items-center justify-between">
                <h3 className="font-medium text-slate-900">{v.pathway}</h3>
                {statusBadge(v.status)}
              </div>
              {v.basis.length > 0 ? (
                <ul className="space-y-1 text-sm text-slate-600">
                  {v.basis.slice(0, 3).map((claim, i) => (
                    <li key={i} className="border-l-2 border-slate-200 pl-2">
                      {claim}
                    </li>
                  ))}
                </ul>
              ) : (
                <p className="text-sm text-slate-400">No findings yet on this pathway.</p>
              )}
              {v.sourceUrls.length > 0 && (
                <div className="mt-2 flex flex-wrap gap-2">
                  {v.sourceUrls.map((u) => (
                    <a key={u} href={u} target="_blank" rel="noreferrer" className="text-xs text-brick-600 underline">
                      source
                    </a>
                  ))}
                </div>
              )}
            </div>
          ))}
        </div>
      </section>

      {result.couldNotConfirm.length > 0 && (
        <section className="rounded-lg border border-red-200 bg-red-50 p-4">
          <h2 className="mb-2 font-semibold text-red-800">Could not confirm</h2>
          <ul className="list-inside list-disc space-y-1 text-sm text-red-700">
            {result.couldNotConfirm.map((v) => (
              <li key={v.pathway}>{v.pathway} status was not resolved by cached research or live search.</li>
            ))}
          </ul>
        </section>
      )}

      <section>
        <h2 className="mb-3 text-lg font-semibold text-slate-800">Search sequence &amp; why</h2>
        <ol className="space-y-3">
          {result.steps.length === 0 && (
            <li className="rounded-md border border-amber-200 bg-amber-50 p-3 text-sm text-amber-800">
              No live Linkup searches ran for this session — see configuration note below.
            </li>
          )}
          {result.steps.map((s, i) => (
            <li key={s.searchId} className="rounded-md border border-slate-200 bg-white p-3 text-sm">
              <div className="mb-1 flex items-center justify-between">
                <span className="font-medium text-slate-700">
                  Step {i + 1} · depth={s.depth} · {s.status === 'ok' ? `${s.findingsCount} findings` : 'error'}
                </span>
                <span className="text-xs text-slate-400">{s.triggerReason}</span>
              </div>
              <p className="text-slate-600">{s.query}</p>
              {s.error && <p className="mt-1 text-xs text-red-600">{s.error}</p>}
            </li>
          ))}
        </ol>
      </section>

      <section>
        <h2 className="mb-3 text-lg font-semibold text-slate-800">Starting cache used</h2>
        {result.cacheDocs.length > 0 ? (
          <ul className="list-inside list-disc text-sm text-slate-600">
            {result.cacheDocs.map((d) => (
              <li key={d.path}>
                <code className="text-xs">{d.path}</code>
              </li>
            ))}
          </ul>
        ) : (
          <p className="text-sm text-slate-400">No pre-existing HOF/sources research found for this jurisdiction.</p>
        )}
      </section>

      <section>
        <h2 className="mb-3 text-lg font-semibold text-slate-800">All sources</h2>
        {allSourceUrls.length > 0 ? (
          <ul className="list-inside list-disc space-y-1 text-sm">
            {allSourceUrls.map((u) => (
              <li key={u}>
                <a href={u} target="_blank" rel="noreferrer" className="text-brick-600 underline break-all">
                  {u}
                </a>
              </li>
            ))}
          </ul>
        ) : (
          <p className="text-sm text-slate-400">No external source URLs yet (live search may not have run).</p>
        )}
      </section>
    </div>
  );
}
