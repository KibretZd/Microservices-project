Create a S3 bucket:
    bucket name: my-813808706002-dev

    S3 bucket policy:{
        
        {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Stmt1625306057759",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::813808706002:root"
            },
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::my-813808706002-dev",
                "arn:aws:s3:::my-813808706002-dev/*"
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
        eksctl version
    You can install eksctl on macOS, Linux, or Windows
        Install the binaries with the following command:
            choco install -y eksctl 

        If they are already installed, run the following command to upgrade:
            choco upgrade -y eksctl 

    Test that your installation was successful with the following command.
        eksctl version

    ### My first eksctl cluster:
        eksctl create cluster --name udagram-kb-eksctl --region us-east-1

        Test:
            kubectl get nodes
            kubectl get pods
            kubectl get deployments
            kubectl get services
    Then configure AWS credintials using environmental variables
        setx AWS_ACCESS_KEY_ID 
        setx AWS_SESSION_ACCESS_KEY 
        set AWS_SESSION_TOKEN 
Create and configure the following files:
    feed-deploment.yml
    user-deploment.yml

After creating deployments and services for each run the following commands:
    kubectl apply -f backend-feed-deployment.yml
    kubectl apply -f backend-user-deployment.yml
    kubectl apply -f reverseproxy-deployment.yml
    kubectl apply -f frontend-deployment.yml

Then next port forwarding:
 kubectl port-forward service/reverseproxy 8080:8080
 kubectl port-forward service/frontend 8100:8100