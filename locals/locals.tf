locals {
   
    instance_type = var.instance_names[count.index] == "mysql" || var.instance_names[count.index] == "mongodb"|| var.instance_names[count.index] =="shipping" ? var.t3small : var.t2micro

    records = var.instance_names[count.index] == "web" ? aws_instance.web[count.index].public_ip:aws_instance.web[count.index].private_ip
}