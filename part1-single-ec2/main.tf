
provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "app" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = templatefile("setup.sh.tpl", {})

  tags = {
    Name = "FlaskExpressSingleEC2"
  }

  security_groups = [aws_security_group.sg.name]
}

resource "aws_security_group" "sg" {
  name        = "flask_express_sg"
  description = "Allow HTTP access"

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
