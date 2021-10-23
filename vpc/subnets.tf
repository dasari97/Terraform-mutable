resource "aws_subnet" "public" {
  count      = length(var.subnet_public_cidr)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = element(var.subnet_public_cidr, count.index)
  availability_zone = element(var.AZS, count.index)

  tags = {
    Name = "public_subnet_${var.env}_${count.index +1}"
  }
}

resource "aws_subnet" "private" {
  count      = length(var.subnet_private_cidr)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = element(var.subnet_private_cidr, count.index)
  availability_zone = element(var.AZS, count.index)

  tags = {
    Name = "private_subnet__${var.env}_${count.index +1}"
  }
}