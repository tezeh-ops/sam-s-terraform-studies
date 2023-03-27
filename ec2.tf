
resource "aws_instance" "ec2_demo2" {
    #ami = var.my_ami # since commented the variable out so now we are calling our ani from the data source see it below
    ami = data.aws_ami.amazonlinux.id   # calling our data source to get our ami
    instance_type = var.instance_type
    user_data = file("${path.module}/app1-install.sh")
    vpc_security_group_ids = [ aws_security_group.allow_tls.id, aws_security_group.vpc-web.id ] # here i'm usindg the name of my security-g resource + "id" (sayin
# that when you create this SG attach it to this instance) 
    key_name = var.key_pair                   
    tags = {
      "Name" = "my_first_ec2"
    }
  
}