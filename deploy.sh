kubectl delete deploy backend-user
kubectl delete deploy backend-feed
kubectl delete deploy reverseproxy
kubectl delete deploy frontend

kubectl apply -f backend-feed-deployment.yml
kubectl apply -f backend-user-deployment.yml
kubectl apply -f reverseproxy-deployment.yml
kubectl apply -f frontend-deployment.yml