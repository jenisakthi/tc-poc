 resource "aws_internet_gateway" "poc-tc" {
  vpc_id = module.vpc.name
}
