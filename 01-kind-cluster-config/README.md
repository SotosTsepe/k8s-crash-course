# Commands used

#### Create the cluster with the config:
```bash
kind create cluster --config kind-config.yaml
```

---

#### Get running clusters:

```bash
kind get clusters
```

---

#### Cluster information:

```bash
kubectl cluster-info --context kind-kind
```

---

#### List images on a cluster node:

```bash
docker exec -it <node_name> crictl images
```

Example:

```bash
docker exec -it kind-control-plane crictl images
```

---

#### Delete cluster:

```bash
kind delete cluster
```
