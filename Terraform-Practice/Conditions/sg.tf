
resource "aws_instance" "roboshop" {
  ami           = var.ami_id # Required: Amazon Machine Image ID
  instance_type =   var.env == "prod" ? "t2.micro" : "t3.micro"        # Required: Instance size
  vpc_security_group_ids =[aws_security_group.example.id] 
  tags = {
    Name = var.sg_tags
  }
}
resource "aws_security_group" "example" {
  # ... other configuration ...

    name = "allow-all"
    description = "creating sg for all ports"
    tags = {
      default = "allow-all"
    }
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}