# ec2 instance public ip

output "instance_publicip" {
    description = "ec2 instance public ip"
    value = aws_instance.ec2_demo2.public_ip
  
}

output "instance_publicdns" {
    description = "ec2 instance public DNS"
    value = aws_instance.ec2_demo2.public_dns
  
}