resource "aws_instance" "expense" {
  count                  = length(var.instances)
  ami                    = "ami-09c813fb71547fc4f" # This is our devops-practice AMI ID
  vpc_security_group_ids = [aws_security_group.SG.id]
  instance_type          = "t3.micro"
  tags = {
    Name    = var.instances[count.index]
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