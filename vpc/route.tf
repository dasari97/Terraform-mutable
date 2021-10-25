resource "aws_route_table" "public_routeTable" {
  vpc_id = aws_vpc.vpc.id

  route = []

  tags = {
    Name = "Public_RT_${var.env}-vpc"
  }
}

resource "aws_route_table" "private_routeTable" {
  vpc_id = aws_vpc.vpc.id

  route = []

  tags = {
    Name = "Private_RT_${var.env}-vpc"
  }
}

resource "aws_route" "Public-peer-add" {
  route_table_id            = aws_route_table.public_routeTable.id
  destination_cidr_block    = var.default_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peer1.id
}

resource "aws_route" "Private-peer-add" {
  route_table_id            = aws_route_table.private_routeTable.id
  destination_cidr_block    = var.default_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peer1.id
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public.*.id)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public_routeTable.id
}

resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private.*.id)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.private_routeTable.id
}

output "out" {
  value = local.all_vpc_cidr
}