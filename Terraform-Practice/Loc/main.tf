# # security groups
# resource "resoucre_type" "custom_name" {
# }

resource "aws_instance" "test_server" {
  for_each = var.instances
  instance_type          = each.value
  ami                    = var.ami_id
  vpc_security_group_ids = [aws_security_group.allow-all.id]
  tags = local.tag
}

resource "aws_security_group" "allow-all" {
  name        = ""
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = {
    Name = "allow_all"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # all ports 
    cidr_blocks      = var.cidr_blocks
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