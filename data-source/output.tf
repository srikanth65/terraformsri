# output "instance_ip_addr" {
#   value = data.aws_vpc.vpc
# }

output "centos" {
  value = data.aws_ami.AmazonLinux2.id
}
