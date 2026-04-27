variable "ami_id" {
  type    = string
  default = "ami-0220d79f3f480ecf5"

}

variable "common_tags" {
  default = {
    project = "roboshop"
    terraform = true
  }
}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_name" {
    default = "default-var-name"
}

variable "project" {
  default = "roboshop"
  
}

variable "instances" {
  type = list(string)
  default = [ "mongodb","dynmodb","redis","mysql" ]
}