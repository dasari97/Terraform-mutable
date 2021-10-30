output "LB_INTERNAL_NAME" {
    value = aws_lb.Internal.dns_name
}

output "LB_PUBLIC_NAME" {
    value = aws_lb.public.dns_name
}

output "Internal-Listener" {
    value = aws_lb_listener.Internal-Listener.arn
}

output "Public-LB-ARN" {
    value = aws_lb.public.arn
}