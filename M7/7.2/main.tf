provider "aws" {
  region     = "eu-central-1"
}

# Create DB Instance
resource "aws_instance" "M7_db_instance" {
  ami                    = data.aws_ami.aws_linux_eu_central.id
  instance_type          = var.instance_type
  key_name               = var.FR
  vpc_security_group_ids = [data.aws_security_group.M7_Sec_Group.id]
  availability_zone      = data.aws_availability_zones.available.names[0]


  tags = {
    Name = "M7_db_instance"
    ServerType = "db_server"
  }
}

# Create first backend Instances
resource "aws_instance" "M7_first_backend_instance" {
  ami                    = data.aws_ami.aws_linux_eu_central.id
  instance_type          = var.instance_type
  key_name               = var.FR
  vpc_security_group_ids = [data.aws_security_group.M7_Sec_Group.id]
  availability_zone      = data.aws_availability_zones.available_zones.names[0]


  tags = {
    Name = "M7_first_backend "
    ServerType = "backend"
  }
  depends_on = [aws_instance.M7_db_instance]
}

# Create second backend Instances
resource "aws_instance" "M7_second_backend_instance" {
  ami                    = data.aws_ami.aws_linux_eu_central.id
  instance_type          = var.instance_type
  key_name               = var.FR
  vpc_security_group_ids = [data.aws_security_group.M7_Sec_Group.id]
  availability_zone      = data.aws_availability_zones.available_zones.names[1]


  tags = {
    Name = "M7_second_backend "
    ServerType = "backend"
  }
  depends_on = [aws_instance.M7_db_instance]
}

# Create frontend Instances
resource "aws_instance" "M7_frontend_instance" {
  ami                    = data.aws_ami.aws_linux_eu_central.id
  instance_type          = var.instance_type
  key_name               = var.FR
  vpc_security_group_ids = [data.aws_security_group.M7_Sec_Group.id]
  availability_zone      = data.aws_availability_zones.available_zones.names[0]


  tags = {
    Name = "M7_FrontEnd "
    ServerType = "frontend"
  }
  depends_on = [aws_instance.M7_first_backend_instance]
}


# Create additional volume for DB Instance
resource "aws_ebs_volume" "db_volume" {
  availability_zone = data.aws_availability_zones.available.names[0]
  size              = 1

  tags = {
    Name = "First additional volume"
  }
}

# Attach additional volume for DB Instance
resource "aws_volume_attachment" "M7_att_1" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.db_volume.id
  instance_id = aws_instance.M7_db_instance.id
}

#FrontEnd IP
resource "aws_eip" "M7_first_ip" {
  domain  = "vpc"
   tags = {
    Name = "M7 second IP"
  }
}

#BackEnd 1 IP
resource "aws_eip" "M7_second_ip" {
  domain  = "vpc"
   tags = {
    Name = "M7 first IP"
  }
}

#FBackEnd 2 IP
resource "aws_eip" "M7_third_ip" {
  domain  = "vpc"
   tags = {
    Name = "M7 third IP"
  }
}

#Associate FrontEnd IP
resource "aws_eip_association" "M7_first_association" {
  instance_id   = aws_instance.M7_frontend_instance.id
  allocation_id = aws_eip.M7_first_ip.id
}

#Associate BackEnd 1 IP
resource "aws_eip_association" "M7_second_association" {
  instance_id   = aws_instance.M7_first_backend_instance.id
  allocation_id = aws_eip.M7_second_ip.id
}

#Associate BackEnd 2 IP
resource "aws_eip_association" "M7_third_association" {
  instance_id   = aws_instance.M7_second_backend_instance.id
  allocation_id = aws_eip.M7_third_ip.id
}
