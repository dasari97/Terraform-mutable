resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_public_cidr
  
tags               = {
    Name           = "${var.env}_vpc"
    
}
}
