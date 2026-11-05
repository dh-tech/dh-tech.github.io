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

### Creating a new post

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

Static files such as images, slides, PDFs should be added to the top-level `static/` folder;  post images are generally under `static/images/posts`. 

### Blog post PDFs & DOIs

Blog posts have support for DOI and PDF generation. For now, this is largely a manual process.

PDF generation requires [just][https://github.com/casey/just], [Pandoc](https://pandoc.org/), and a LaTeX
installation with the Eisvogel template's packages. Posts containing SVG images also require `rsvg-convert`
(`brew install librsvg` on macOS).
Build the site with `hugo` first, then run:

```sh
just pdf new-logo
```

Use a unique slug or portion of the source filename (full name not required). The PDF is written next to
the source post in `content/blog/`. The `tools/pdf-links.lua` filter resolves relative links
against the post URL on `https://dh-tech.github.io` and uses that production URL in
the publication credit, even for local Hugo builds. Images remain local; external
URLs and in-document anchors are unchanged.

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
