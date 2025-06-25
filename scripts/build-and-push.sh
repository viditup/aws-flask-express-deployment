#!/bin/bash

# Set variables
AWS_REGION="us-east-1" # Change if needed
FLASK_REPO_URI=$(aws ecr describe-repositories --repository-names flask-backend --region $AWS_REGION --query 'repositories[0].repositoryUri' --output text)
EXPRESS_REPO_URI=$(aws ecr describe-repositories --repository-names express-frontend --region $AWS_REGION --query 'repositories[0].repositoryUri' --output text)

echo "Flask ECR URI: $FLASK_REPO_URI"
echo "Express ECR URI: $EXPRESS_REPO_URI"

# Authenticate Docker with ECR
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin "$FLASK_REPO_URI"
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin "$EXPRESS_REPO_URI"

# Build and push Flask app
cd ../docker/flask-backend
docker build -t flask-backend .
docker tag flask-backend:latest $FLASK_REPO_URI:latest
docker push $FLASK_REPO_URI:latest
echo "✅ Flask backend pushed"

# Build and push Express app
cd ../express-frontend
docker build -t express-frontend .
docker tag express-frontend:latest $EXPRESS_REPO_URI:latest
docker push $EXPRESS_REPO_URI:latest
echo "✅ Express frontend pushed"

