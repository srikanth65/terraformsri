resource "aws_security_group" "roboshop-all" { # terraform variable name for terraform reference only
  name        = var.sg-name   # aws resource name
  description = var.sg-description
  
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description      = "Allow all ports"
      from_port        = ingress.value["from_port"]
      to_port          = ingress.value["to_port"]
      protocol         = ingress.value["protocol"]
      cidr_blocks      = ingress.value["cidr_blocks"]
      #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "roboshop-all-aws"
  }
}