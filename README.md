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

```text
                Internet
                    |
                    v
        +----------------------+
        | Application Load     |
        | Balancer (ALB)       |
        +----------------------+
                    |
                    v
        +----------------------+
        |     Target Group     |
        +----------------------+
               /        \
              /          \
             v            v

    +----------------+  +----------------+
    | EC2 Instance 1 |  | EC2 Instance 2 |
    |     Nginx      |  |     Nginx      |
    +----------------+  +----------------+
```

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

```text
.
├── provider.tf
├── main.tf
├── target-gp.tf
├── outputs.tf
└── README.md
```

---

## Deployment Steps

### Initialize Terraform

```bash
terraform init
```

### Validate Configuration

```bash
terraform validate
```

### Preview Changes

```bash
terraform plan
```

### Deploy Infrastructure

```bash
terraform apply
```

### Destroy Infrastructure

```bash
terraform destroy
```

---

## Verification

1. Deploy the infrastructure using Terraform.
2. Copy the ALB DNS name from Terraform output.
3. Open the DNS URL in a browser.
4. Refresh multiple times.
5. Requests should be distributed between both Nginx servers.

Example:

* Terraform Nginx Server-1
* Terraform Nginx Server-2

This confirms that load balancing is working correctly.

---

## Learning Outcomes

* Terraform Fundamentals
* AWS EC2 Provisioning
* Security Group Management
* Application Load Balancer Configuration
* Target Groups and Health Checks
* Infrastructure Automation Using Terraform

---

## Author

**Abhishek Sali**

DevOps & Cloud Computing Learner

DevOps & Cloud Computing Learner
