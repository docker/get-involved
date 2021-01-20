{{/* Use this to insert the docs branch name. Get the directory path. */}}
{{- $pageSection := .Page.Section -}}
{{/* Set default to branch to latest release */}}
{{- $.Scratch.Set "release-branch" .Site.Params.latest_github_branch -}}
{{/* Use the manually specified override */}}
{{- if (.Get "override") -}}
  {{- $.Scratch.Set "release-branch" (.Get "override") -}}
{{- else -}}
{{/* Use branch based on the directory path (see .dirpath in config/_default/params.toml) */}}
  {{- range .Site.Params.versions -}}
    {{- if eq $pageSection .dirpath -}}
      {{- $.Scratch.Set "release-branch" .ghbranchname -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
{{- $.Scratch.Get "release-branch" -}}
