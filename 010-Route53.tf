resource "aws_route53_zone" "maind" {
  name = "${var.domain_name}"
}

# use the subdomain first part to resource name!
resource "aws_route53_record" "www" {
  zone_id = "${aws_route53_zone.maind.zone_id}"
  name = "www.${var.domain_name}"
  type = "A"
  ttl = "300"
  records = ["${aws_eip.WebEIP1.public_ip}"]
}

resource "aws_route53_record" "root" {
  zone_id = "${aws_route53_zone.maind.zone_id}"
  name = "${var.domain_name}"
  type = "A"
  ttl = "300"
  records = ["${aws_eip.WebEIP1.public_ip}"]
}

