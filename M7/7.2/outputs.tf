
output "aws_ami" {
  value = data.aws_ami.aws_linux_eu_central.name
}

output "aws_availability_zones" {
  value = data.aws_availability_zones.available_zones.names
}

output "FrontEnd_IP" {
  value = aws_eip.M7_first_ip.public_ip
}

output "BackEnd_1_IP" {
  value = aws_eip.M7_second_ip.public_ip
}

output "BackEnd_2_IP" {
  value = aws_eip.M7_third_ip.public_ip
}

output "M7_Sec_Group" {
  value = data.aws_security_group.M7_Sec_Group.id
}

