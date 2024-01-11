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

#
resource "aws_key_pair" "blue.pubk" {
  key_name    = "blue.pubk"
  public_key  = "ssh-rsa pub AAAAB3NzaC1yc2EAAAADAQABAAABgQC3XAZF1otxtBntasJDP+IPDq1shN9n1xXYcS4zaPxEygAtU9m1THY8A5jgHRdEoApngAmviZNGHAke8VwyDdb+76XPuhlkJYRA8D7LLqnN12ptz3UZbd/swa4ObfAIpr+bcrwZWFC1+MS/HqA6TKt5ss8zdtChZaidKAKfsiqOPdIm82/p/EJDmEZmw0r/EhXatk8QsyG3101kMjFUfgerREkeI84tXTQE38Zu4e3poPTIHWWFCYt4EA2bVMadNo1c9H2rH8or2HgBdlz5xZa/RiBpDQYphOUvN1Tb7n01lNnyWzdLn9ibcROor97iMnQXmgkRwn7numa/Eg1pQbXmLfwUEVO3EiMdzXAwvF1VCMEObBMQ3lOGfxsj9t7NNYoJIIFD/59G6+EzcFXcuMCjBsp2Rt80T4wETIU9dHuQPlYp6cigzWJTIIPKIrk7cS2VzuWbQTone8V9YKuuocJsSxajMhH88k4g2kZ3z0dFN3FUpDKelfGAQpqo2x5Eq2c= choni@matrix"
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

