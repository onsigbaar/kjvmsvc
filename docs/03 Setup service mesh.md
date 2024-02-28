```
istioctl install --skip-confirmation \
--set profile=istod \
--set meshConfig.accessLogFile=/dev/stdout \
--set meshConfig.accessLogEncoding=JSON \
--set values.pilot.env.PILOT_JWT_PUB_KEY_REFRESH_INTERVAL=15s \
-f kubernetes/istio-tracing.yml
```

```
kubectl -n istio-system wait --timeout=600s --for=condition=available deployment --all
```

```
istio_version=$(istioctl version --short --remote=false)
```

```
kubectl apply -n istio-system -f https://raw.githubusercontent.com/istio/istio/${istio_version}/samples/addons/kiali.yaml

kubectl apply -n istio-system -f https://raw.githubusercontent.com/istio/istio/${istio_version}/samples/addons/jaeger.yaml

kubectl apply -n istio-system -f https://raw.githubusercontent.com/istio/istio/${istio_version}/samples/addons/prometheus.yaml

kubectl apply -n istio-system -f https://raw.githubusercontent.com/istio/istio/${istio_version}/samples/addons/grafana.yaml
```

```
kubectl -n istio-system wait --timeout=600s --for=condition=available deployment --all
```

```
kubectl -n istio-system get deploy
```

```
helm upgrade --install istio-kjvmsvc-app-addons kubernetes/helm/environments/istio-system -n istio-system --wait
```

```
kubectl -n istio-system get secret kjvmsvc-app-certificate
```

```
kubectl -n istio-system get certificate kjvmsvc-app-certificate
```

```
minikube tunnel
```

```
INGRESS_IP=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

echo $INGRESS_IP
```

```
curl -o /dev/null -sk -L -w "%{http_code}\n" https://kiali.minikube.me/kiali/

curl -o /dev/null -sk -L -w "%{http_code}\n" https://tracing.minikube.me

curl -o /dev/null -sk -L -w "%{http_code}\n" https://grafana.minikube.me

curl -o /dev/null -sk -L -w "%{http_code}\n" https://prometheus.minikube.me/graph#/
```