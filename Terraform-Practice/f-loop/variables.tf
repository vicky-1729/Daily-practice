variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
}

# variable "Instances" {
#     type = map(string)
#     default = {
#         mongodb = "t2.micro"
#         mongodb = "t3.micro"
#         mysql = "t3.small"
#     }
# }

variable "Instances" {
  type = list(string)
  default = [ "mongodb","mongodb" ,"mysql"]
}

variable "env" {
    type = string
    default = "dev"
}


