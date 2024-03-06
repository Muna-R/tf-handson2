resource "aws_lb_target_group" "target_group" {
    vpc_id = var.vpc_id
    name = var.tgrp_name
    port = var.trgp_port
    protocol = var.tgrp_protocol


    tags = {
        name = var.tgrp_tag
    }
  
}

resource "aws_lb_target_group_attachment" "ec2_attachment" {
  count = length(var.instance_ids)
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id = var.instance_ids[count.index]
  
}