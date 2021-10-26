resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "redis-${var.env}"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis6.x"
  engine_version       = "6.x"
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.subnet-group.name
}

resource "aws_elasticache_subnet_group" "subnet-group" {
  name       = "redis-${var.env}"
  subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnet_ids
}