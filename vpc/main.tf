resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_public_cidr
  
tags               = {
    Name           = "${var.env}_vpc"
    
}
}

resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.vpc_private_cidr
}