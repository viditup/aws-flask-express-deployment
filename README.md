# AWS Flask + Express Deployment using Terraform

This project demonstrates three different methods of deploying a **Flask backend** and **Express frontend** using **Terraform** and **AWS services**:

---

## 📌 Project Overview

| Part | Description |
|------|-------------|
| **Part 1** | Deploy both Flask and Express apps on a **single EC2 instance**. |
| **Part 2** | Deploy Flask and Express on **separate EC2 instances**, communicating via private IPs. |
| **Part 3** | Deploy Flask and Express as **Docker containers** using **ECR, ECS (Fargate), ALB**, and a custom **VPC**.

---

## 🛠️ Tools & Technologies

- **Terraform**
- **AWS EC2, VPC, ECS, ECR, ALB, Security Groups**
- **Flask (Python Backend)**
- **Express (Node.js Frontend)**
- **Docker**
- **Cloud-Init (User Data Scripts)**

---

## 📁 Project Structure

aws-flask-express-deployment/
│
├── part1-single-ec2/
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
│ ├── setup.sh.tpl
│ └── README.md
│
├── part2-separate-ec2/
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
│ ├── flask_userdata.sh.tpl
│ ├── express_userdata.sh.tpl
│ └── README.md
│
├── part3-ecs-docker/
│ ├── docker/
│ │ ├── flask-backend/Dockerfile
│ │ └── express-frontend/Dockerfile
│ ├── terraform/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ ├── outputs.tf
│ │ ├── vpc.tf
│ │ ├── ecs.tf
│ │ ├── alb.tf
│ │ └── ecr.tf
│ ├── scripts/
│ │ ├── build-and-push.sh
│ │ └── cleanup.sh
│ └── README.md
│
├── screenshots/
│ ├── part1-ec2-running.png
│ ├── part2-ec2-flask-express.png
│ └── part3-ecs-services.png
│
├── .gitignore
├── README.md

---

## ✅ How to Use

### 🌐 Prerequisites

- AWS CLI configured (`aws configure`)
- Terraform installed
- Docker installed (for Part 3)
- Git

---

### ▶️ Deployment Steps (For Each Part)

#### 🧩 Part 1: Single EC2 Instance

```bash
cd part1-single-ec2/
terraform init
terraform apply




