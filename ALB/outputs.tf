output "LB_INTERNAL_NAME" {
    value = aws_lb.internal.dns_name
}

output "LB_PUBLIC_NAME" {
    value = aws_lb.public.dns_name
}