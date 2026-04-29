variable "ami_id" {
  type    = string
  default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}
# mandaroty
variable "tags" {
  type = map(string)
}

variable "sg_ids" {
  type = list(string)
}
# variable "env" {
#   type    = string
#   default = "prod"
# }