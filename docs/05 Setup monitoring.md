```
kubectl -n istio-system create deployment mail-server --image maildev/maildev:2.0.5

kubectl -n istio-system expose deployment mail-server --port=1080,1025 --type=ClusterIP

kubectl -n istio-system wait --timeout=60s --for=condition=ready pod -l app=mail-server
```

```
helm upgrade istio-kjvmsvc-app-addons kubernetes/helm/environments/istio-system -n istio-system
```

```
kubectl -n istio-system set env deployment/grafana \
GF_ALERTING_ENABLED=true \
GF_UNIFIED_ALERTING_ENABLED=false \
GF_SMTP_ENABLED=true \
GF_SMTP_SKIP_VERIFY=true \
GF_SMTP_HOST=mail-server:1025 \
GF_SMTP_FROM_ADDRESS=grafana@minikube.me

kubectl -n istio-system wait --timeout=60s --for=condition=ready pod -l app=grafana
```