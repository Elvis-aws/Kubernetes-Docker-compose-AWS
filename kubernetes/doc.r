
********
Minikube
********
    - Creates a kubernetes cluster on our local machine
    - This creates virtual machines on our local env
    - Each vm might be running multiple containers

*******
Kubectl
*******
    - This is used to interact with the kubernetes cluster
    - Managing all what the nodes and containers running in the nodes are doing
    - We use this in the development environment as well

************
Installation
************
- brew install kubectl
- download virtual box
- brew install minikube

*****
Notes
*****
    - Build all images before you can use the cluster
    - Config files create objects
    - Manually set up networking
    - Config files are passed through kubectl to create objects
    - We are creating a Pod and a Service objects
***
Pod
***
    - Kubectl places the Pod object inside a Node
    - The Node is the vm created by minikube
    - The Pod is just a grouping of identical containers
    - Containers thus run inside pods
    - We can create a Pod of un-identical containers e.g logging and back-up containers
*******
Service
*******
    - A Service in Kubernetes is a REST object, similar to a Pod. Like all of the REST objects, you can POST a
      Service definition to the API server to create a new instance. The name of a Service object must be a valid
      RFC 1035 label name. For example, suppose you have a set of Pods where each listens on TCP port 9376 and
      contains a label app.kubernetes.io/name=MyApp
    - Sets up networking in a cluster
    - NodePort service exposes containers to the outside world only for dev purposes

********
commands
********
    - minikube start
    - minikube status
    - kubectl config use-context minikube
    - minikube dashboard
    - kubectl cluster-info
    - kubectl delete pods --all
    - kubectl delete services --all
    - kubectl get pods
    - kubectl get pods -o wide
    - kubectl get services
    - minikube ip
    - kubectl get events
    - kubectl config view
    - Kubectl describe pod <name>
    - kubectl get storageClass

***********************
Verify kubectl versions
***********************
- kubectl api-resources | grep deployment

*********************
Run Kubernetes on cmd
*********************
kubectl create deployment api-client --image=dockerelvis/user-api:latest --port=9003
kubectl expose deployment api-client --type=NodePort --port=9003

******************************
Run Kubernetes using yaml file
******************************
- minikube start
- kubectl apply -f api-pod.yaml
- kubectl apply -f api-service.yaml
- kubectl get services
- kubectl get deployments
- minikube service api-client-service

****************
Scale deployment
****************
Kubectl scale --replicas=3 deployment/api-client

***********
Update pods
***********
- Set new image in pod.yaml
- kubectl apply -f api-pod.yaml
- Kubectl describe pod api-port

****************
Deleting objects
****************
- kubectl delete -f api-pod.yaml
- kubectl delete -f api-service.yaml
- kubectl delete -f api-deployment.yaml
- kubectl delete pods <pod name> --grace-period=0 --force

***********
Remove node
***********
- kubectl get nodes
- kubectl drain <node name>

*******************
Creating deployment
*******************
- minikube start
- kubectl apply -f api-deployment.yaml
- kubectl get deployments
- kubectl apply -f api-service.yaml
- kubectl get services
- minikube service api-client-service
**************
Create volumes
**************
- kubectl apply -f data-volume.yaml
- kubectl get pv
- kubectl get pvc
