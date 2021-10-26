output "VPC_ID" {
    value = aws_vpc.vpc.id
}

output "public_subnet_ids" {
    value = aws_subnet.public.*.id
}

output "private_subnet_ids" {
    value = aws_subnet.private.*.id
}

output "vpc_cidr" {
    value = local.all_vpc_cidr
}

output "public_subnet_cidrs" {
    value = aws_subnet.public.*.cidr_block
}

output "private_subnet_cidrs" {
    value = aws_subnet.private.*.cidr_block
}

output "default_vpc_id" {
    value = var.default_vpc
}

output "default_vpc_cidr" {
    value = var.default_vpc_cidr
}