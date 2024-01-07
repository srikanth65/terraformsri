resource "aws_instance" "web" {
  #count = 11
  count = length(var.instance_names)
  ami           = var.ami_id
  instance_type = var.instance_names[count.index] == "mysql" || var.instance_names[count.index] == "mongodb"|| var.instance_names[count.index] =="shipping" ? var.t3small : var.t2micro
 # vpc_security_group_ids = [aws_security_group.roboshop-all.id] # list 

  tags = {
    Name = var.instance_names[count.index]
    component = "web"
    Environment = "Dev"
    Project = "Roboshop"
    Terraform = "true"
}
}

resource "aws_route53_record" "records" {
  #count = 11
  count = length(var.instance_names)
  zone_id = var.zone_id
  name    = "${var.instance_names[count.index]}.${var.domain_name}" # interpolation 
  type    = "A"
  ttl     = 60
  records = [records1 = var.instance_names[count.index] == "web" ? aws_instance.web[count.index].public_ip:aws_instance.web[count.index].private_ip]
}