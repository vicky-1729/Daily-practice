resource "aws_instance" "this" {
  instance_type          = var.instance_type
  ami                    = var.ami_id
  vpc_security_group_ids = var.sg_ids
  tags = var.tags
}