import SearchForm from '@/components/SearchForm';

export default function HomePage() {
  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-2xl font-bold text-slate-900">
          Does Builder&rsquo;s Remedy, SB9, SB35, or SB10 apply to your project?
        </h1>
        <p className="mt-2 text-slate-600">
          Enter an address or pick one of the 14 San Mateo County jurisdictions. We start from this project&rsquo;s own
          researched city files, then run live, sourced research (via Linkup) to confirm current Housing Element
          compliance status, applicable overlays, and any recent ordinance or ballot-measure changes — and we tell you
          plainly what we could <em>not</em> confirm.
        </p>
      </div>
      <SearchForm />
    </div>
  );
}
