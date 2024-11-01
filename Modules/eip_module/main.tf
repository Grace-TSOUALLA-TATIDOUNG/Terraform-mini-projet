
resource "aws_eip" "myec2_eip" {
  domain = "vpc"
  tags = {
    Name = var.ec2_eip
  }
}