{{- $image := .Get "image" -}}
{{- $prefix := cond (hasPrefix $image "/") "." "" -}}
{{ printf "![%s](%s%s)" (.Get "title") $prefix $image }}

{{ printf "[Explore the interactive notebook](%s)." (.Get "url") }}
