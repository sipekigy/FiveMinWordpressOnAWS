resource "aws_iam_instance_profile" "WebHosting" {
    name = "WebHosting"
    roles = ["${aws_iam_role.WebRoles.name}"]
}

resource "aws_iam_role" "WebRoles" {
    name = "WebRoles"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "WebPerm" {
    name = "WebPerm"
    path = "/"
    description = "WebServer Permission"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "webattach" {
    name = "webattach"
    roles = ["${aws_iam_role.WebRoles.name}"]
    policy_arn = "${aws_iam_policy.WebPerm.arn}"
}

