apiVersion: v1
kind: Pod
metadata:
  name: goodmorning-tester
  annotations:
    "helm.sh/hook": test
spec:
  containers:
    - name: wget
      image: busybox:1.38
      resources:
        requests:
          cpu: 10m
          memory: 10Mi
        limits:
          cpu: 100m
          memory: 100Mi
      command:
        - wget
      args:
        - goodmorning:{{ .Values.service.port }}
      securityContext:
        runAsUser: 65534 # nobody
        runAsGroup: 65534 # nobody
        allowPrivilegeEscalation: false
        readOnlyRootFilesystem: true
        capabilities:
          drop:
            - ALL

  restartPolicy: Never
  securityContext:
    runAsNonRoot: true
    seccompProfile:
      type: RuntimeDefault
