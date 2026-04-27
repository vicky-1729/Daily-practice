variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
}

variable "sg_tags" {
    type = string
    default = "allow all"
}

variable "env" {
    type = string
    default = "dev"
  
}