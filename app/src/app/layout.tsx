import type { Metadata } from 'next';
import './globals.css';

export const metadata: Metadata = {
  title: "Builder's Remedy Checker — San Mateo County",
  description:
    "Check SB9/SB35/SB10/Builder's Remedy eligibility for San Mateo County jurisdictions, sourced live via Linkup research.",
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body className="min-h-screen">
        <header className="border-b border-slate-200 bg-white">
          <div className="mx-auto max-w-4xl px-4 py-4">
            <a href="/" className="text-lg font-semibold text-brick-700">
              Builder&rsquo;s Remedy Checker
            </a>
            <p className="text-sm text-slate-500">San Mateo County, CA · SB9 / SB35 / SB10 / Builder&rsquo;s Remedy</p>
          </div>
        </header>
        <main className="mx-auto max-w-4xl px-4 py-8">{children}</main>
        <footer className="mx-auto max-w-4xl px-4 py-8 text-xs text-slate-400">
          Research aid only — not legal advice. Every claim below is sourced; anything unresolved is flagged, not guessed.
        </footer>
      </body>
    </html>
  );
}
