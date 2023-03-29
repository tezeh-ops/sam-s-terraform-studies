# our variable file for our dynamic security group
# here we are specifying the port we need open on our in&outbound rule (ingress & egress) using dynamic approach
# which it will help us to avoid opening range of ports that we dont actuall need them. So we just open only the one that we need.

variable "ingressrules" {
    type = list(number)
    default = [80,443,8080]  # here we are saying map this ports to my inbound rule
}

variable "egressrules" {
    type = list(number)
    default = [80,443,25,3306,53,8080]   # herev we are saying map this ports to my outbound rule
}

# varible for my instance

variable "my_instance_type" {
    type = string
    default = "t2.micro"
}

# variable for my region

variable "region" {
    description = "The aws region"
    type = string
    default = "us-east-1"
  
}


