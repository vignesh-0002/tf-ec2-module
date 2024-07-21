output "vpc_id" {
  value = aws_vpc.main.id
}

output "Public_subnet_id" {
  value = aws_subnet.public_sn.id
}

output "Private_subnet_id" {
  value = aws_subnet.private_sn_1.id
}

output "private_subnet_id_2" {
  value = aws_subnet.private_sn_2.id
}

output "database_sn_id" {
  value = aws_subnet.database_sn.id
}