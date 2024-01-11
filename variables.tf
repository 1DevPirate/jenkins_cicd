variable "aws_access_key" {
  description = "AWS access key"
  type        = string
  default     = ""
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  default     = ""
}

variable "aws_key_pair" {
  description = "blue.pubk"
  type        = string
  default     = ssh-rsa pub AAAAB3NzaC1yc2EAAAADAQABAAABgQC3XAZF1otxtBntasJDP+IPDq1shN9n1xXYcS4zaPxEygAtU9m1THY8A5jgHRdEoApngAmviZNGHAke8VwyDdb+76XPuhlkJYRA8D7LLqnN12ptz3UZbd/swa4ObfAIpr+bcrwZWFC1+MS/HqA6TKt5ss8zdtChZaidKAKfsiqOPdIm82/p/EJDmEZmw0r/EhXatk8QsyG3101kMjFUfgerREkeI84tXTQE38Zu4e3poPTIHWWFCYt4EA2bVMadNo1c9H2rH8or2HgBdlz5xZa/RiBpDQYphOUvN1Tb7n01lNnyWzdLn9ibcROor97iMnQXmgkRwn7numa/Eg1pQbXmLfwUEVO3EiMdzXAwvF1VCMEObBMQ3lOGfxsj9t7NNYoJIIFD/59G6+EzcFXcuMCjBsp2Rt80T4wETIU9dHuQPlYp6cigzWJTIIPKIrk7cS2VzuWbQTone8V9YKuuocJsSxajMhH88k4g2kZ3z0dFN3FUpDKelfGAQpqo2x5Eq2c= choni@matrix
}


variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}


variable "ami" {
   type        = string
   description = "Ubuntu AMI ID"
   default     = "ami-0c7217cdde317cfec"
}

variable "instance_type" {
   type        = string
   description = "Instance type"
   default     = "t2.micro"
}

variable "name_tag" {
   type        = string
   description = "Name of the EC2 instance"
   default     = "wesoBlue"
}
