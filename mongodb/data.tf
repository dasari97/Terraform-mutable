data "aws_ami" "ami" {
  executable_users = ["self"]
  most_recent      = true
  name_regex       = "^centos7"
  owners           = ["973714476881"]
  }