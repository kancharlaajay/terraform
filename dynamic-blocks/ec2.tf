resource "aws_instance" "ec2_instance" {
  ami                    = "ami-09c813fb71547fc4f" # This is our devops-practice AMI ID
  vpc_security_group_ids = [aws_security_group.sg.id]
  instance_type          = "t3.micro"
  tags = {
    Name    = "terraform-demo"
    Purpose = "terraform-practice"
  }
}

resource "aws_security_group" "sg" {
  name        = "my-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  dynamic "ingress"{
    for_each = var.ingress_ports
    content{
      from_port = ingress.value.from_port
      to_port   = ingress.value.to_port
      protocol  = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
}