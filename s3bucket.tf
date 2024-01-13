resource "aws_s3_bucket" "example" {
  bucket = "my-tf-s3-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "test-branch"
  }
}

resource "aws_s3_bucket" "pipelineartifactstore" {
  bucket = "${var.prefix}-${var.namespace}-${var.test_branch}-pipeline-artifactstore"
  acl    = "private"
  force_destroy = true

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = var.default_tags
}
