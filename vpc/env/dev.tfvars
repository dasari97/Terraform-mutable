env                 = "dev"
vpc_public_cidr     = "10.255.0.0/24"
vpc_private_cidr    = ["10.0.0.0/22"]
subnet_public_cidr  = ["10.255.0.0/25", "10.255.0.128/25"]
subnet_private_cidr = ["10.0.0.0/23", "10.0.2.0/23" ]
AZS                 = ["us-east-1a", "us-east-1b"]
default_vpc         = "vpc-7f384202"