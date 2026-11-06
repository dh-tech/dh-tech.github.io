# DHTech website

This is the website for DHTech.

The site is implemented with [Hugo](https://gohugo.io/) and uses the [Hugo Clarity theme](https://github.com/chipzoller/hugo-clarity).

## Content management instructions

To have a page show up in the "featured posts" in the sidebar, simply
add `featured: true` to the page metadata.

## Hugo Setup instructions

### Hugo setup

To set the site up locally for development or content editing,
first follow the [instructions to install Hugo](https://gohugo.io/installation/).
You can check that Hugo is installed with:

```sh
hugo version
```

This should result in output something like this:

> hugo v0.110.0+extended darwin/amd64 BuildDate=unknown

The Clarity theme is currently installed as a [Hugo module](https://gohugo.io/hugo-modules/use-modules/) instead of a git submodule. Installing modules requires the Go language to be installed; we may instead want to use `hugo mod vendor` to write and check-in all modules into a local `_vendor` directory so that installing Go locally is not required for contributing to the site.

Update the git submodules:

```sh
git submodule update --init --recursive
```

To run the site locally for development:

```sh
hugo server
```

## Docker instructions

You can also run the site locally using Docker.

```sh
docker compose up
```

If you have a cached version of hugo and would like to run the site using a newer version, you can run:

```sh
docker compose pull
```

when you are done, either stop the process or run the following:

```sh
docker compose down
```

Docker will mount your current working directory inside the container, so changes you save to any files will be picked up by Hugo.

## Creating a new post

To create a new post on the command line, run:

```sh
hugo new -k post content/blog/YYYY-MM-DD-short-title.md
```

To auto-fill in YYYY-MM-DD for the current date, you can use

```sh
hugo new -k post content/blog/`date +'%Y-%m-%d`-short-title.md
```

The `short-title` or "slug" portion will be used for the URL, unless overridden
in page parameters. In general, slugs should be lowercase and use dashes (kebab case).

News and announcements should be created under `content/news` and blog posts should be created under `content/blog`.

Static files such as images, slides, PDFs should be added to the top-level `static/` folder; post images are generally under `static/images/posts`.

### PDF generation

PDF generation requires [just](https://github.com/casey/just), [Pandoc](https://pandoc.org/), and a LaTeX
installation with the Eisvogel template's packages. Posts containing SVG images also require `rsvg-convert`
(`brew install librsvg` on macOS).
Build the site with `hugo` first, then run:

```sh
just pdf new-logo
```

Use a unique slug or portion of the source filename (full name not required). The PDF is written next to
the source post in `content/blog/`. The `tools/pdf-links.lua` filter resolves relative links
against the post URL on `https://dh-tech.adho.org` and uses that production URL in
the publication credit, even for local Hugo builds. Images remain local; external
URLs and in-document anchors are unchanged.

#### How Markdown becomes a PDF

PDFs are generated from Hugo's Markdown output, not directly from the source post:

1. `hugo` builds both HTML and Markdown for pages, as configured in
   [`config/_default/config.toml`](config/_default/config.toml).
2. [`layouts/_default/single.md`](layouts/_default/single.md) creates
   `public/<post-url>/index.md`. It includes YAML metadata (title, author, URL,
   dates, and optional description, keywords, tags, and DOI), adds the feature
   image if configured, and renders the post content and shortcodes as Markdown.
3. The `pdf` recipe in [`.justfile`](.justfile) uses `hugo list all` to locate
   the matching blog post and its built Markdown. Pandoc converts that Markdown
   to PDF through LaTeX, using the custom template and link filter. Images are
   resolved from `static/`, code uses Pygments highlighting, and implicit figures
   are disabled so standalone images do not automatically become captioned figures.
4. The resulting PDF is saved beside the source Markdown with the same filename
   and a `.pdf` extension.

Run these commands from the repository root. Rebuild with `hugo` after changing
content or Markdown layouts; `just pdf` does not rebuild the site automatically.

The Markdown-specific [`figure` shortcode template](layouts/shortcodes/figure.md)
converts Hugo figure shortcodes to Markdown images for PDF generation. It uses
`alt` as the image text, prefixes root-relative image paths with `.` so they can
be resolved locally, and maps a `class` containing `small` to Pandoc's
`{width=35%}` image attribute. Other figure options, including captions, are not
currently included in this Markdown output.

TODO: Preserve figure captions in PDF output so image context is not lost;
consider italic text below images without introducing numbered figures.

#### Custom PDF template

[`tools/eisvogel-dhtech-2.latex`](tools/eisvogel-dhtech-2.latex) is the repository's
customized [Eisvogel](https://github.com/Wandmalfarbe/pandoc-latex-template) Pandoc
LaTeX template. The recipe uses this checked-in file explicitly; installing or
updating a global Eisvogel template will not change the generated PDFs.

The DHTech customizations include:

- A linked DHTech logo in the upper-right page margin.
- Running headers with the linked post title, optional linked DOI, and DHTech link;
  footers with author, date, and page number.
- The article title followed by the author and human-readable publication date.
- An “Originally published at” credit linking to the production post URL.
- PDF title metadata with a `DHTech` suffix.

Edit this template to change PDF typography, branding, headers, footers, or the
publication credit. Its `$variable$` and `$if(variable)$` expressions use Pandoc
template syntax, not Hugo syntax. Post metadata comes from the Markdown layout;
the recipe additionally supplies `logo`, and the Lua filter normalizes `url` to
the production site. Add new metadata fields to the Markdown layout if the PDF
template needs them; source front matter is not passed through automatically.

#### Logo and SVG images

SVG article images are converted by Pandoc,
without LaTeX shell escape or Inkscape. The header uses the preconverted grayscale vector
logo in `static/logos/dhtech-logo.pdf`; if the SVG logo changes, regenerate it:

```sh
rsvg-convert --format=pdf --output=static/logos/dhtech-logo-color.pdf static/logos/dhtech-logo.svg
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dBATCH -dNOPAUSE \
  -sColorConversionStrategy=Gray -dProcessColorModel=/DeviceGray \
  -sOutputFile=static/logos/dhtech-logo.pdf static/logos/dhtech-logo-color.pdf
```

Grayscale conversion requires Ghostscript (`brew install ghostscript` on macOS).
The intermediate `dhtech-logo-color.pdf` can be removed after conversion.

## DOIs

Publishing blog posts as PDFs with DOIs is a manual process for now.

First, [create a new record for submission to the DHTech Zenodo community](https://zenodo.org/uploads/new?community=dhtech). Reserve a DOI and fill in title, author, and link to the post on the DHTech site; save the record as a draft. Add the reserved DOI to the post metadata in this format:

```yaml
doi: 10.1/foo.abc123
```

Then build the site and generate the PDF as described above; the DOI will be included in the header of the PDF.

Review the PDF for any problems, then upload it to Zenodo and publish the record. If the author has an account on Zenodo, share it with them so they have access to edit if needed. Publish the record so the DOI will resolve, then publish an update to the site with the DOI included.

If desired, PDFs can be added to version control and linked in the post parameters.
