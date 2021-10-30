resource "aws_lb_listener" "Public-Listener" {
  count   = var.is_internal == "true" ? 0 : 1
  load_balancer_arn = data.terraform_remote_state.ALB.outputs.Public-LB-ARN
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-group.arn
  }
    
}