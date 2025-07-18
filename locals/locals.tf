locals {
  ami_id = data.aws_ami.RHEL.id
  vpc_SG_id  = [aws_security_group.SG.id]
  instance_type = "t3.micro"
  name = "${var.project}-${var.environment}-${var.component}"

}

