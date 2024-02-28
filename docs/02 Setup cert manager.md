```
helm repo add jetstack https://charts.jetstack.io

helm repo update
```

```
helm install cert-manager jetstack/cert-manager \
--create-namespace \
--namespace cert-manager \
--version v1.11.0 \
--set installCRDs=true \
--wait
```

```
kubectl get pods --namespace cert-manager

MINIKUBE_HOSTS="minikube.me grafana.minikube.me kiali.minikube.me prometheus.minikube.me tracing.minikube.me kibana.minikube.me elasticsearch.minikube.me mail.minikube.me health.minikube.me"

echo 127.0.0.1 $MINIKUBE_HOSTS" | sudo tee -a /etc/hosts

127.0.0.1  minikube.me grafana.minikube.me kiali.minikube.me prometheus.minikube.me tracing.minikube.me kibana.minikube.me elasticsearch.minikube.me mail.minikube.me health.minikube.me

cat /etc/hosts
```