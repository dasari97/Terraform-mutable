data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "^Centos-7*"
  owners           = ["973714476881"]
  }
  
data "terraform_remote_state" "vpc" {
  backend = "s3" 

  config = {
    bucket = "dasari1998"
    key    = "Terraform-mutable/vpc/${var.env}/${var.env)_state_file_backup"
    region = "us-east-1"
  }
}