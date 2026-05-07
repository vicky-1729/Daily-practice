output "pub_ip" {
    value = module.robpshop.public_ip 
}
output "pri_ip" {
  value = module.robpshop.private_ip
}
output "instance_id" {
  value = module.robpshop.instance_id
}