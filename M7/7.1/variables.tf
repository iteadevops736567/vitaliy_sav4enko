variable "region" {
  description = "aws region"
  default     = "eu-central-1"
}

variable "ingress_ports" {
  type        = list(any)
  description = "allowed incoming ports"
  default     = ["80", "22", "443", "3000"]
}

variable "instance_type" {
  description = "instance type"
  default     = "t2.micro"
}

variable "FR" {
  type    = string
  default = "Frankfurt_AWS"
}
