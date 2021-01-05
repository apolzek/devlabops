output "dns_name" {
  value = aws_instance.web.public_dns
}
output "private_ip" {
  value = aws_instance.web.private_ip
}