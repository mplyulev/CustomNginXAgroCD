{{/* vim: set filetype=mustache: */}}

{{/*
Namespace.
*/}}
{{- define "nebula.namespace" -}}
{{- default .Release.Namespace .Values.custom.namespace -}}
{{- end -}}

{{/*
Chart name and version
*/}}
{{- define "appchart.fullname" -}}
nebula-lobby-{{ .Chart.Version | replace "+" "_" }}
{{- end -}}

{{/*
Expand the name of the app.
*/}}
{{- define "nebula.name" -}}
{{- default .Release.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
App Label Value
*/}}
{{- define "nebula.appLabelValue" -}}
{{- if .Values.custom.appLabelName -}}
{{ .Values.custom.appLabelName  }}
{{- else -}}
{{ include "nebula.name" . }}
{{- end }}
{{- end }}

{{/*
App Label Name
*/}}
{{- define "nebula.appLabelName" -}}
app: {{ include "nebula.appLabelValue" . }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "nebula.labels" -}}
{{ include "nebula.appLabelName" . }}
app.kubernetes.io/product: {{ include "nebula.name" . }}
app.kubernetes.io/channel: {{ .Values.global.clusterName }}
app.kubernetes.io/version: {{ .Values.image.tag  | quote }}
helm.sh/chart: {{ include "appchart.fullname" . }}
{{- if .Values.commonLabels }}
{{ toYaml .Values.commonLabels -}}
{{- end }}
{{- end }}