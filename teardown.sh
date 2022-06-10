#! /bin/bash

echo "Tearing down hello-go example application"

kubectl delete -f hello-go/hello-go.yaml

echo "Tearing down mongodb and mongo-express applications"

kubectl delete -f mongo-sample/mongo-express.yaml
kubectl delete -f mongo-sample/mongodb.yaml
kubectl delete -f mongo-sample/mongo-configmap.yaml
kubectl delete -f mongo-sample/secret.yaml
kubectl delete -f mongo-sample/namespace.yaml

echo "Tearing down nginx ingress controller"

kubectl delete -f core-config/nginx-ingress.yaml

echo "Tearing down example nginx deployment"

kubectl delete -f nginx-sample/sample-service.yaml
kubectl delete -f nginx-sample/sample-deployment.yaml

echo "Done with teardown"
