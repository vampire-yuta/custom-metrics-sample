
create:
	./bin/kind-with-registry.sh

delete:
	kind delete cluster

build:
	docker build -t prometheus-metrics-app:1.0 .

load:
	docker tag prometheus-metrics-app:1.0 localhost:5001/prometheus-metrics-app:1.0
	docker push localhost:5001/prometheus-metrics-app:1.0


apply:
	kubectl apply -f metrics-app-deployment.yaml

install-prometheus-stack:
	helm install prometheus prometheus-community/kube-prometheus-stack -n prometheus --create-namespace

port-forward:
	kubectl port-forward -n prometheus svc/prometheus-kube-prometheus-prometheus 9090:9090
