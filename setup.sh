#! /bin/bash

echo "Setting up example nginx deployment"

kubectl apply -f nginx-sample/sample-deployment.yaml
kubectl apply -f nginx-sample/sample-service.yaml

echo "Setting up nginx ingress controller"

kubectl apply -f core-config/nginx-ingress.yaml
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=120s

echo "Setting up mongodb and mongo-express applications"

kubectl apply -f mongo-sample/namespace.yaml
kubectl apply -f mongo-sample/secret.yaml
kubectl apply -f mongo-sample/mongo-configmap.yaml
kubectl apply -f mongo-sample/mongodb.yaml
kubectl apply -f mongo-sample/mongo-express.yaml

echo "Setting up hello-go example application"

kubectl apply -f hello-go/hello-go.yaml

echo "Done with setup"
