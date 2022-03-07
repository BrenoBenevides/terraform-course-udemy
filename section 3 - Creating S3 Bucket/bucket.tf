locals {
  bucket_name = "terraform-test-bucket-breno"
  filename    = "some_file.txt"
  prefix      = "some_dir"
}

resource "aws_s3_bucket" "test-bucket" {

  bucket = "terraform-test-bucket-breno"
  tags = { type = "test",
    managed-by = "terraform"
    creator    = "breno benevides"
  }
}

resource "aws_s3_bucket_object" "some_file" {

  bucket = local.bucket_name
  key    = join("/", [local.prefix, local.filename])
  content = "name: breno italo lima benevides"
}

resource "aws_s3_bucket_object" "some_file1" {

  bucket = local.bucket_name
  key    = join("/", [local.prefix,"second",local.filename])
  content = "name: breno italo lima benevides"
}