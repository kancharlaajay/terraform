variable "instance_type" {
  type = string
  default = "t3.micro"
  description = "size of the ec2 instance"
}

variable "project" {
  default = "expense"
}

variable "component" {
  default = "backend"
}

variable "environment"{
  default = "dev"
}