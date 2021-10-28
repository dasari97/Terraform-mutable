data "aws_caller_identity" "account_ID" {}

data "aws_route53_zone" "route53" {
  name         = "krishna.roboshop"
  private_zone = true
}