variable "ami_id" {
    type = string
    default = "ami-03265a0778a880afb"
}

variable "sg-name" {
    type = string
    default = "roboshop-all-aws"
}

variable "sg-description" {
    type = string
    default = "Allow TLS inbound traffic"
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

variable "ingress_rules" {
    type = list 
    default = [ {
        description      = "Allow all ports"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    },
    {
        description      = "Allow all ports"
        from_port        = 443
        to_port          = 443
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    },
    {
        description      = "Allow all ports"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    } 

    ]

}

