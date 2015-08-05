# Generate VPC
resource "aws_vpc" "webhosting" {
  cidr_block = "${var.vpc_cidr_block}"
}


# Public Subnets
resource "aws_subnet" "PubSub1" {
  vpc_id = "${aws_vpc.webhosting.id}"
  availability_zone = "${var.availability_zone.primary}"
  cidr_block = "${var.PubSub_cidr_block.PubSub1}"
  tags {
    Name = "PubSub1"
  }
}

resource "aws_subnet" "PubSub2" {
  vpc_id = "${aws_vpc.webhosting.id}"
  availability_zone = "${var.availability_zone.secondary}"
  cidr_block = "${var.PubSub_cidr_block.PubSub2}"
  tags {
    Name = "PubSub2"
  }
}

# Internet GW
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.webhosting.id}"
}


# Public Routing
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.webhosting.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
  tags {
    Name = "Public"
  }
}

resource "aws_route_table_association" "PubSub1" {
  subnet_id = "${aws_subnet.PubSub1.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "PubSub2" {
  subnet_id = "${aws_subnet.PubSub2.id}"
  route_table_id = "${aws_route_table.public.id}"
}


