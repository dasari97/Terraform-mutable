resource "aws_lb_target_group" "test" {
  name     = "${var.component}-${var.env}_TG"
  port     = var.port
  protocol = "HTTP"
  vpc_id      = data.terraform_remote_state.vpc.outputs.VPC_ID
}