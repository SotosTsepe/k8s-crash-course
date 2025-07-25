# Common `kubectl` Commands

#### `kubectl` command structure:

```bash
kubectl <VERB> <NOUN> -n <NAMESPACE> -o <FORMAT>
```

---

#### Checking logs:

```bash
kubectl logs <POD_NAME>
kubectl logs deployment/<DEPLOYMENT_NAME>
```

---

#### List pods:

```bash
kubectl get pods -n <NAMESPACE>
kubectl get pods -A # (--all-namespaces)
kubectl get pods -l <KEY>=<VALUE>
```

---

#### Execute commands or debug containers:

```bash
kubectl exec -it <POD_NAME> -c <CONTAINER_NAME> -- bash
kubectl debug -it <POD_NAME> --image=<DEBUG_IMAGE> -- bash
```

---

#### Forward one or more local ports to a pod:

```bash
kubectl port-forward <POD_NAME> <LOCAL_PORT>:<POD_PORT>
kubectl port-forward svc/<DEPLOYMENT_NAME> <LOCAL_PORT>:<POD_PORT>
```

---

#### Describe fields and structure of various resources:

```bash
kubectl explain <NOUN>.path.to.field
```

Examples:

```bash
kubectl explain namespace.metadata
kubectl explain pod.spec.containers.image
```

<br><br>

# Commands used in this section

#### Create a namespace in the cluster:

```bash
kubectl create namespace <NAMESPACE>
```

From tasks:

```bash
task 01-create-namespace
```

---

#### Apply a configuration to a resource

```bash
kubectl apply -f <CONFIG_FILE.yaml>
```

Examples:

```bash
kubectl apply -f pod.namespace.yaml     # Create a namespace for our pods.
kubectl apply -f pod.nginx.minimal.yaml # Create a pod with a minimal NGINX config.
kubectl apply -f pod.nginx.yaml         # Create a pod with a proper NGINX config.
```

From tasks:

```bash
task 02-apply-namespace
task 03-apply-minimal-pod-config
task 05-apply-better-pod-config
```

---

#### Get all namespaces:

```bash
kubectl get namespaces
```

---

#### Get pods from namespace:

```bash
kubectl get pods                     # Get pods from the active namespace.
kubectl get pods -n <NAMESPACE> pods # Get pods from the given namespace.
```

Example:
```bash
kubectl get pods -n 02--pod
```

---


#### ReplicaSet:

Apply the replicaSets defined in the configuration files:

```bash
kubectl apply -f 2-replicaSet-nginx-minimal.yaml # Minimal replicaSet.
kubectl apply -f 2-replicaSet-nginx.yaml         # replicaSet with unprivileged user (more secure).
```

Get replicaSets:
```bash
kubectl get replicasets
```

**Bonus**: Delete a pod and observe how it automatically spins up again to match the number of replicas defined.
```bash
kubectl delete pod <POD_NAME>
kubectl get pods
```

---

#### Deployments:

Apply the deployments defined in the configuration files:
```bash
kubectl apply -f 3-deployment-nginx-minimal.yaml # Minimal deployment.
kubectl apply -f 3-deployment-nginx.yaml         # Deployment with unprivileged user (more secure).
```

Get deployments:
```bash
kubectl get deployments
kubectl get deployments.apps
```

---

#### Rollouts:

Manage rollouts:
```bash
kubectl rollout restart deployment <DEPLOYMENT_NAME> # Apply the restart.
kubectl rollout status deployment <DEPLOYMENT_NAME>  # Check the deployment status.
kubectl rollout undo deployment <DEPLOYMENT_NAME>    # Undo the deployment (if needed).
```

Examples:
```bash
kubectl rollout restart deployment nginx
kubectl get deployments.apps
kubectl rollout status deployment nginx
kubectl rollout undo deployment nginx
```

---

#### Services:

Types:
- ClusterIP: Internal to cluster.
- NodePort: Listens on each node in cluster.
- LoadBalancer: Provisions external load balancer.


Get Services:
```bash
kubectl get svc
```

Examples:
```bash

```

---

#### Delete namespace(s) (for cleanup):

```bash
kubectl delete namespace <NAMESPACE>
kubectl delete -f <file>
```

From tasks:

```bash
task 07-delete-namespaces
```

