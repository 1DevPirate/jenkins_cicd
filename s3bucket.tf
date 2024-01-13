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
  bucket = "${var.prefix}-${var.namespace}-${var.wesoblue}-pipeline-artifactstore"
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
