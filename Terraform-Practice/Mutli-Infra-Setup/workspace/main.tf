
resource "aws_instance" "roboshop" {
  count = length(var.Instance_Name)
  ami           = var.ami_id # Required: Amazon Machine Image ID
  instance_type = lookup(var.instance_type,terraform.workspace,"t3.small"  )       # Required: Instance size
  vpc_security_group_ids =[aws_security_group.example.id] 
  tags = merge(
    var.common_tags,{
       Name ="${var.Instance_Name[count.index]}-${terraform.workspace}-server"
    }
  )
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