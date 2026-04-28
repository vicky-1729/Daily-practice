# # security groups
# resource "resoucre_type" "custom_name" {
# }

resource "aws_instance" "test_server" {

  instance_type          = var.env == "prod" ? "t2.micro":"t2.micro"
  ami                    = var.ami_id
  vpc_security_group_ids = [aws_security_group.allow-all.id]
  tags = var.tags

}

resource "aws_security_group" "allow-all" {
  name        = "allow-all"
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = {
    Name = "allow_all"
  }

  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol # all ports 
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol # all ports 
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}