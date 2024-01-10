# Setting up VPC
//network.tf
resource "aws_vpc" "blueteam" {
  cidr_block = "10.0.0.0/24"
  enable_dns_hostnames = true
  enable_dns_support = true
  }

# Setting up the subnets
//subnets.tf
resource "aws_subnet" "subnet-uno" {
  cidr_block = "${cidrsubnet(aws_vpc.blueteam.cidr_block, 3, 1)}"
  vpc_id = "${aws_vpc.blueteam.id}"
  availability_zone = "us-east-1a"
}

# Setting up the security groups
//security.tf
resource "aws_security_group" "ingress-all-test" {
name = "allow-all-sg"
vpc_id = "${aws_vpc.blueteam.id}"
ingress {
    cidr_blocks = [
      "10.10.10.0/24"
    ]
from_port = 22
    to_port = 22
    protocol = "tcp"
  }
}

