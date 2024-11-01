
variable "instance_type" {
  type = string
  default = "a1.medium"
}

variable "tag_ec2_instance" {
  type = map(string)
  default = {
    Name = "ec2_tf_mini_projet"
  }
}

variable "ssh_key_name" {
  type = string
  default = "Devops-Grace"
}

variable "availability_zone" {
  type = string
  default = "us-east-1a"
}

variable "sg_name" {
  type = string
  default = null
}

variable "eip" {
  type = string
  default = null
}

variable "user"{
  type = string
  default = "ubuntu"
}