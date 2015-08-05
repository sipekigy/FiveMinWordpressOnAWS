resource "aws_s3_bucket" "webpool" {
    bucket = "webpool"
    acl = "private"

    tags {
        Name = "Web bucket"
        Environment = "ProdWeb"
    }
}
