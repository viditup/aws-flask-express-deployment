#!/bin/bash
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
REGION="us-east-1"

for service in flask-backend express-frontend; do
  IMAGE="$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$service"
  aws ecr create-repository --repository-name $service --region $REGION || true
  docker build -t $service ../docker/$service
  docker tag $service:latest $IMAGE:latest
  aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com
  docker push $IMAGE:latest
done
