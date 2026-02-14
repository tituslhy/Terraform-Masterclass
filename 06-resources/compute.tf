resource "aws_instance" "web" {
  #   AMI ID NGINX = "ami-084eda252c79fa3ef"
  ami                         = "ami-0030e4319cbf4dbf2" #AMI for ubuntu. reference: https://cloud-images.ubuntu.com/locator/ec2/
  associate_public_ip_address = true
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.public_http_traffic.id]
  root_block_device {
    delete_on_termination = true
    volume_size           = 10 #GB
    volume_type           = "gp3"
  }

  tags = merge(local.common_tags, {
    Name = "06-resources-ec2"
  })

  lifecycle {
    create_before_destroy = true
  }
}

### Security Group & Ingress Rules ###
resource "aws_security_group" "public_http_traffic" {
  description = "Security group allowing traffic on ports 443 and 80"
  name        = "public-http-traffic"
  vpc_id      = aws_vpc.main.id

  tags = merge(local.common_tags, {
    Name = "06-resources-sg"
  })
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.public_http_traffic.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.public_http_traffic.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}
