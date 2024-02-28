Minikube is a tool that lets devops to run Kubernetes locally. minikube runs a single-node Kubernetes cluster on personal computer (including Windows, macOS and Linux PCs) so that dev can try out Kubernetes, or for daily development work.

```

# Unset the KUBECONFIG environment variable to ensure that the 
# kubectl context is created in the default config file,
# ~/.kube/config
unset KUBECONFIG

minikube start \
--profile=kjvmsvc-spring-boot-cloud \
--memory=5120 \
--cpus=4 \
--disk-size=30g \
--kubernetes-version=v1.26.1 \
--driver=docker \
--ports=8080:80 --ports=8443:443 \
--ports=30080:30080 --ports=30443:30443
```

Specify the Minikube profile to be used

```
minikube profile kjvmsvc-spring-boot-cloud
```

Add add-on in Minikube to enable an Ingress controller and a metrics server

```
minikube addons enable ingress

minikube addons enable metrics-server
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