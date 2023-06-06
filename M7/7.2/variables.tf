variable "region" {
  description = "aws region"
  default     = "eu-central-1"
}

variable "instance_type" {
  description = "instance type"
  default     = "t2.micro"
}

variable "FR" {
  type    = string
  default = "Frankfurt_AWS"
}
