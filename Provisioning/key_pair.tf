resource "aws_key_pair" "terra_key" {
  key_name   = "terra_key"
  public_key = var.public_key
}