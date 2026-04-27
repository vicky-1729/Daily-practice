data "aws_ami" "test" {

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
}

output "ami_id" {
  value = data.aws_ami.test.id
}