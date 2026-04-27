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
    default = "default-var-name"
}

variable "env" {
  type    = string
  default = "prod"
}
variable "instances" {
  default = {
    mongodb   = "t2.micro"
    catalogue = "t3.small"
    redis     = "t2.micro"
  }
}

variable "project" {
  type = string
  default = "Roboshop"
}



variable "component" {
  type = string
  default = "cart"
}
variable "common_tags" {
  type = map(string)
  default = {
   project = "roboshop"
   terraform = true
  }
  
}

# variable "final_name" {
  
#   default = "${var.project}-${var.env}-${var.component}"
# }