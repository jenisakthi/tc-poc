resource "aws_subnet" "pre_exist_vpc" {
    vpc_id = "vpc-03cdd48617e2dffde"
    cidr_block = "10.10.10.0/24"
}

resource "aws_instance" "test_ec2" {
    ami = "ami-033b95fb8079dc481"
    instance_type = "t3.medium"
    subnet_id = subnet-02fbea366b52b939e
}
