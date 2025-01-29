
create:
	./bin/kind-with-registry.sh

delete:
	kind delete cluster

install-prometheus-stack:
	helm install prometheus prometheus-community/kube-prometheus-stack -n prometheus --create-namespace

build-metrics-app:
	docker build -t prometheus-metrics-app:1.0 .

load-metrics-app:
	docker tag prometheus-metrics-app:1.0 localhost:5001/prometheus-metrics-app:1.0
	docker push localhost:5001/prometheus-metrics-app:1.0

apply-metrics-app:
	kubectl apply -f metrics-app-deployment.yaml

port-forward-prometheus:
	kubectl port-forward -n prometheus svc/prometheus-kube-prometheus-prometheus 9090:9090

port-forward-metrics-app:
	kubectl port-forward -n prometheus svc/prometheus-kube-prometheus-prometheus 9090:9090
