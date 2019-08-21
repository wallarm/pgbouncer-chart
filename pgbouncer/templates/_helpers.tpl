{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "pgbouncer.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "pgbouncer.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "pgbouncer.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create content for userlist.txt secret
*/}}
{{- define "pgbouncer.secret.userlist" }}
"{{ .Values.config.adminUser }}" "{{ required "A valid .Values.config.adminPassword entry required!" .Values.config.adminPassword }}"
{{- if .Values.config.authUser }}
"{{ .Values.config.authUser }}" "{{ required "A valid .Values.config.authPassword entry required!" .Values.config.authPassword }}"
{{- end }}
{{- range $key, $val := .Values.config.userlist }}
"{{ $key }}" "{{ $val }}"
{{- end }}
{{- end }}

{{/*
Constanta for define pgbouncer container port
*/}}
{{ define "pgbouncerContainerPort" }}5432{{ end }}
