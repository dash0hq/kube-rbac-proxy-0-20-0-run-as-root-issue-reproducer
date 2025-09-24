{{/* chart name without version */}}
{{- define "reproducer.chartName" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* service account name */}}
{{- define "reproducer.serviceAccountName" -}}
{{- printf "%s-service-account" (include "reproducer.chartName" .) }}
{{- end }}

{{- define "reproducer.kubeRbacProxyImage" -}}
{{- printf "%s:%s" .Values.reproducer.kubeRbacProxyImage.repository .Values.reproducer.kubeRbacProxyImage.tag }}
{{- end }}

