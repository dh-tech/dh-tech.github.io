{{- $src := .Get "src" -}}
{{- $src_prefix := cond (hasPrefix $src "/") "." "" -}}
{{- $alt := .Get "alt" -}}
{{- $classes := .Get "class" -}}
{{- $display_opts := cond (in $classes "small") "{width=35%}" "" -}}
{{- printf "![%s](%s%s)%s" $alt $src_prefix $src $display_opts -}}