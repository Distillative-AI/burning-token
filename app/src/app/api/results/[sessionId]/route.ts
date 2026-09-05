import { NextRequest, NextResponse } from 'next/server';
import { findCityBySlug } from '@/lib/cities';
import { loadPipelineResultFromSession } from '@/lib/pipeline';
import { getSearchesBySession } from '@/lib/db';

export async function GET(req: NextRequest, { params }: { params: { sessionId: string } }) {
  const { sessionId } = params;
  const searches = await getSearchesBySession(sessionId);
  if (searches.length === 0) {
    return NextResponse.json({ error: 'No such search session.' }, { status: 404 });
  }
  const jurisdictionSlug = searches[0].jurisdiction;
  const city = findCityBySlug(jurisdictionSlug);
  if (!city) {
    return NextResponse.json({ error: 'Unknown jurisdiction on record for this session.' }, { status: 500 });
  }
  const result = await loadPipelineResultFromSession(sessionId, city);
  return NextResponse.json(result);
}
