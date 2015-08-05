resource "aws_route53_zone" "gys" {
#Your Domain Root
  name = "----REPLACE----; example.net"
}

# use the subdomain first part to resource name!
resource "aws_route53_record" "www" {
  zone_id = "${aws_route53_zone.gys.zone_id}"
  name = "----REPLACE----; www.example.net"
  type = "A"
  ttl = "300"
  records = ["${aws_eip.WebEIP1.public_ip}"]
}

resource "aws_route53_record" "root" {
  zone_id = "${aws_route53_zone.gys.zone_id}"
  name = "----REPLACE----; example.net"
  type = "A"
  ttl = "300"
  records = ["${aws_eip.WebEIP1.public_ip}"]
}

