/*   #belowe is an exple of a data source to search fo an aws_ami
what is happening here is that with the "dta source" it will go the th amazon console look for the ami bring it and use it tolaunch
our instance 

data "aws_ami" "example" {         
  executable_users = ["self"]  # we also took this out 
  most_recent      = true        # true to say bring me the most recent 
  name_regex       = "^myami-\\d{3}" # we took this out becaause you can use this if we are making a complex search
  owners           = ["self"] # leave it as "self" if u own the ami if not input "amazon"

  filter {
    name   = "name"
    values = ["myami-*"] # go your ami on you dashboard and public and you will see the ami name and the rest of the stuff below as well
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

*/

#al2023-ami-*-x86_64  # here we want terraform to search for any ami that has the verious numbers in it

#al2023-ami-2023.0.20230322.0-kernel-6.1-x86_64  # here is the original ami name but since the number keeps changing, we have to replace them with " * " in order to 
# to search and bring us the later version of the numbers in between.
# below is the customize data source of aws_ami
data "aws_ami" "amazonlinux" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}  
