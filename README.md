# ** Cloud-Native Monitoring Application **
## **This project is a cloud-native monitoring application built using Python. The application is containerized using Docker and deployed to AWS Elastic Kubernetes Service (EKS) using Terraform.** [1]

### Introduction
The Cloud-Native Monitoring Application is a Python-based tool that provides real-time monitoring and observability for cloud-based infrastructure and applications. It leverages various AWS services, including Amazon EKS, Amazon ECR, and Terraform Cloud, to deliver a scalable and reliable monitoring solution.


## Main Architecture
<img width="706" alt="Screenshot 2024-06-11 at 14 50 58" src="https://github.com/bagyeman90/monitoring-app/assets/131815160/77f165f4-0df1-41e0-a961-3dbc9127b849">


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
### Build the Docker image using the following command:

``` docker build -t flask-app .```

### Running the image in the terminal:

``` docker run -p 5000:5000 flask-app ``` 
<img width="1165" alt="Screenshot 2024-06-10 at 23 23 07" src="https://github.com/bagyeman90/monitoring-app/assets/131815160/70ab7c76-8cff-4b82-aef3-c11201243aba">

### Flask Apoplication image in the UI:

<img width="1710" alt="Screenshot 2024-06-10 at 23 23 19" src="https://github.com/bagyeman90/monitoring-app/assets/131815160/899bd537-e7c2-4705-9947-31badf0481c9">

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

The Python application is packaged as a Docker image and stored in both DockerHub and Amazon Elastic Container Registry (ECR).

<img width="785" alt="Screenshot 2024-06-10 at 23 14 46" src="https://github.com/bagyeman90/monitoring-app/assets/131815160/a5c1e07b-7dca-44f3-8de2-79ec78185f7a">

## **AWS EKS:** 
The Docker image is deployed to an Amazon Elastic Kubernetes Service (EKS) cluster, which provides a managed Kubernetes environment.

## **Terraform:** 
The entire infrastructure, including the EKS cluster, ECR repository, and other AWS resources, is provisioned and managed using Terraform. 

<img width="1244" alt="ECR" src="https://github.com/bagyeman90/monitoring-app/assets/131815160/2a752e9c-6615-45ec-b8e4-1eb2360fd9fa">

<img width="1321" alt="EKS" src="https://github.com/bagyeman90/monitoring-app/assets/131815160/2641bb11-38c6-41c8-b3b6-370e92f8eb7a">

## The Terraform state is stored in Terraform Cloud.

<img width="1218" alt="Screenshot 2024-06-10 at 23 44 49" src="https://github.com/bagyeman90/monitoring-app/assets/131815160/45aee0fb-841c-45ea-90a6-39428b202329">


``` docker push your-dockerhub-username/my-monitoring-app ``` 
## **Pushing the Docker Image to AWS ECR**

Create an ECR repository in the AWS Management Console with Terraform.
<img width="1323" alt="Screenshot 2024-06-10 at 23 28 14" src="https://github.com/bagyeman90/monitoring-app/assets/131815160/d83c999b-7eb5-472e-8bdb-183e0c164a05">


Log in to the ECR repository:

``` aws ecr get-login-password --region <your-aws-region> | docker login --username AWS --password-stdin <your-ecr-repository-uri>``` 

Tag the Docker image with the ECR repository URI:

``` docker tag my-monitoring-app <your-ecr-repository-uri>/my-monitoring-app ``` 

Push the Docker image to ECR:

<img width="1359" alt="Screenshot 2024-06-10 at 23 46 47" src="https://github.com/bagyeman90/monitoring-app/assets/131815160/181008a4-f9e2-4885-ae41-2be3ee7ea00e">


Copy
``` docker push <your-ecr-repository-uri>/my-monitoring-app``` 

## **Deploying to AWS EKS**
```jsx
name: Deploy to Amazon ECR

on:
  push:
    branches: [ "main" ]

env:
  AWS_REGION: eu-west-1              
  ECR_REPOSITORY: flask-ecr-repo         
                                              

permissions:
  contents: read

jobs:
  deploy:
    name: Deploy
    runs-on: ubuntu-latest
    environment: production

    steps:
    - name: Checkout
      uses: actions/checkout@v4

    - name: Configure AWS credentials
      uses: aws-actions/configure-aws-credentials@v1
      with:
        aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        aws-region: ${{ env.AWS_REGION }}

    - name: Login to Amazon ECR
      id: login-ecr
      uses: aws-actions/amazon-ecr-login@v1

    - name: Build, tag, and push image to Amazon ECR
      id: build-image
      env:
        ECR_REGISTRY: ${{ steps.login-ecr.outputs.registry }}
        IMAGE_TAG: ${{ github.sha }}
      run: |
        # Build a docker container and
        # push it to ECR so that it can
        # be deployed to ECS.
        docker build -t $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG .
        docker push $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG
        echo "image=$ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG" >> $GITHUB_OUTPUT
```

## **CI/CD Pipeline**
### GitHub Actions for the pipeline

<img width="1684" alt="Screenshot 2024-06-11 at 01 08 31" src="https://github.com/bagyeman90/monitoring-app/assets/131815160/f42b6fb2-a5e7-4974-bb1d-5c9654abe910">


# Project Summary
## Task:
Developed a cloud-native monitoring application using Python, containerize it with Docker, and deploy it on AWS Elastic Kubernetes Service (EKS) using Terraform. The application should leverage AWS services for a scalable and reliable monitoring solution.

## Evaluation:
The project successfully delivers a robust cloud-native monitoring solution that integrates various AWS services. The application architecture ensures scalability, reliability, and maintainability through the use of Docker for containerization, Kubernetes for orchestration, and Terraform for infrastructure as code.

## Cloud Infrastructure Setup:
The infrastructure is set up using Terraform, which provisions and manages the necessary AWS resources, including:

* Amazon EKS: A managed Kubernetes service for deploying the application.
* Amazon ECR: A container registry for storing Docker images.
* Terraform Cloud: Used for storing the Terraform state and ensuring consistent infrastructure management.

## Continuous Integration & Continuous Deployment (CI/CD) Pipeline:
A CI/CD pipeline is implemented using GitHub Actions, automating the process of building, tagging, and pushing Docker images to Amazon ECR. The pipeline ensures that every change to the codebase is tested and deployed efficiently, maintaining high deployment velocity and reliability. Key steps in the pipeline include:

* Checking out the code from the repository.
* Configuring AWS credentials.
* Logging into Amazon ECR.
* Building, tagging, and pushing the Docker image to ECR.

## Containerization and Container Orchestration:
### Containerization: 
The Python application is packaged as a Docker image, ensuring consistency across different environments. 

### Container Orchestration: 
The Docker image is deployed on an Amazon EKS cluster. Kubernetes resources, including deployments and services, are managed through Terraform configuration files, providing a scalable and resilient environment for the application.

## Results:
The project demonstrates a fully functional cloud-native monitoring application, highlighting the benefits of using Docker for containerization and Kubernetes for orchestration. The use of Terraform for infrastructure as code ensures a reproducible and manageable setup. The CI/CD pipeline automates the deployment process, enhancing efficiency and reliability. The application architecture provides a scalable solution capable of monitoring cloud-based infrastructure in real-time, leveraging the robustness and scalability of AWS services.
