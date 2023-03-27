variable "region" {
    description = "The aws region"
    type = string
    default = "us-west-1"
  
}

/*variable "my_ami" {              # we are commeting it out becus we have our datasource to handle that
    description = "The aws ami"
    type = string                 
    default = "ami-02c61cf220bd1158e"  
}*/

variable "instance_type" {
    description = "The ec2 instance type"
    type = string
    default = "t2.medium"  
}

variable "key_pair" {
    description = "the ec2 key pair"
    type = string
    default = "EKS"  
}    