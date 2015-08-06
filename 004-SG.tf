resource "aws_security_group" "ManageMeSg" {
  name = "ManageMeSg"
  description = "Provides Administrative Access"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = "${aws_vpc.webhosting.id}"
}

resource "aws_security_group" "WebInSg" {
  name = "WebInSg"
  description = "WebServer open ports "

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = "${aws_vpc.webhosting.id}"
}

resource "aws_security_group" "SQLSg" {
  name = "SQLSg"
  description = "Special rules for SQL traffic"

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["${aws_subnet.PubSub1.cidr_block}"]
  }
  
  egress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["${aws_subnet.PubSub1.cidr_block}"]
  }

  vpc_id = "${aws_vpc.webhosting.id}"
}

resource "aws_security_group" "WebOutSg" {
  name = "WebOutSg"
  description = "Special rules for Outgoing traffic"

  egress {
    from_port = 53
    to_port = 53
    protocol = "udp"
    cidr_blocks = ["${var.vpc_cidr_block}"]
  }

  egress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 egress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["${aws_subnet.PubSub1.cidr_block}"]
  }


  vpc_id = "${aws_vpc.webhosting.id}"
}

