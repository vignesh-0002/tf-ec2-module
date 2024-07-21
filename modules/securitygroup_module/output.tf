output "ems_ops_public_sg" {
  value = aws_security_group.ems_ops_public_sg.id
}

output "ems_ops_private_sg" {
  value = aws_security_group.ems_ops_private_sg.id
}