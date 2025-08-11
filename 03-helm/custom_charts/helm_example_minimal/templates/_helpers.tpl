{{- define "environment" -}}
{{- $env := lower .Values.environment -}}
{{- if or (eq $env "development") (eq $env "dev") -}}
DEVELOPMENT
{{- else if or (eq $env "staging") (eq $env "stage") -}}
STAGING
{{- else if or (eq $env "testing") (eq $env "test") -}}
TESTING
{{- else if or (eq $env "qa") (eq $env "quality") -}}
QUALITY ASSURANCE
{{- else if or (eq $env "production") (eq $env "prod") -}}
PRODUCTION
{{- else -}}
UNKNOWN
{{- end -}}
{{- end -}}
