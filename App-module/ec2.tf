resource "aws_instance" "od_ins" {
    count = var.od_ins
    ami   = data.aws_ami.ami.id
    instance_type = var.instance_type
    subnet_id     = element(data.terraform_remote_state.vpc.outputs.private_subnet_ids, count.index)
    vpc_security_group_ids = [aws_security_group.app.id]
    
    tags = {
    Name = "${var.component}-${var.env}"
    Monitor = "yes"
  }
    
}

resource "aws_spot_instance_request" "spot_ins" {
  count         = var.spot_ins
  ami           = data.aws_ami.ami.id
  instance_type = var.instance_type
  subnet_id     = element(data.terraform_remote_state.vpc.outputs.private_subnet_ids, count.index)
  vpc_security_group_ids = [aws_security_group.app.id]
  wait_for_fulfillment   = true
  

  tags = {
    Name = "${var.component}-${var.env}"
  }
}

resource "aws_ec2_tag" "spot_ins" {
  count     =  var.spot_ins
  resource_id = element(aws_spot_instance_request.spot_ins.*.spot_instance_id, count.index)
  key         = "Name"
  value       = "${var.component}-${var.env}"
}

resource "aws_ec2_tag" "spot_ins_tag" {
  count       = var.spot_count
  resource_id = element(aws_spot_instance_request.spot_ins.*.spot_instance_id, count.index)
  key         = "Monitor"
  value       = "yes"
}

resource "aws_security_group" "app" {
  name        = "${var.component}-${var.env}"
  description = "Allow ${var.component}"
  vpc_id      = data.terraform_remote_state.vpc.outputs.VPC_ID 

  ingress = [
    {
      description      = "ssh"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = local.all_vpc_cidr
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      self             = false
      security_groups  = []
    },
    
    {
      description      = "8080 app port"
      from_port        = var.port
      to_port          = var.port
      protocol         = "tcp"
      cidr_blocks      = data.terraform_remote_state.vpc.outputs.vpc_cidr
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      self             = false
      security_groups  = []
    },
    
     {
      description      = "PROMETHEUS"
      from_port        = 9100
      to_port          = 9100
      protocol         = "tcp"
      cidr_blocks      = local.all_vpc_cidr
      ipv6_cidr_blocks = []
      self             = false
      prefix_list_ids  = []
      security_groups  = []
    }
  ]

  egress = [
    {
      description      = "ALL"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      self             = false
      security_groups  = []
    }
  ]

  tags = {
    Name = "${var.component}-${var.env}"
  }
}
