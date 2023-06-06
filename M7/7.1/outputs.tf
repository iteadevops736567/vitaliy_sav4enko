
output "aws_ami" {
  value = data.aws_ami.aws_linux_eu_central.name
}

output "aws_availability_zones" {
  value = data.aws_availability_zones.available_zones.names
}

output "elastic_ip_1" {
  value = aws_eip.M7_first_ip.public_ip
}

output "elastic_ip_2" {
  value = aws_eip.M7_second_ip.public_ip
}

