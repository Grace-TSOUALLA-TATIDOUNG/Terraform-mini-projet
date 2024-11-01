
variable "ebs_size" {
  type = number
  default = 8
}

variable "availability_zone" {
  type = string
  default = "us-east-1a"
}

variable "ebs_name" {
  type = string
  default = "ec2_tf_ebs_volume"
}