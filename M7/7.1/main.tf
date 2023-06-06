provider "aws" {
  region     = "eu-central-1"
}

# Create first instance
resource "aws_instance" "M7_first_instance" {
  ami                    = data.aws_ami.aws_linux_eu_central.id
  instance_type          = var.instance_type
  key_name               = var.FR
  vpc_security_group_ids = [aws_security_group.M7_security_group.id]
  availability_zone      = data.aws_availability_zones.available.names[0]


  tags = {
    Name = "M7_first_instance"
  }
}

# Create second instance
resource "aws_instance" "M7_second_instance" {
  ami                    = data.aws_ami.aws_linux_eu_central.id
  instance_type          = var.instance_type
  key_name               = var.FR
  vpc_security_group_ids = [aws_security_group.M7_security_group.id]
  availability_zone      = data.aws_availability_zones.available.names[0]


  tags = {
    Name = "M7_second_instance"
  }
}

# Create first additional volume
resource "aws_ebs_volume" "volume_1" {
  availability_zone = data.aws_availability_zones.available.names[0]
  size              = 1

  tags = {
    Name = "First additional volume"
  }
}
# Create second additional volume
resource "aws_ebs_volume" "volume_2" {
  availability_zone = data.aws_availability_zones.available.names[0]
  size              = 1

  tags = {
    Name = "Second additional volume"
  }
}

# Attach first additional volume
resource "aws_volume_attachment" "M7_att_1" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.volume_1.id
  instance_id = aws_instance.M7_first_instance.id
}

# Attach second additional volume
resource "aws_volume_attachment" "M7_att_2" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.volume_2.id
  instance_id = aws_instance.M7_second_instance.id
}

# Create first elastic IP address
resource "aws_eip" "M7_first_ip" {
  domain  = "vpc"
   tags = {
    Name = "M7 first IP"
  }
}

# Attach first elastic IP address
resource "aws_eip_association" "M7_first_association" {
  instance_id   = aws_instance.M7_first_instance.id
  allocation_id = aws_eip.M7_first_ip.id
}

# Create second elastic IP address
resource "aws_eip" "M7_second_ip" {
  domain  = "vpc"
   tags = {
    Name = "M7 second IP"
  }
}

# Attach second elastic IP address
resource "aws_eip_association" "M7_second_association" {
  instance_id   = aws_instance.M7_second_instance.id
  allocation_id = aws_eip.M7_second_ip.id
}

# Create security group
resource "aws_security_group" "M7_security_group" {
  name        = "M7_security_group"
  description = "M7 security group"

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
