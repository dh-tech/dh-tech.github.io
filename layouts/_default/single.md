---
title: {{ .Title }}
author: "{{ .Params.Author }}"
url: "{{ .Permalink }}"
{{- with .Description }}
description: {{ . }}
{{- end }}
{{- with .Date }}
date: {{ .Format "2006-01-02" }}
readable_date: {{ .Format "January 2, 2006" }}
{{- end }}
{{- with .Params.keywords }}
keywords: {{ delimit . ", " }}
{{- end }}
{{- with .Params.tags }}
tags: {{ delimit . ", " }}
{{- end }}
{{- with .Params.doi }}
doi: "{{ . }}"
{{- end }}
---

{{ with .Params.featureImage -}}
{{- $src_prefix := cond (hasPrefix . "/") "." "" -}}
{{ printf "![%s](%s%s)" (or $.Params.featureImageAlt "") $src_prefix . }}
{{- end -}}

{{ $parts := split .RawContent "\n\n" -}}
{{ range $parts }}
{{ $text := strings.TrimSpace .}}
{{ if hasPrefix $text "{{<" -}}
{{- . | $.Page.RenderString }}
{{- else -}}
{{- . | $.Page.RenderString | transform.HTMLToMarkdown -}}
{{ end }}
{{ end }}