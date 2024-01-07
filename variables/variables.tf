variable "ami_id" {
    type = string
    default = "ami-03265a0778a880afb"
}

variable "tags" {
    type = map
    default = {
        Name = "HelloTerraform"
        component = "web"
        Environment = "Dev"
        Project = "Roboshop"
        Terraform = "true"
    }
}

variable "instance_type" {
    type = string 
    default = "t2.micro"
}

variable "sg-name" {
    type = string
    default = "roboshop-all-aws"
}

variable "sg-description" {
    type = string
    default = "Allow TLS inbound traffic"
}

variable "cidr_blocks" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "inbound-from-port" {
    type = number
    default = 0
}

variable "inbound-to-port" {
    type = number
    default = 0
}