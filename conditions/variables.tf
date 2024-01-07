variable "ami_id" {
    type = string
    default = "ami-03265a0778a880afb"
}

variable "instance_name" {
    type = string
    default = "mongoDB"
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