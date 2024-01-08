data "aws_vpc" "vpc" {
  default = true
}

data "aws_ami" "AmazonLinux2" {
  most_recent = true
  owners = ["137112412989"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  
}