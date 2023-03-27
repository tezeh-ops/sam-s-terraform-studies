resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  #vpc_id      = aws_vpc.main.id  # this is if we want to asociate it with a piticular vpc but fornow no

  ingress {                                  # in coming ( inbound rule)
    description      = "TLS from VPC"
    from_port        = 443               # meaning from the range of 443 ( it can also be from 0 )
    to_port          = 443               # the ending range ( we can add more )
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]     # meanig open from anywhere
  }

  egress {                              # egress out going traffic ( outbound rule)
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

#creat security group wit web traffic 
resource "aws_security_group" "vpc-web" {
  name        = "vpc-web"
  description = "dev vpc web"

  ingress {
    description      = "Allow port 80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "Allow port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all ip and ports outbound"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "vpc-web"
  }
}