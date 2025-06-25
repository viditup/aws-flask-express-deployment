provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./vpc.tf"
}

module "ecr" {
  source = "./ecr.tf"
}

module "ecs" {
  source = "./ecs.tf"
}

module "alb" {
  source = "./alb.tf"
}
