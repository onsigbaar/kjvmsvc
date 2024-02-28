```
helm install logging-kjvmsvc-app-add-on kubernetes/helm/environments/logging -n logging --create-namespace --wait
```

```
curl https://elasticsearch.minikube.me -sk | jq -r .tagline
```

```
curl https://kibana.minikube.me \
-kLs -o /dev/null -w "%{http_code}\n"
```

```
eval $(minikube docker-env)
docker build -f kubernetes/efk/Dockerfile -t kjvmsvc-app/fluentd:v1 kubernetes/efk/

kubectl apply -f kubernetes/efk/fluentd-kjvmsvc-app-configmap.yml

kubectl apply -f kubernetes/efk/fluentd-ds.yml

kubectl wait --timeout=120s --for=condition=Ready pod -l app=fluentd -n kube-system

kubectl logs -n kube-system -l app=fluentd --tail=-1 | grep "fluentd worker is now running worker"

curl https://elasticsearch.minikube.me/_all/_count -sk | jq .count
```