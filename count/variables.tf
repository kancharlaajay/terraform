variable "instances"{
    type = list(string)
    default = ["mysql", "backend", "frontend"]
}

variable "zone_id" {
  default = "Z06509862GXPI5UI4QHZA"
}

variable "domain_name"{
    default = "ajayinfra.site"
}