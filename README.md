# CNPE practice

This is a practice repository for the Certified Cloud Native Platform Engineering Engineer (CNPE) exam.

## Getting started

Use `task build` to build everything. The apply the crd-local manifest to your local cluster via

```sh
kubectl apply --server-side -f dist/kubernetes-crd-local.yaml
```

Now you have a cluster with quite a few CNPE resources installed and configured!

## Trivy

We only check our applications manifests with trivy.

## Argo CD

Get the Argo CD UI admin password via

```sh
kubectl -n argocd get secret argocd-initial-admin-secret \
    -o jsonpath="{.data.password}" | base64 -d; echo
```

Expose Argo CD UI via

```sh
kubectl port-forward -n argocd  services/argocd-server 8080:80
```

Go to [localhost:8080](http://localhost:8080) and ignore the https warnings and login with `admin` and the password you retrieved earlier.

Create an application and point it to the `hello` application in this repository and have some fun with that!

## Argo Rollouts

Expose Argo CD UI via

```sh
kubectl port-forward -n argo-rollouts services/argo-rollouts-dashboard 3100:3100
```

Go to [localhost:3100](http://localhost:3100).

## Argo Workflows

Expose Argo CD UI via

```sh
kubectl port-forward -n argo services/argo-server 2746:2746
```

Go to [localhost:2746](http://localhost:2746).
