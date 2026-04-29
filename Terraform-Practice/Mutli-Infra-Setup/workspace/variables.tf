variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
    type = map(string)
    default = {
        dev = "t2.micro"
        prod = "t3.small"
    }
}

variable "Instance_type" {
    type = list(string)
    default = ["mongodb", "redis"]
    
}
# variable "env" {
#     type = string
  
# }

variable "common_tags" {
  type = map(string)
  default = {
    project = "roboshop"
    terraform= true
    version= "1.2.1"
  }
}


