resource "aws_instance" "web" {
  ami           = data.aws_ami.AmazonLinux2.id
  instance_type = "t2.micro"
  tags = {
    Name = "Web"
  }
}