resource "aws_db_instance" "default" {
    identifier = "mydb-rds"
    allocated_storage = "${var.db_size}"
    engine = "mysql"
    engine_version = "5.6.23"
    instance_class = "db.t1.micro"
    name = "${var.db_name}"
    username = "${var.db_username}"
    password = "${var.db_pass}"
    vpc_security_group_ids = ["${aws_security_group.SQLSg.id}"]
    availability_zone = "${var.availability_zone.primary}"
    db_subnet_group_name = "${aws_db_subnet_group.default.id}"
    parameter_group_name = "default.mysql5.6"
}

resource "aws_db_subnet_group" "default" {
    name = "main"
    description = "Our main group of subnets"
    subnet_ids = ["${aws_subnet.PubSub1.id}", "${aws_subnet.PubSub2.id}"]
}

