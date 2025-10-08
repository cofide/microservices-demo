{{/*
Istio injection label
*/}}
{{- define "onlineboutique.istio.injectLabel" -}}
{{- if .Values.istio.enable }}
sidecar.istio.io/inject: "true"
{{- end }}
{{- end -}}

{{/*
Istio metadata annotations
*/}}
{{- define "onlineboutique.istio.annotations" -}}
{{- if .Values.istio.enable }}
proxy.istio.io/config: |
  proxyMetadata:
    ISTIO_META_DNS_CAPTURE: "true"
    ISTIO_META_DNS_AUTO_ALLOCATE: "true"
{{- if .Values.istio.spire.enable }}
inject.istio.io/templates: "sidecar,spire"
{{- else }}
inject.istio.io/templates: "sidecar"
{{- end }}
{{- end }}
{{- end -}}
