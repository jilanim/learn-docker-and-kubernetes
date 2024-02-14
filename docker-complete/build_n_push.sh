docker build -t jilanim/kub-first-app:2 .
docker push jilanim/kub-first-app:2

minikube start
kubectl get deployments

# run separate - open the dashboard
minikube dashboard

# run separate - expose the deployment to localhost machine
minikube service first-app
