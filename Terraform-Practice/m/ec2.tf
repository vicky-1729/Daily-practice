resource "aws_instance" "test_server" {
  instance_type          = var.instance_type
  ami                    = var.ami_id
  vpc_security_group_ids = var.sg_ids
  tags = var.tags
}