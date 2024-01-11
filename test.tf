# this a test 
resource "aws_security_group" "blueteam" {
       name        = "blueteam"
       description = "Some description"
       vpc_id      = "${aws_vpc.blueteam.id}"
       }

       #Not redundant - Because a new security group has no inbound rules.
       ingress {
         from_port   = "22"
         to_port     = "22"
         protocol    = "TCP"
         cidr_blocks = ["98.45.139.47/32"]
       }

       #Isn't this redundant?    
       egress {
         from_port   = 0
         to_port     = 0
         protocol    = "-1"
         cidr_blocks = ["0.0.0.0/0"]
       }
}
