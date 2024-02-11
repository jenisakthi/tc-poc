resource "aws_instance" "example" {
  ami           = "amazon_linux_2"  # Specify the AMI ID of the desired image
  instance_type = "t3.medium"      # Specify the instance type


  subnet_id              = "subnet-02fbea366b52b939e"  # Specify the subnet ID within the VPC

  # Additional configuration parameters such as key_name, tags, etc. can be specified here
}
