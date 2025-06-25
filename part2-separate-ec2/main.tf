provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "flask" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = templatefile("flask_userdata.sh.tpl", {})
  security_groups = [aws_security_group.sg.name]

  tags = {
    Name = "FlaskInstance"
  }
}

resource "aws_instance" "express" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = templatefile("express_userdata.sh.tpl", {})
  security_groups = [aws_security_group.sg.name]

  tags = {
    Name = "ExpressInstance"
  }
}

resource "aws_security_group" "sg" {
  name        = "flask_express_separate_sg"
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

