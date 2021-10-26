resource "aws_spot_instance_request" "mongodb" {
  ami           = data.aws_ami.ami.id
  instance_type = var.instance_type
  

  tags = {
    Name = "Mongodb"
  }
}

resource "aws_ec2_tag" "mongodb" {
  resource_id = aws_spot_instance_request.mongodb.id
  key         = "Name"
  value       = "Mongodb"
}