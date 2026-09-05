import type { Config } from 'tailwindcss';

const config: Config = {
  content: [
    './src/pages/**/*.{js,ts,jsx,tsx,mdx}',
    './src/components/**/*.{js,ts,jsx,tsx,mdx}',
    './src/app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        brick: {
          50: '#fdf5f3',
          100: '#fbe7e1',
          500: '#b0442c',
          600: '#943823',
          700: '#782c1b',
        },
      },
    },
  },
  plugins: [],
};
export default config;
