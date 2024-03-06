resource "aws_security_group" "sgrp" {
    name = var.name
    description = var.description
    vpc_id = var.vpc_id

    tags = {
      Name = var.sgrp_tag
    }
}

resource "aws_security_group_rule" "my_rule" {
  for_each                 = var.sgrp_rules
  description              = each.key
  type                     = each.value[0]
  from_port                = each.value[1]
  to_port                  = each.value[2]
  protocol                 = each.value[3]
  cidr_blocks              = length(each.value[4]) <= 18 ? [each.value[4]] : null
  source_security_group_id = startswith(each.value[4], "sgrp-") ? each.value[4] : null
  security_group_id        = aws_security_group.sgrp.id
}