variable "ami_id" {
    type = string
    default = "ami-03265a0778a880afb"
}

variable "instance_names" {
    type = list
    default = [ "mysql","mongodb","rabbitmq","redis","catalogue","cart","user","shipping","payments","dispatch","web" ]    
}

variable "t2micro" {
    type = string 
    default = "t2.micro"
}

variable "t3small" {
    type = string 
    default = "t3.small"
}

variable "zone_id" {
    type = string 
    default = "Z07707692IZAFTSKYYTLY"
}

variable "domain_name" {
    type = string
    default = "aws2day.online"
}