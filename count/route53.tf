resource "aws_route53_record" "expense" {
  count = 3
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}" #interpolation
  type    = "A"
  ttl     = 1
  records = [aws_instance.expense[count.index].private_ip]
  allow_overwrite = "true"                                     #It will overwrite the IP's for every time when change happend
}

resource "aws_route53_record" "public" {
  zone_id = var.zone_id
  name    = var.domain_name #interpolation
  type    = "A"
  ttl     = 1
  records = [aws_instance.expense[2].public_ip]
  allow_overwrite = "true"                                     #It will overwrite the IP's for every time when change happend
}