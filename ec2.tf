 resource "aws_internet_gateway" "poc-tc" {
  vpc_id = module.vpc.name
}

resource "aws_route_table" "public_rt_poc_tc" {
  vpc_id =  module.vpc.name

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.poc-tc.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.poc-tc.id
  }

  tags = {
    Name = "Public Route Table"
  }
}
