# custom-metrics-sample

## Deploy

```
# Create k8s Cluster
make create

# Install Prometheus Stack
make install-prometheus-stack

# Build metrics app
make build-metrics-app

# Load to k8s
make load-metrics-app

# Create metrics app deployment
make apply-metrics-app
```

## test

```
make port-forward-metrics-app
```

```
make port-forward-prometheus
```

## Prometheus
![alt text](image-1.png)

![alt text](image.png)