## Part 3: Dockerized ECS Deployment

### Description
Deploys Flask and Express containers to ECS Fargate with an Application Load Balancer.

### Steps:
1. Build and push Docker images:
```bash
cd scripts
bash build-and-push.sh
```

2. Deploy infrastructure:
```bash
cd ../part3-ecs-docker/terraform
terraform init
terraform apply -auto-approve
```

3. Cleanup:
```bash
bash ../../scripts/cleanup.sh
```

### Output
Access the ALB DNS for:
- Flask: `http://<alb-dns>/flask`
- Express: `http://<alb-dns>/express`
