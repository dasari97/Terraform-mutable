locals {
    public_cidr  = [tolist(var.vpc_public_cidr, ""])
    all_vpc_cidr = concat(var.vpc_privarte_cidr, local.public_cidr)
}