# prometheus-memcached-exporter-on-k8s

> **Warning**
>
> This repository is for demo purposes only and should be modified for production use.

## test locally

1. install kind cluster (https://kind.sigs.k8s.io/)

```sh
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install aaa bitnami/memcached
helm install bbb bitnami/memcached
```
2. install memcached using helm

> ** Please be patient while the chart is being deployed **
>
> Memcached can be accessed via port 11211 on the following DNS name from within your cluster:
>
>     aaa-memcached.default.svc.cluster.local

Check this

```sh
LATEST=$(curl -s https://api.github.com/repos/prometheus-operator/prometheus-operator/releases/latest | jq -cr .tag_name)
curl -sL https://github.com/prometheus-operator/prometheus-operator/releases/download/${LATEST}/bundle.yaml | kubectl create -f -
```
3. install prometheus CRDs and deploy operators into the `default` namespace (https://prometheus-operator.dev/docs/user-guides/getting-started/#installing-the-operator)

(Prometheus, ServiceMonitor CRDs are needed.)

4. install chart (check [helm-charts/README.md](./helm-chart/README.md))

5. (TODO) visualize TSDB with thanos OR check with prometheus service (debug only)


## examples

<img width="848" alt="memcached exporter metrics page" src="https://user-images.githubusercontent.com/11611397/232852501-c9ae1257-9f35-4f41-b1c0-e88f3686c7a2.png">

Memcached exporter metrics page (check with port-forward)

<img width="2560" alt="test2-min" src="https://user-images.githubusercontent.com/11611397/232852639-e76a8ec1-485b-42e1-8a0a-6ef8d11a0a2e.png">

> **Note**
>
> In order to prevent duplicated metric and make time-series with single tag,
> - remove all unrelated tags, other than your specific target tag
> - remove additional "prometheus", "prometheus_replica" tag with prometheus setting (check this [commit](https://github.com/sh-cho/prometheus-memcached-exporter-on-k8s/commit/f1c58949485da4050bf4005da30935aebefaeb72))

## Todos
- [ ] Apply the following repositores
  - [bitnami-labs/readme-generator-for-helm](https://github.com/bitnami-labs/readme-generator-for-helm)
  - [helm/chart-releaser](https://github.com/helm/chart-releaser)
- [ ] CI (lint, dry-run, etc..)
- [ ] Optional remote read/write
- [ ] Use proper tag names (or rewrite)
