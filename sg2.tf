# our dynamic security group

resource "aws_security_group" "web-traffic" {
    name = "Allow HTTPS"


    dynamic "ingress" {
        iterator = port    # is a loop that will go through the list of port
        for_each = var.ingressrules    # setting our loop condition
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks =  ["0.0.0.0/0"]

        }
    }

    dynamic "egress" {
        iterator = port    # is a loop that will go through the list of port that we have in our variable to mount them
        for_each = var.egressrules    # setting our loop condition, Say for each port you see use this format to creater it.
        content {
            from_port = port.value
            to_port = port.value
             protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]

        }
    }
}    
