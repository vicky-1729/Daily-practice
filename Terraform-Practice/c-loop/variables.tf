variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
}

variable "Instances" {
    type = list(string)
    default = ["mongodb","dynamodb","redis","mysql"]
}

variable "env" {
    type = string
    default = "dev"
}


variable "common_tags" {
    type = map(string)
    default = {
      project = "roboshop"
      terraform = true
      version = "1.0.1"
    }
  
}

variable "tags" {
  type = map(string)
  default = {
    component = "mongodb"
  }
}