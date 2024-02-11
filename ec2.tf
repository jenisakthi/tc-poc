resource "aws_security_group" "terraformcloud" {
  name   = "HTTP and SSH"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}



resource "aws_instance" "terraformcloud" {
  ami           = data.aws_ami.ubuntu-linux-1804.id
  instance_type = "t2.medium"
  key_name      = "terraformcloudpoc"

  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [aws_security_group.terraformcloud.id]
  associate_public_ip_address = true



  tags = {
    "Name" : "terraformpoc"
  }
}
