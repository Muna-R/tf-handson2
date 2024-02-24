resource "aws_subnet" "private_subnet" {
   vpc_id = var.vpc_id
   cidr_block = var.cidr_block
   availability_zone = var.availability_zone
   map_customer_owned_ip_on_launch = var.map_private_ip_on_launch
   tags = {
     Name = var.subnet_tag
   }
  
}