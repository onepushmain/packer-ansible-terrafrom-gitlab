variable "instance_type" {
  type    = string
  default = "t3.nano"
}

variable "subnet_id" {
  description = "subnet ID from VPC"
  type        = string
  default     = "subnet-xxxxx"
}

variable "security_groups" {
  type    = list(string)
  default = ["sg-xxxxx"]
}
