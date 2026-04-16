# # security groups
# resource "resoucre_type" "custom_name" {
# }

resource "aws_instance" "test_server" {
    
    instance_type = "t3.micro"
    ami = "ami-0220d79f3f480ecf5"
    vpc_security_group_ids = [ aws_security_group.allow-all.id ]

    tags = {
        Name = "Test-Server"
    }

}

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