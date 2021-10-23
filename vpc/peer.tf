resource "aws_vpc_peering_connection" "peer1" {
  peer_owner_id = "795902710157"
  peer_vpc_id   = aws_vpc.vpc.id
  vpc_id        = "vpc-7f384202"
  auto_accept   = true
}