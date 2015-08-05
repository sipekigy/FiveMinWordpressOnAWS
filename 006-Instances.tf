resource "aws_instance" "Web1" {
  # Centos 7 original from centos.org
  ami = "ami-e4ff5c93"
  instance_type = "t2.micro"
  key_name = "${var.general-key}"
  security_groups = ["${aws_security_group.WebInSg.id}", "${aws_security_group.WebOutSg.id}", "${aws_security_group.ManageMeSg.id}"]
  subnet_id = "${aws_subnet.PubSub1.id}"
  associate_public_ip_address = false
  iam_instance_profile = "WebHosting"
  user_data = "${file("scripts/WebDefault.sh")}"
  tags {
        Name = "Web1"
  }

#  provisioner "file" {
#    source = "scripts/WebDefault.sh"
#    destination = "/tmp/WebDefault.sh"
#  }
  
#  provisioner "remote-exec" {
#    inline = ["/tmp/WebDefault.sh"]
#  }
 
}

######################NetworkInterface Bug :(##############################
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

