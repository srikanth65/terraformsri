variable "ami_id" {
    type = string
    default = "ami-03265a0778a880afb"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "instance_names" {
    type = list
    default = [ "mysql","mongodb","rabbitmq","redis","catalogue","cart","user","shipping","payments","dispatch","web" ]    
}


variable "zone-id" {
    type = string 
    default = "Z07707692IZAFTSKYYTLY"
}

variable "domain-name" {
    type = string 
    default = "aws2day.online"
}

variable "vpc_id" {
    type = string 
    default = "vpc-05d40ee0d72e85c90"
}