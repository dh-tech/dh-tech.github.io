# DHTech PDF Generation

## Requirements

- [pandoc](https://pandoc.org/)
- A LaTeX distribution (e.g. [TeX Live](https://tug.org/texlive/) or [MiKTeX](https://miktex.org/))

## Files

- `dhtech-template.latex` — pandoc LaTeX template
- `images.lua` — Lua filter for image handling

## Front matter

Your markdown file needs the following YAML front matter:

```yaml
---
title: "Your Post Title"
author:
  - "Author Name"
date: "2024-03-15"
doi: "10.12345/dhtech.001"
---
```

## Usage

Run from the root of the Hugo site:

```bash
pandoc content/posts/your-post.md \
  --template dhtech-template.latex \
  --lua-filter images.lua \
  --resource-path=./static \
  --pdf-engine=xelatex \
  -o your-post.pdf
```

## Notes

- `--resource-path=./static` is required so pandoc can find images stored in Hugo's `static/` folder
- The Lua filter strips leading `/` from image paths and centres images in the output
- The `doi` field is displayed in the header block, body, and footer of the PDF
