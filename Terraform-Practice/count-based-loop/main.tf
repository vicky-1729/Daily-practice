# # security groups
# resource "resoucre_type" "custom_name" {
# }

resource "aws_instance" "test_server" {
  count = 4
  instance_type          = var.env == "dev" ? "t2.micro" : "t3.small"
  ami                    = var.ami_id
  vpc_security_group_ids = [aws_security_group.allow-all.id]
  tags = {
    Name = "Dev-${var.instances[count.index]}"
  }

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