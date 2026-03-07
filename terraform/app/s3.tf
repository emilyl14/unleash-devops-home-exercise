resource "aws_s3_bucket" "app" {
  bucket = var.s3_bucket_name

  tags = {
    Name = var.s3_bucket_name
  }
}
