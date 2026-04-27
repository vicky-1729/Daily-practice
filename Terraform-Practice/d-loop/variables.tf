# variable "ami_id" {
#     type = string
#     default = "ami-0220d79f3f480ecf5"
# }

# variable "Instances" {
#     type = map(string)
#     default = {
#         mongodb = "t2.micro"
#         redis = "t3.micro"
#         mysql = "t3.small"
#     }
# }

variable "env" {
    type = string
    default = "dev"
}


variable "ingress" {
    type = list(number)
    default = [ 0,22,33,445,555 ]
  
}
variable "egress" {
    type = list(number)
    default = [ 556,226,676,445,555 ]
  
}