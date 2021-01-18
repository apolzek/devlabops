output "dns_name" {
  value = aws_instance.web.public_dns
}
output "private_ip" {
  value = aws_instance.web.private_ip
}

output "dns_name_west" {
  value = aws_instance.web_west.public_dns
}
output "private_ip_west" {
  value = aws_instance.web_west.private_ip
}