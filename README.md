# CNPE practice

This is a practice repository for the Certified Cloud Native Platform Engineering Engineer (CNPE) exam.

## Trivy

We only check our applications manifests with trivy.

## Argo

Get the Argo CD server password via

```sh
kubectl -n argocd get secret argocd-initial-admin-secret \
    -o jsonpath="{.data.password}" | base64 -d; echo
```
