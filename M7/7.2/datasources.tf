
data "aws_ami" "aws_linux_eu_central" {
  owners      = ["137112412989"]
  most_recent = true
  filter {
    name   = "name"
    values = ["al????-ami-????.?.????????.?-kernel-6.1-x86_64"]
  }
}

data "aws_availability_zones" "available_zones" {
  state = "available"
}

data "aws_availability_zones" "available" {}

data "aws_security_group" "M7_Sec_Group" {
  name = "M7_Security_Group"
}








