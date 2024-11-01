data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["099720109477"]

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-*"]
  }
}

resource "aws_instance" "myec2" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.instance_type
  key_name      = var.ssh_key_name
  availability_zone = var.availability_zone
  security_groups = ["${var.sg_name}" ]
  tags = var.tag_ec2_instance

  provisioner "local-exec" {
    command = "echo PUBLIC IP : ${var.eip} >> ip_ec2.txt"
  }

  provisioner "remote-exec" {
    inline = [ 
      "sudo apt update -y",
      "sudo apt install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]

    connection {
      type = "ssh"
      user = var.user
      private_key = file("PATH/TO/YOUR/KEY/${var.ssh_key_name}.pem")
      host = self.public_ip
    }
  }
}

