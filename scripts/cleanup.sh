#!/bin/bash

AWS_REGION="us-east-1" # Change if needed

# Destroy Terraform infrastructure
cd ../terraform
terraform destroy -auto-approve

# Delete Docker images from ECR
aws ecr batch-delete-image \
    --repository-name flask-backend \
    --image-ids imageTag=latest \
    --region $AWS_REGION

aws ecr batch-delete-image \
    --repository-name express-frontend \
    --image-ids imageTag=latest \
    --region $AWS_REGION

echo "✅ Infrastructure and ECR images cleaned up"

