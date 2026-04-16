variable "instance_type" {
  type    = string
  default = "t3.micro"

}
variable "ami_id" {
  type    = string
  default = "ami-0220d79f3f480ecf5"

}

variable "tags" {
  type = map(string)
  default = {
    purpose = "demo"
    name    = "test-server"
  }

}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_name" {
    # default = "default-var-name"
}