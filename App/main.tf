
provider "aws" {
  region     = "us-east-1"
  access_key = "PUT YOUR OWN KEY"
  secret_key = "PUT YOUR OWN KEY"
}

terraform {
  backend "s3" {
    bucket = "terraform-backend-grace"
    key    = "mini_projet_tf.tfstate"
    region = "us-east-1"
    access_key = "PUT YOUR OWN KEY"
    secret_key = "PUT YOUR OWN KEY"
  }
}

module "security_group" {
  source = "../Modules/sg_module"
}

module "ebs_volume" {
  source = "../Modules/ebs-module"
  ebs_size = 10
}

module "ec2_eip" {
  source = "../Modules/eip_module"
}

module "ec2_instance" {
  source = "../Modules/ec2-module"
  eip = module.ec2_eip.eip
  sg_name = module.security_group.security_group_name
}

resource "aws_eip_association" "ec2_eip_association" {
  instance_id = module.ec2_instance.ec2_instance_id
  allocation_id = module.ec2_eip.eip_id
}

resource "aws_volume_attachment" "ec2_ebs_attachement" {
  device_name = "/dev/sdh"
  volume_id = module.ebs_volume.ebs_volume_id
  instance_id = module.ec2_instance.ec2_instance_id
}