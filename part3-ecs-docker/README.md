### 🧱 Infrastructure Components
- **ECR**: Two private repositories for Docker images.
- **ECS**: ECS Cluster using Fargate with two services and task definitions.
- **VPC**: Custom VPC with public subnets and security groups.
- **ALB**: Application Load Balancer to route traffic to respective services.

---

### 📁 Directory Structure
```
part3-ecs-docker/
├── docker/
│   ├── flask-backend/Dockerfile
│   └── express-frontend/Dockerfile
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── vpc.tf
│   ├── ecs.tf
│   ├── ecr.tf
│   └── alb.tf
├── scripts/
│   └── build-and-push.sh
└── README.md
```

---

### 🚀 Deployment Steps

#### Step 1: Initialize Terraform
```bash
cd terraform
terraform init
```

#### Step 2: Plan Infrastructure
```bash
terraform plan -out=tfplan
```

#### Step 3: Apply Infrastructure
```bash
terraform apply tfplan
```

#### Step 4: Build and Push Docker Images
```bash
cd ../scripts
chmod +x build-and-push.sh
./build-and-push.sh
```

---

### 🔁 ALB Routing
- **ALB DNS** is output after `terraform apply`
- Port 80 routes:
  - `/api` → Flask ECS Service
  - `/` → Express ECS Service

---

### 📦 Outputs
- ALB DNS name
- ECR Repository URLs for both Flask and Express

---

### 📝 Notes
- Make sure your AWS credentials and IAM roles allow full ECS/ECR/VPC/ALB management.
- ECS Fargate is used for serverless container deployment.
- Uses public subnets only; no NAT Gateway is required.

---

### 🧹 Cleanup
```bash
terraform destroy
```
