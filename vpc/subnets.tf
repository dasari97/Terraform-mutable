resource "aws_subnet" "public" {
  count      = length(var.subnet_public_cidr)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = element(var.subnet_public_cidr, count.index)

  tags = {
    Name = "public_subnet_${count.index +1}"
  }
}