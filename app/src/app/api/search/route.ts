import { NextRequest, NextResponse } from 'next/server';
import { findCityBySlug, guessCityFromAddress, CITIES } from '@/lib/cities';
import { runEligibilityPipeline } from '@/lib/pipeline';

export const dynamic = 'force-dynamic';

export async function POST(req: NextRequest) {
  const body = await req.json().catch(() => ({}));
  const { jurisdictionSlug, address } = body as { jurisdictionSlug?: string; address?: string };

  let city = jurisdictionSlug ? findCityBySlug(jurisdictionSlug) : undefined;
  if (!city && address) city = guessCityFromAddress(address);

  if (!city) {
    return NextResponse.json(
      {
        error:
          'Could not determine a San Mateo County jurisdiction from the input. Pick one of the 14 cities explicitly.',
        availableJurisdictions: CITIES,
      },
      { status: 400 }
    );
  }

  const result = await runEligibilityPipeline(city);
  return NextResponse.json(result);
}
