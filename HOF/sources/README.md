# Per-city source chronology

One directory per city. Each holds raw pulls (human-in-the-loop, browser extension)
before /fundamental-ingestion converts them into housing.hof.scm citizens.

    HOF/sources/<city-slug>/
      planning-commission/
        agendas/        # raw agenda PDFs/HTML, dated YYYY-MM-DD
      transportation-commission/
        agendas/
      new-laws/          # adopted ordinances, zoning text amendments, ballot measures

Pull order per city:
1. City planning commission agenda page -> most recent + upcoming agendas
2. City transportation/traffic commission (or combined public-works) agenda page
3. Municode / city clerk "recently adopted ordinances" page for new housing-related laws

After each city's raw pulls land, run /fundamental-ingestion on the new files, then
fold distilled facts into HOF/housing.hof.scm.
