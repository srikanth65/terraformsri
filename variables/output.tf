# get all the details of instance
# output "instance_details" {
#   value = aws_instance.web
# }

output "instance_id" {
  value = aws_instance.web.id
}

output "instance_private_ip" {
  value = aws_instance.web.private_ip
}

output "instance_public_ip" {
  value = aws_instance.web.public_ip
}