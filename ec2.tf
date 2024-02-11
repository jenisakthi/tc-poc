resource "aws_security_group" "terraformcloud" {
  name   = "HTTP and SSH"
  vpc_id = module.vpc.name

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

  resource "aws_key_pair" "terraformcloud" {
  key_name = "terraformcloud"
  public_key = tls_private_key.rsa.public_key_openssh
  }
  resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
  }
  resource "local_file" "terraformcloud" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "terraformcloud"
  }

resource "aws_instance" "terraformcloud" {
  ami           = "ami-0533f2ba8a1995cf9"
  instance_type = "t2.medium"
  key_name      = "terraformcloud"

  subnet_ids                   = module.vpc.public_subnets
  vpc_security_group_ids      = [aws_security_group.terraformcloud.id]
  associate_public_ip_address = true



  tags = {
    "Name" : "terraformpoc"
  }
}
