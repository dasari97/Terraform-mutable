resource "aws_spot_instance_request" "mongodb" {
  ami           = data.aws_ami.ami.id
  instance_type = var.mongodb_instance_type
  subnet_id     = data.terraform_remote_state.vpc.outputs.private_subnet_ids[0]
  

  tags = {
    Name = "Mongodb-${var.env}"
  }
}

resource "aws_ec2_tag" "mongodb" {
  resource_id = aws_spot_instance_request.mongodb.id
  key         = "Name"
  value       = "Mongodb-${var.env}"
}