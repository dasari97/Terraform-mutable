locals {
    vpc_cidr = [data.terraform_remote_state.vpc.outputs.vpc_cidr, data.terraform_remote_state.vpc.outputs.default_vpc_cidr]
}