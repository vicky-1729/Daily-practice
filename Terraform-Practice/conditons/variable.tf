variable "ami_id" {
  type    = string
  default = "ami-0220d79f3f480ecf5"

}

# variable "tags" {
#   type = map(string)
#   default = {
#     purpose = "demo"
#     name    = "test-server"
#   }

# }
variable "tags" {
  type = map(string)
  default = {
    Name = "allow-all"
  }
  
}
variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_name" {
    default = "default-var-name"
}

variable "env" {
  type    = string
  default = "prod"
}
variable "from_port" {
  type = number
  default = 0
}
variable "to_port" {
  type = number
  default = 0
}
variable "protocol" {
  type = string
  default = "-1"
}
