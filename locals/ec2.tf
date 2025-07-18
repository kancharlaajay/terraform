resource "aws_instance" "ec2_instance" {
  ami                    = local.ami_id # This is our devops-practice AMI ID
  vpc_security_group_ids = local.vpc_SG_id
  #instance_type          = var.instance_type
  instance_type          = local.instance_type
  tags = {
    Name    = local.name
    Purpose = "terraform-practice"
  }
}

resource "aws_security_group" "SG" {
  name        = "allow_ll"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all"
  }
}