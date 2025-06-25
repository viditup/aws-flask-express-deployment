resource "aws_ecr_repository" "flask" {
  name                 = "flask-backend"
  image_tag_mutability = "MUTABLE"
  tags = {
    Name = "Flask ECR Repo"
  }
}

resource "aws_ecr_repository" "express" {
  name                 = "express-frontend"
  image_tag_mutability = "MUTABLE"
  tags = {
    Name = "Express ECR Repo"
  }
}
