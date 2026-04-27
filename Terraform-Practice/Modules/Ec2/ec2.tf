resource "aws_instance" "roboshop" {
  ami           = var.ami_id# Replace with a valid AMI ID for your region
  instance_type = var.instance_type
  
  tags = {
    Name = var.tags
  }
}