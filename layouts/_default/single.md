---
title: {{ .Title }}
author: {{ .Params.Author }}
url: "{{ .Permalink }}"
{{- with .Description }}
description: {{ . }}
{{- end }}
{{- with .Date }}
date: {{ .Format "2006-01-02" }}
{{- end }}
{{- with .Params.keywords }}
keywords: {{ delimit . ", " }}
{{- end }}
{{- with .Params.tags }}
tags: {{ delimit . ", " }}
{{- end }}
---

# {{ .Title }}

{{ $parts := split .RawContent "\n\n" -}}
{{ range $parts }}
{{ $text := strings.TrimSpace .}}
{{ if hasPrefix $text "{{<" -}}
{{- . | $.Page.RenderString }}
{{- else -}}
{{- . | $.Page.RenderString | transform.HTMLToMarkdown -}}
{{ end }}
{{ end }}