# ** Cloud-Native Monitoring Application **
## **This project is a cloud-native monitoring application built using Python. The application is containerized using Docker and deployed to AWS Elastic Kubernetes Service (EKS) using Terraform.** [1]


## Architecture
![image](https://github.com/bagyeman90/monitoring-app/assets/131815160/f6c975c8-b42c-475a-8887-9163ae1b4d5e)



## **Getting Started**

Building the Docker Image

Pushing the Docker Image to DockerHub

Pushing the Docker Image to AWS ECR [2]

Deploying to AWS EKS

Terraform Configuration [3]

Monitoring and Observability


Introduction
The Cloud-Native Monitoring Application is a Python-based tool that provides real-time monitoring and observability for cloud-based infrastructure and applications. It leverages various AWS services, including Amazon EKS, Amazon ECR, and Terraform Cloud, to deliver a scalable and reliable monitoring solution.

# Architecture
The application architecture consists of the following components:

## **Docker** Image:
The Python application is packaged as a Docker image and stored in both DockerHub and Amazon Elastic Container Registry (ECR).

## **AWS EKS:** 
The Docker image is deployed to an Amazon Elastic Kubernetes Service (EKS) cluster, which provides a managed Kubernetes environment.

## **Terraform:** 
The entire infrastructure, including the EKS cluster, ECR repository, and other AWS resources, is provisioned and managed using Terraform. The Terraform state is stored in Terraform Cloud.

Prerequisites

The dependencies (requirments.txt file) have to be installed. 

AWS account with the necessary permissions to create and manage resources

Terraform installed on your local machine

Docker installed on your local machine

AWS CLI configured with your AWS credentials

Getting Started
Building the Docker Image
Navigate to the project directory.

Build the Docker image using the following command:


Insert at cursor

Copy
``` docker build -t flask-app .```

Pushing the Docker Image to DockerHub
``` docker push flask-app ``` 

Log in to your DockerHub account:
Running the image
``` docker run -p 5000:5000 flask-app ``` 


Insert at cursor

Copy
``` docker tag my-monitoring-app your-dockerhub-username/my-monitoring-app ``` 
Push the Docker image to DockerHub:


``` docker push your-dockerhub-username/my-monitoring-app ``` 
## **Pushing the Docker Image to AWS ECR**

Create an ECR repository in the AWS Management Console or using the AWS CLI.

Log in to the ECR repository:

``` aws ecr get-login-password --region <your-aws-region> | docker login --username AWS --password-stdin <your-ecr-repository-uri>``` 

Tag the Docker image with the ECR repository URI:

``` docker tag my-monitoring-app <your-ecr-repository-uri>/my-monitoring-app ``` 

Push the Docker image to ECR:

Copy
``` docker push <your-ecr-repository-uri>/my-monitoring-app``` 

## **Deploying to AWS EKS**
### **Navigate to the Terraform directory in your project.**

Initialize the Terraform working directory:

COPY ``` terraform init``` 
Review the Terraform configuration and make any necessary changes.

Apply the Terraform configuration to create the EKS cluster and deploy the application:

Copy
``` terraform apply``` 
Terraform Configuration
The Terraform configuration for this project is stored in the 
terraform
 directory. It includes the following resources:

## **AWS provider configuration**

## **EKS cluster**

## **ECR repository**

## **Kubernetes resources (deployment, service, etc.)**

## **Terraform Cloud backend configuration**

You can customize the Terraform configuration to fit your specific requirements, such as adjusting the instance types, scaling options, and other parameters.

Monitoring and Observability
The Cloud-Native Monitoring Application leverages AWS services for monitoring and observability, including:

Amazon CloudWatch for logging and metrics

AWS X-Ray for distributed tracing

AWS CloudTrail for auditing and security monitoring

You can configure these services in the Terraform configuration or through the AWS Management Console.

Contributing
Contributions to this project are welcome. If you find any issues or have suggestions for improvements, please create a new issue or submit a pull request.
