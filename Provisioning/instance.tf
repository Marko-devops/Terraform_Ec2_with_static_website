resource "aws_instance" "web-script" {
  ami                    = "ami-052064a798f08f0d3" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.terra_key.key_name
  vpc_security_group_ids = [aws_security_group.terra_sg.id]
  availability_zone      = "us-east-1a"

  tags = {
    Name = "Terraform-EC2"
  }


  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("terra_key")
    host        = self.public_ip
  }
}