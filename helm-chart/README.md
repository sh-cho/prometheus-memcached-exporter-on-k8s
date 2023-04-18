## helm-chart

Prometheus memcached exporter helm chart

Provide value file with memcached list (host, port needed)

### Dev guide
```sh
helm template --debug memcached-exporter . --values values.yaml
```
Render chart template locally

```sh
helm install -f values.yaml [test-chart-name] . -n [test-namespace] --dry-run
```
Dry-run before install

### How to use this chart
```yaml
# example
---
memcachedList:
- host: "memcached1.abc.cache.amazonaws.com"
  port: 11211
- host: "memcached2.abc.cache.amazonaws.com"
  port: 11211
```

#### Install
```sh
helm install -f myvalues.yaml -n prometheus-exporter --create-namespace memcached-exporter .
```

#### Upgrade
```sh
helm upgrade -f myvalues.yaml -n prometheus-exporter memcached-exporter .
```
Upgrade when memcached list needs to be updated

#### Delete
```sh
helm uninstall memcached-exporter -n prometheus-exporter
```
