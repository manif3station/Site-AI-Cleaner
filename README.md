# AI Text Cleaner

AI Text Cleaner is a browser-only text cleanup tool served as a static site from this directory.

## What This Site Does

The page lets a user paste text into the input area, run browser-side cleanup rules, and copy the cleaned result without any backend processing. The active logic lives in `index.html` and normalizes pasted-text artifacts such as smart punctuation, spacing around em dashes, hidden Unicode characters, bullet variants, and `:contentReference[...]` leftovers.

## Active Runtime

- `index.html`: the active HTML, CSS, and JavaScript for the site
- `Dockerfile`: Nginx image build for static serving
- `compose.yml`: local runtime entrypoint with service `web` on container port `80` and host port `8432`
- `robots.txt`, `sitemap.xml`, `og-preview.svg`: static SEO and sharing assets

Legacy Python and Streamlit files are preserved under `.OLD/` and are not part of the active runtime.

## Release Metadata

The site release state is tracked in:

- `.env`: the active version plus deploy-required environment values
- `Changes`: versioned release notes
- `index.html`: hidden head version marker in the form `<!-- version: x.y.z -->`

These files must stay in sync for each released version.

## Local Verification

Typical local runtime:

```bash
docker compose up -d --build
```

Standard verification for this site includes:

- runtime check on `http://127.0.0.1:8432/`
- SEO artifact checks
- Playwright desktop browser checks
- Playwright mobile browser checks
- `100%` significant-range execution coverage for the inline app script
- git release gate with commit, tag, and push

## Operational Note

AI Text Cleaner is currently live at `https://clean.michaelpc.com`. The active app is a single HTML file, so `index.html` can also be downloaded and opened locally and it will still work. The application runs entirely in the browser and does not need a backend.
