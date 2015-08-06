resource "aws_instance" "Web1" {
  # Centos 7 original from centos.org
  ami = "ami-e4ff5c93"
  instance_type = "t2.micro"
  key_name = "${var.general_key}"
  security_groups = ["${aws_security_group.WebInSg.id}", "${aws_security_group.WebOutSg.id}", "${aws_security_group.ManageMeSg.id}"]
  subnet_id = "${aws_subnet.PubSub1.id}"
  associate_public_ip_address = false
  iam_instance_profile = "WebHosting"
  user_data = "${template_file.wpsettings.rendered}"
  tags {
        Name = "Web1"
  }

}

# Template for initial configuration bash script
resource "template_file" "wpsettings" {
  filename = "scripts/WebDefault.sh"
  vars {
    db_address = "${aws_db_instance.default.address}"
    db_name = "${var.db_name}"
    db_user = "${var.db_username}"
    db_pass = "${var.db_pass}"
    ftp_user = "${var.ftp_user}"
    ftp_pass = "${var.ftp_pass}"
  }
}




######################NetworkInterfaces##############################
#resource "aws_network_interface" "WebIf1" {
#  subnet_id = "${aws_subnet.PubSub1.id}"
#  security_groups = ["${aws_security_group.WebSg.id}", "${aws_security_group.ManageMeSg.id}"]
#  tags {
#        Name = "WebIf1"
#  }
#  attachment {
#    instance = "${aws_instance.Web1.id}"
#    device_index = 2
#  }
#}

