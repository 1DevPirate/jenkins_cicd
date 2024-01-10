# Setting up VPC
//network.tf
resource "aws_vpc" "blueteam" {
  cidr_block = "10.0.0.0/24"
  enable_dns_hostnames = true
  enable_dns_support = true
  }
