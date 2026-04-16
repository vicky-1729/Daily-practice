# # security groups
# resource "resoucre_type" "custom_name" {
# }

resource "aws_security_group" "allow-all" {
  name        = "allow_all"
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = {
    Name = "allow_all"
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # all ports 
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # all ports 
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}