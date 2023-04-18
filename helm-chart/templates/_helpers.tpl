{{/*
Expand the name of the chart.
*/}}
{{- define "prometheus-memcached-exporter.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "prometheus-memcached-exporter.short-name" -}}
exporter
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "prometheus-memcached-exporter.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "prometheus-memcached-exporter.labels" -}}
helm.sh/chart: {{ include "prometheus-memcached-exporter.chart" . }}
{{ include "prometheus-memcached-exporter.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
prometheus-exporter/target: "memcached"
{{- end }}

{{/*
Selector labels
*/}}
{{- define "prometheus-memcached-exporter.selectorLabels" -}}
app.kubernetes.io/name: {{ include "prometheus-memcached-exporter.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
