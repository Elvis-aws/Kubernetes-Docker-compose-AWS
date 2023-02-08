
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
    ********
    commands
    ********
        - minikube start
        - minikube status
        - kubectl cluster-info
        - kubectl delete pods --all
        - kubectl delete services --all
        - kubectl apply -f filename
            - kubectl apply -f api-pod.yaml
            - kubectl apply -f api-node-port.yaml
        - kubectl get pods
        - kubectl get services
        - minikube ip

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
    - Sets up networking in a cluster
    - NodePort service exposes containers to the outside world only for dev purposes

