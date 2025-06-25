variable "aws_region" {
  default = "us-east-1"
}

variable "ami_id" {
  default = "ami-0c02fb55956c7d316"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "vidit-key"
}

# part1-single-ec2/outputs.tf
output "public_ip" {
  value = aws_instance.app.public_ip
}
