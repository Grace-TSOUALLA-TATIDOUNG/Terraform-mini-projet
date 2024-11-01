
output "eip" {
  value = aws_eip.myec2_eip.public_ip
}

output "eip_id" {
  value = aws_eip.myec2_eip.id
}