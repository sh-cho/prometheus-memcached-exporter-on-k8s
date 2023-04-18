# prometheus-memcached-exporter-on-k8s

(WIP)

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

4. install chart (check [readme](./helm-chart/README.md))

5. (TODO) visualize TSDB with thanos OR check with prometheus service (debug only)
