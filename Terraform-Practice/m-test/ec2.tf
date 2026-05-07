module "robpshop" {
  source = "/Users/vicky/Documents/Git-Repos/Daily-practice/Terraform-Practice/m"
  tags = {
    Name = "my-instance"
  }
  sg_ids = ["sg-0b03840d19fc5bb2a"]
}