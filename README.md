# ** Cloud-Native Monitoring Application **
## **This project is a cloud-native monitoring application built using Python. The application is containerized using Docker and deployed to AWS Elastic Kubernetes Service (EKS) using Terraform.** [1]

### Introduction
The Cloud-Native Monitoring Application is a Python-based tool that provides real-time monitoring and observability for cloud-based infrastructure and applications. It leverages various AWS services, including Amazon EKS, Amazon ECR, and Terraform Cloud, to deliver a scalable and reliable monitoring solution.


## Main Architecture
<img width="506" alt="Screenshot 2024-06-10 at 23 00 20" src="https://github.com/bagyeman90/monitoring-app/assets/131815160/855e21dc-d712-4a98-b748-e3f0bd7b972d">


## Getting Started**

* Building the Docker Image

* Pushing the Docker Image to DockerHub

* Pushing the Docker Image to AWS ECR [2]

* Deploying to AWS EKS

* Terraform Configuration [3]

* Monitoring and Observability


# Architecture
The application architecture consists of the following components:

## **Docker** Image:
Build the Docker image using the following command:

``` docker build -t flask-app .```

Running the image

``` docker run -p 5000:5000 flask-app ``` 


The Python application is packaged as a Docker image and stored in both DockerHub and Amazon Elastic Container Registry (ECR).

<img width="785" alt="Screenshot 2024-06-10 at 23 14 46" src="https://github.com/bagyeman90/monitoring-app/assets/131815160/a5c1e07b-7dca-44f3-8de2-79ec78185f7a">

## **AWS EKS:** 
The Docker image is deployed to an Amazon Elastic Kubernetes Service (EKS) cluster, which provides a managed Kubernetes environment.

## **Terraform:** 
The entire infrastructure, including the EKS cluster, ECR repository, and other AWS resources, is provisioned and managed using Terraform. The Terraform state is stored in Terraform Cloud.

<img width="1255" alt="VPC" src="https://github.com/bagyeman90/monitoring-app/assets/131815160/82bd3055-750b-407f-b265-ae56db849e84">

<img width="1244" alt="ECR" src="https://github.com/bagyeman90/monitoring-app/assets/131815160/2a752e9c-6615-45ec-b8e4-1eb2360fd9fa">

<img width="1321" alt="EKS" src="https://github.com/bagyeman90/monitoring-app/assets/131815160/2641bb11-38c6-41c8-b3b6-370e92f8eb7a">



## Prerequisites

* The dependencies (requirments.txt file) have to be installed. 

AWS CLI configured with your AWS credentials

Getting Started
Building the Docker Image

Build the Docker image using the following command:


Log in to your DockerHub account:



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
