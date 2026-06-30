# CNPE practice

This is a practice repository for the Certified Cloud Native Platform Engineering Engineer (CNPE) exam.

## TODO

## Getting started

Use `task build` to build everything. The apply the crd-local manifest to your local cluster via

```sh
kubectl apply --server-side -f dist/kubernetes-crd-local.yaml
```

Now you have a cluster with quite a few CNPE resources installed and configured!

## Linkerd

Keys are generated and put in the `values.yaml` file, this is of course a very dirty and dangerous thing that should never be allowed, except maybe for the playground that this repository is.

See how hello-client is able to connect to the hello server. Use the following to verify that you are not:

```
kubectl run -ti --rm --image alpine bad-hello-client --namespace hello -- wget -qO- http://hello.hello:8080
```

But this will work:

```
kubectl run -ti --rm --image alpine good-hello-client --namespace hello-client -- wget -qO- http://hello.hello:8080
```

## Istio

TODO

## Open Tofu

TODO

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

Checkout the playground for some fun examples.

## Flux

TODO

## Argo Rollouts

Expose Argo CD UI via

```sh
kubectl port-forward -n argo-rollouts services/argo-rollouts-dashboard 3100:3100
```

Go to [localhost:3100](http://localhost:3100).

## Flagger

TODO

## Argo Workflows

Expose Argo CD UI via

```sh
kubectl port-forward -n argo services/argo-server 2746:2746
```

Go to [localhost:2746](http://localhost:2746).

## Tekton

TODO

## Trivy

We only check our applications manifests with trivy.

## Kyverno

TODO

## OPA Gatekeeper

TODO

## Prometheus

TODO

## Grafana

TODO

## Jaeger

TODO

## Open Cost

TODO

## Crossplane

There is the greeter CRDs that provide the Greeter kind that demonstrates usage of Crossplane composition. Install it via the `kubernetes-greeter-local.yaml` manifest and then play around with it in the playground.
