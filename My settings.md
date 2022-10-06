Create a S3 bucket:
    bucket name: my-813808706002-dev

    S3 bucket policy:{
        
        {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Stmt1625306057759",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::my-813808706002-bucket",
                "arn:aws:s3:::my-813808706002-bucket/*"
            ]
        }
    ]
}
    }

    S3 bucket CORPS:{
        [
    {
        "AllowedHeaders":[
            "*"
        ],
        "AllowedMethods":[
            "POST",
            "GET",
            "PUT",
            "DELETE",
            "HEAD"
        ],
        "AllowedOrigins":[
            "*"
        ],
        "ExposeHeaders":[

        ]
    }
    ]
}


## Installing or updating eksctl:

    eksctl, a simple command line tool for creating and managing Kubernetes clusters on Amazon EKS. Eksctl provides the fastest and easiest way to create a new cluster with nodes for Amazon EKS. For more information and to see the official documentation, see https://eksctl.io/
    To install or update eksctl

### Determine whether you already have eksctl installed on your device.
    
    `eksctl version`
    
Install the binaries with the following command:
    `choco install -y eksctl` 

If they are already installed, run the following command to upgrade:
    `choco upgrade -y eksctl `

    Test that your installation was successful with the following command.
        `eksctl version`

### My first eksctl cluster:
`eksctl create cluster --name udagram-eks-dev --region=us-east-1 --nodes-min=2 --nodes-max=3`

Test:
    `kubectl get nodes`
    `kubectl get pods`
    `kubectl get deployments`
    `kubectl get services`
Then configure AWS credintials using environmental variables
    setx AWS_ACCESS_KEY_ID 
    setx AWS_SESSION_ACCESS_KEY 
    set AWS_SESSION_TOKEN 
Create and configure the following files:
    backend-feed-deployment.yml
    backend-user-deployment.yml
    frontend-deployment.yml
    reverseproxy-deployment.yml

    backend-feed-service.yml
    backend-user-service.yml
    frontend-deployment.yml
    reverseproxy-deployment.yml


After creating deployments and services for each run the following commands:
    `kubectl apply -f backend-feed-deployment.yml`
    `kubectl apply -f backend-user-deployment.yml`
    `kubectl apply -f reverseproxy-deployment.yml`
    `kubectl apply -f frontend-deployment.yml`

Then next port forwarding:
 `kubectl port-forward service/reverseproxy 8080:8080`
 `kubectl port-forward service/frontend 8100:8100`

Finally install metric server on kubernetes:
## Installing the Kubernetes Metrics Server
    The Kubernetes Metrics Server is an aggregator of resource usage data in your cluster, and it is not deployed by default in Amazon EKS clusters. For more information, see Kubernetes Metrics Server on GitHub. The Metrics Server is commonly used by other Kubernetes add ons, such as the Horizontal Pod Autoscaler or the Kubernetes Dashboard. For more information, see Resource metrics pipeline in the Kubernetes documentation. This topic explains how to deploy the Kubernetes Metrics Server on your Amazon EKS cluster.

### Deploy the Metrics Server

    Deploy the Metrics Server with the following command:

`kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml`

Verify that the metrics-server deployment is running the desired number of pods with the following command.

`kubectl get deployment metrics-server -n kube-system`

### Create the HorizontalPodAutoscaler
`kubectl autoscale deployment backend-feed --cpu-percent=50 --min=1 --max=10`