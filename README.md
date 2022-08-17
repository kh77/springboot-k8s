# SpringBoot-K8s
Deploy application to  kubernetes cluster using command line

- mvn clean package
- Install Minikube
- Install Kubectl
- Install DockerDesktop


### Commands :
- minikube start
- minikube status
- kubectl cluster-info


### To read docker repository use this 
    minikube docker-env
	
### Copy the output of above command run again,it will be like this  
    @FOR /f "tokens=*" %i IN ('minikube -p minikube docker-env --shell cmd') DO @%i
	
    	
### Make docker image of the application
    docker build -t app-k8s:1.0 .

### To see docker image which you built above
    docker images

### Create deployment using command prompt 
	kubectl create deployment app-k8s --image=app-k8s:1.0 --port=8080
	
### Check deployment which you created and ready state 
	kubectl get deployment 
	 
### More info regarding deployment 	 
	kubectl describe deployment app-k8s

### Pod logs :
    kubectl get pods 

### Copy the pod name from above and replace in the below command and see pod is running
    kubectl logs {pod-name}
	 	 
	 
### Create service so that host can call service url and service will call pod 
	kubectl expose deployment app-k8s1 --type=NodePort
    - output -> service/app-k8s1 exposed

### Get proxy url to call service url from the browser 
    minikube service app-k8s1 --url
      
    copy the output url and paste in the browser and hit spring boot application endpoint like below
    
    http://127.0.0.1:62465/hello

### Check health
    minikube dashboard
      
    copy the url and see in the dashboard pods , replica set , jobs etc  to see the health and delete pod etc.

### Delete Service and deployment to clean up space
    - delete service 
        kubectl service delete app-k8s

    - delete deployment 
        kubectl delete deployment app-k8s

