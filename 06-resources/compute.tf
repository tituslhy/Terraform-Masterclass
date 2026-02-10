resource "aws_instance" "web" {
  ami                         = "ami-0030e4319cbf4dbf2" #reference: https://cloud-images.ubuntu.com/locator/ec2/
  associate_public_ip_address = true
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public.id
  root_block_device {
    delete_on_termination = true
    volume_size           = 10 #GB
    volume_type           = "gp3"
  }
}
