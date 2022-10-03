Create a S3 bucket:
    bucket name: my-813808706002-dev

    S3 bucket policy:{
        {
        "Version":"2012-10-17",
        "Statement":[
        {
            "Sid":"Stmt1625306057759",
            "Principal":"*",
            "Action":"s3:*",
            "Effect":"Allow",
            "Resource":[
                "arn:aws:s3:::[bucket-name]",
                "arn:aws:s3:::[bucket-name]/*"
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
    