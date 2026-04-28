

resource "aws_instance" "roboshop" {
  ami           = var.ami_id # Required: Amazon Machine Image ID
  instance_type = "t2.micro"              # Required: Instance size
  vpc_security_group_ids =[aws_security_group.example.id] 
  tags = {
    Name = var.sg_tags
  }

  provisioner "local-exec" {
    command = "echo The server IP address is ${self.private_ip} > ip.text"
    on_failure = continue
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo 'Deleting the server'"
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = "${self.public_ip}"
  }
 provisioner "remote-exec" {
    inline = [
    "sudo dnf install nginx -y",
    "sudo systemctl start nginx"
    ]
  }
 provisioner "remote-exec" {
  when = destroy
    inline = [
    "sudo systemctl stop nginx",
    "sudo dnf remove nginx -y",
    "echo 'Deleting the server'"
    ]
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