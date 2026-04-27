variable "ami_id" {
    type = string
    default = "ami-0c55b159cbfafe1f0"
    description = "ami_id_of instance"
}
# optional
variable "instance_type" {
   type = string
   default = "t2.micro"
   
}
# provide mandorty
variable "tags" {
    type = string
}