# Terraform AWS Application Load Balancer Project

## Overview

This project provisions a highly available web application infrastructure on AWS using Terraform.

The infrastructure consists of:

* Application Load Balancer (ALB)
* Two EC2 Instances
* Security Groups
* Target Group
* Listener
* Nginx Web Server

Traffic is distributed across multiple EC2 instances through the Application Load Balancer.

---

## Architecture

Internet
|
v
Application Load Balancer
|
v
Target Group
|
+------------------+
|                  |
v                  v
EC2 Instance 1     EC2 Instance 2
(Nginx)            (Nginx)

---

## Features

* Infrastructure as Code (Terraform)
* Automated EC2 provisioning
* Automated Nginx installation using user_data
* Application Load Balancer for traffic distribution
* Target Group health checks
* Security Group configuration
* High Availability architecture

---

## AWS Services Used

* Amazon EC2
* Application Load Balancer (ALB)
* Target Groups
* Security Groups
* Default VPC
* Terraform

---

## Project Structure

.
├── provider.tf
├── main.tf
├── target-gp.tf
├── script/
│   ├── install-nginx.sh
│   └── install-nginx-2.sh
├── outputs.tf
└── README.md

---

## Deployment Steps

### Initialize Terraform

terraform init

### Validate Configuration

terraform validate

### Preview Changes

terraform plan

### Deploy Infrastructure

terraform apply

### Destroy Infrastructure

terraform destroy

---

## Verification

After deployment:

1. Copy the ALB DNS name from Terraform output.
2. Open the DNS URL in a browser.
3. Refresh multiple times.
4. Requests should be distributed between both Nginx servers.

Example:

* Terraform Nginx Server-1
* Terraform Nginx Server-2

This confirms that load balancing is working correctly.

---

## Learning Outcomes

Through this project I learned:

* Terraform fundamentals
* AWS EC2 provisioning
* Security Group management
* Application Load Balancer configuration
* Target Groups and Health Checks
* Infrastructure Automation using Terraform

---

## Author

Abhishek Sali

DevOps & Cloud Computing Learner
