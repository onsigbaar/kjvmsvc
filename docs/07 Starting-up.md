```
minikube start -p kjvmsvc-spring-boot-cloud
```

```
kubectl config set-context $(kubectl config current-context) --namespace=kjvmsvc-app
```

```
minikube tunnel
```

```
kubectl wait --timeout=600s --for=condition=ready pod --all
```


**Internal Link**:

https://tracing.minikube.me/jaeger/search

https://elasticsearch.minikube.me/

https://kibana.minikube.me/

https://mail.minikube.me/#/

https://kiali.minikube.me/

https://grafana.minikube.me/

https://minikube.me/openapi/webjars/swagger-ui/index.html