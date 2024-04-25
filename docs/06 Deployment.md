```
minikube start -p kjvmsvc-spring-boot-cloud
```

## Dev env

```
cd app
eval $(minikube docker-env -u)
./gradlew build
eval $(minikube docker-env)
docker-compose build
```

First, we update the dependencies in the components folder:
```
for f in kubernetes/helm/components/*; do helm dep up $f; done
```

Next, we update the dependencies in the environments folder:
```
for f in kubernetes/helm/environments/*; do helm dep up $f; done
```

Verify the dependencies for the dev-env folder:
```
helm dep ls kubernetes/helm/environments/dev-env/
```

```
# Execute only once
eval $(minikube docker-env)
docker pull mysql:8.0.32
docker pull mongo:6.0.4
docker pull rabbitmq:3.11.8-management
docker pull openzipkin/zipkin:2.24.0
docker pull docker.elastic.co/elasticsearch/elasticsearch:7.17.10
docker pull docker.elastic.co/kibana/kibana:7.17.10
```

```
helm install kjvmsvc-app-dev-env \
kubernetes/helm/environments/dev-env \
-n kjvmsvc-app \
--create-namespace
```

```
kubectl config set-context $(kubectl config current-context) --namespace=kjvmsvc-app
```

```
kubectl wait --timeout=600s --for=condition=ready pod --all
```

```
kubectl get pods -o json | jq .items[].spec.containers[].image
```

```
PORT=30443 USE_K8S=true ./test-kjvmsvc-app.bash
```

```
kubectl delete namespace kjvmsvc-app
```

## Prod environment

```
eval $(minikube docker-env)
docker-compose up -d mongodb mysql rabbitmq
```

```
docker tag kjvmsvc-app/auth-server kjvmsvc-app/auth-server:v1
docker tag kjvmsvc-app/config-server kjvmsvc-app/config-server:v1
docker tag kjvmsvc-app/gateway kjvmsvc-app/gateway:v1
docker tag kjvmsvc-app/book-outlet-service kjvmsvc-app/book-outlet-service:v1
docker tag kjvmsvc-app/book-service kjvmsvc-app/book-service:v1
docker tag kjvmsvc-app/recommendation-service kjvmsvc-app/recommendation-service:v1
docker tag kjvmsvc-app/review-service kjvmsvc-app/review-service:v1
```

```
helm install kjvmsvc-app-prod-env kubernetes/helm/environments/prod-env -n kjvmsvc-app --create-namespace
```

```
kubectl wait --timeout=600s --for=condition=ready pod --all
```

```
kubectl get pods -o json | jq .items[].spec.containers[].image
```

```
CONFIG_SERVER_USR=prod-usr \
CONFIG_SERVER_PWD=prod-pwd \
PORT=30443 USE_K8S=true ./test-kjvmsvc-app.bash
```

```
kubectl delete namespace kjvmsvc-app
```

## Create service base code skeleton example

```
mkdir microservices
cd microservices
```

```
spring init \
--boot-version=3.0.4 \
--type=gradle-project \
--java-version=17 \
--packaging=jar \
--name=application-service \
--package-name=sc.app.microservices.core.application \
--groupId=sc.app.microservices.core.application \
--dependencies=actuator,webflux \
--version=1.0.0-SNAPSHOT \
application-service
```