data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "^Centos-7*"
  owners           = ["973714476881"]
  }
  
data "terraform_remote_state" "vpc" {
  backend = "s3" 

  config = {
    bucket = "dasari1998"
    key    = "Terraform-mutable/vpc/${var.env}/${var.env}_state_file_backup"
    region = "us-east-1"
  }
}

data "aws_secretsmanager_secret" "Dev_secret" {
  arn = "arn:aws:secretsmanager:us-east-1:795902710157:secret:dev-fDI5DH"
}

data "aws_secretsmanager_secret_version" "Dev_secret" {
  secret_id = data.aws_secretsmanager_secret.Dev_secret.id
}

output "secret" {
  value = aws_secretsmanager_secret_version.Dev_secret
  sensitive = true
}