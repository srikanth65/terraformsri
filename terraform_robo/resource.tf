
resource "aws_instance" "web" {
  count = length(var.instance_names)
  ami           = var.ami_id
  instance_type = var.instance_names[count.index] == "mysql" || var.instance_names[count.index] == "mongodb" || var.instance_names[count.index] == "shipping" ? "t3.small" : "t2.micro"

  tags = {
   Name = var.instance_names[count.index]
   Terraform = true
   project = "roboshop"
   Environment = "Dev"
  }
}

resource "aws_route53_record" "www" {
  count = length(var.instance_names)
  zone_id = var.zone-id
  name    = "${var.instance_names[count.index]}.${var.domain-name}"
  type    = "A"
  ttl     = 300
  records = [aws_instance.web[count.index].private_ip]
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}