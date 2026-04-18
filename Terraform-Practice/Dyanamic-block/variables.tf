variable "sg_name" {
    type = string
    default = "allow-all"
    
}

variable "description" {
    type = string
    default = "test-sg"
  
}

variable "ingress_ports" {
  type = list(number)
  default = [ 80 ,22,443 ]
}
variable "egress_ports" {
  type = list(number)
  default = [ 8080 ,2202,443 ]
}