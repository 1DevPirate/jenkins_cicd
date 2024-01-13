variable "prefix" {
  type    = string
  default = "my-prefix"
}

variable "namespace" {
  type    = string
  default = "my-namespace"
}

variable "test_branch" {
  type    = string
  default = "wesoblue"
}

variable "default_tags" {
  type = map(string)
  default = {
    Name        = "My bucket"
    Environment = "wesoblue"
  }
}

resource "aws_s3_bucket" "pipelineartifactstore" {
  bucket = "${var.prefix}-${var.namespace}-${var.test_branch}-pipeline-artifactstore"
  acl    = "private"
  force_destroy = true

  tags = var.default_tags
}

resource "aws_s3_bucket_server_side_encryption_configuration" "pipelineartifactstore_sse" {
  bucket = aws_s3_bucket.pipelineartifactstore.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
