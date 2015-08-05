resource "aws_eip" "WebEIP1" {
    instance = "${aws_instance.Web1.id}"
    vpc = true
}

## We can't use network interfaces because a terraform bug.
#    network_interface = "${aws_network_interface.WebIf1.id}"

