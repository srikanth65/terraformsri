resource "aws_instance" "web" {
 for_each = var.instance_names
  ami           = var.ami_id
  instance_type = each.value
 # vpc_security_group_ids = [aws_security_group.roboshop-all.id] # list 

  tags = {
    Name = each.key
    Environment = "Dev"
    Project = "Roboshop"
    Terraform = "true"
}

}

# output "out" {
 
#   value = aws_instance.web
# }


resource "aws_route53_record" "records" {
  for_each = aws_instance.web
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}" # interpolation 
  type    = "A"
  ttl     = 60
  records = [each.key == "web" ? each.value.public_ip : each.value.private_ip]
}