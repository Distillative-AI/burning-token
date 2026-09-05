// The 14 San Mateo County jurisdictions this app covers, keyed to their
// HOF/sources/<slug>/ directory names (see /home/orca/git/hackathons/housing/HOF/sources/).
//
// NOTE: HOF/sources/ actually contains more than 14 directories today (it grew to
// include unincorporated-county plus every city). We keep the full list here so the
// UI and cache reader stay in sync with what's on disk; the "14 cities" framing in
// the product brief refers to the incorporated cities plus the unincorporated county.

export type CitySlug =
  | 'menlo-park'
  | 'san-mateo'
  | 'redwood-city'
  | 'pacifica'
  | 'daly-city'
  | 'south-san-francisco'
  | 'unincorporated-county'
  | 'east-palo-alto'
  | 'brisbane'
  | 'half-moon-bay'
  | 'san-bruno'
  | 'belmont'
  | 'colma'
  | 'portola-valley'
  | 'hillsborough'
  | 'foster-city'
  | 'san-carlos'
  | 'atherton'
  | 'millbrae'
  | 'burlingame'
  | 'woodside';

export interface City {
  slug: CitySlug;
  name: string;
}

export const CITIES: City[] = [
  { slug: 'menlo-park', name: 'Menlo Park' },
  { slug: 'san-mateo', name: 'San Mateo' },
  { slug: 'redwood-city', name: 'Redwood City' },
  { slug: 'pacifica', name: 'Pacifica' },
  { slug: 'daly-city', name: 'Daly City' },
  { slug: 'south-san-francisco', name: 'South San Francisco' },
  { slug: 'unincorporated-county', name: 'Unincorporated San Mateo County' },
  { slug: 'east-palo-alto', name: 'East Palo Alto' },
  { slug: 'brisbane', name: 'Brisbane' },
  { slug: 'half-moon-bay', name: 'Half Moon Bay' },
  { slug: 'san-bruno', name: 'San Bruno' },
  { slug: 'belmont', name: 'Belmont' },
  { slug: 'colma', name: 'Colma' },
  { slug: 'portola-valley', name: 'Portola Valley' },
  { slug: 'hillsborough', name: 'Hillsborough' },
  { slug: 'foster-city', name: 'Foster City' },
  { slug: 'san-carlos', name: 'San Carlos' },
  { slug: 'atherton', name: 'Atherton' },
  { slug: 'millbrae', name: 'Millbrae' },
  { slug: 'burlingame', name: 'Burlingame' },
  { slug: 'woodside', name: 'Woodside' },
];

export function findCityBySlug(slug: string): City | undefined {
  return CITIES.find((c) => c.slug === slug);
}

// Best-effort address -> jurisdiction guess for the free-text entry box.
// This is intentionally simple (substring match on city name); it is NOT a
// geocoder. If nothing matches we fall back to letting the user pick from the list.
export function guessCityFromAddress(address: string): City | undefined {
  const normalized = address.toLowerCase();
  return CITIES.find((c) => normalized.includes(c.name.toLowerCase()))
    ?? CITIES.find((c) => normalized.includes(c.slug.replace(/-/g, ' ')));
}
