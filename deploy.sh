kubectl delete deploy backend-user
kubectl delete deploy backend-feed
kubectl delete deploy reverseproxy
kubectl delete deploy frontend

kubectl delete service backend-user
kubectl delete service backend-feed
kubectl delete service reverseproxy
kubectl delete service frontend

# Apply env variables and secrets
# kubectl apply -f aws-secret.yaml
# kubectl apply -f env-secret.yaml
# kubectl apply -f env-configmap.yaml


# Deployments - Double check the Dockerhub image name and version in the deployment files
kubectl apply -f backend-feed-deployment.yml
kubectl apply -f backend-user-deployment.yml
kubectl apply -f reverseproxy-deployment.yml
kubectl apply -f frontend-deployment.yml

# Services
kubectl apply -f backend-feed-service.yml
kubectl apply -f backend-user-service.yml
kubectl apply -f reverseproxy-service.yml
kubectl apply -f frontend-service.yml
