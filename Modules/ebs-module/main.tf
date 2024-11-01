
resource "aws_ebs_volume" "myec2_ebs_volume" {

  availability_zone = var.availability_zone
  size = var.ebs_size
  tags = {
    Name = var.ebs_name
  }
  
}