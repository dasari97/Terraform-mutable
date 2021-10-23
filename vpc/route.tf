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

resource "aws_route" "default_to_public" {
  route_table_id            = var.default_RT_id
  destination_cidr_block    = var.vpc_public_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peer1.id
}

resource "aws_route" "default_to_private" {
  route_table_id            = var.default_RT_id
  destination_cidr_block    = var.vpc_private_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peer1.id
}