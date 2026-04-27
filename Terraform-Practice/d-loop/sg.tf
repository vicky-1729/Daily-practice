
resource "aws_security_group" "example" {
  # ... other configuration ...

    name = "allow-all"
    description = "creating sg for all ports"
    tags = {
      default = "allow-all-ports"
    }

    dynamic "ingress" {
      for_each = var.ingress
      content {
          from_port        = ingress.value
          to_port          = ingress.value
          protocol         = "-1"
          cidr_blocks      = ["0.0.0.0/0"]
          ipv6_cidr_blocks = ["::/0"]
      }
    }

  

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}