# Introduction

This is a sample project that is created as part of my exploration into how Kubernetes works. I've purposely chosen not to use the helper k8s application known as minikube to make this functional. Since minikube does not get used in multi-node deployments of kubernetes, I wanted to make sure I understood and documented the approaches that would allow for a web service to be deployable regardless of the number of cluster nodes. It's my hope that this project can be helpful to anyone looking for a simple and similar example.

# Credits & Sources

## People

[Jeff Geerling](https://www.jeffgeerling.com/)

[TechWorld with Nana](https://www.youtube.com/watch?v=X48VuDVv0do&t=8011s)

## Documentation

[ingres-nginx bare-metal considerations](https://kubernetes.github.io/ingress-nginx/deploy/baremetal/)

# Project scripts

Configure kubernetes to run mongodb and mongo-express as a sample orchestration.

## Setup

```shell
./setup.sh
```

## Teardown

```shell
./teardown.sh
```

# DNS Setup

Add these lines to your /etc/hosts file (unix)

```ini
127.0.0.1       mongo-express.here
127.0.0.1       hello-go.here
```

# Using Kubernetes 

## Deployments

### Create deployment

```shell
kubectl create deployment [name]
```

### Edit deployment

```shell
kubectl edit deployment [name]
```

### Delete deployment

```shell
kubectl delete deployment [name]
```

## Status Commands

```shell
kubectl get nodes|pods|services|replicaset|deployment|all
```

## Describe Pod

```shell
kubectl describe pod [pod name] 
```

## Check logs / Debugging

```shell
kubectl logs [pod name]
```

## Configuration Files

### Anatomy

Each configuration file is composed of 3 parts

1) metadata (metadata)
   1) apiVersion [apps/v1 | v1] (value depends on the kind of component specified in the kind field)
   2) kind [Deployment | Service]
   3) metadata
      1) name
      2) labels
2) specification (declarative section the specifies the desired state of the component)
3) status (automatically generated and maintained by Kubernetes)

You can view the current state of a deployment in yaml format via the following command

```shell
kubectl get deployment nginx-deployment -o yaml > active-nginx-config.yaml  
```

Similarly, you can view the current state of your service component in a similar fashion:

```shell
kubectl get service nginx-service -o yaml > active-nginx-service.yaml
```

### Apply configuration file: sample-kube.yaml

```shell
kubectl apply -f [file name]
```

### Delete Configuration file: sample-kube.yaml

```shell
kubectl delete -f [file name]
```

## Interactive Terminal

### Get access to shell for pod

```shell
kubectl exec -it [pod name] -- bin/bash
```

### Execute remote script

```shell
kubectl exec -it [pod name] -- path/to/remote/script
```

## Namespaces

Namespaces provide a mechanism to isolate and encapsulate services from other services being managed by Kubernetes. This encapsulation means that all secrets, config maps and so on are specific to the namespace that they're defined in. If you have, for example, a shared data source between multiple applications living in multiple namespaces, then each of those namespaces must have their own copies of the secrets or configMap values necessary to connect to that database.

### Listing all namespaces

```shell
kubectl get namespace
```

### Creating a namespace

```shell
kubectl create namespace [name]
```

### Deleting a namespace

```shell
kubectl delete namespace [name]
```
