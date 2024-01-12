resource "aws_security_group" "my_sg" {
       name        = "my_sg"
       description = "allow ssh access"
<<<<<<< HEAD
       vpc_id      = "blueteam"
=======
       vpc_id      = "vpc-03e79092478532666"
>>>>>>> 3a0637e (updated ssh.tf vpc id)

       #Not redundant - Inbound Access
       ingress {
         from_port   = "22"
         to_port     = "22"
         protocol    = "TCP"
         cidr_blocks = ["73.116.216.200/32","76.102.161.122/32","98.45.139.47/32"]
       }

       # Outbound Access    
       egress {
         from_port   = 0
         to_port     = 0
         protocol    = "-1"
         cidr_blocks = ["0.0.0.0/0"]
       }
}
