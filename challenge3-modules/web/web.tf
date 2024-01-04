resource "aws_instance" "web" {
  ami = "ami-0230bd60aa48260c6"
  instance_type = "t2.micro"
 security_groups = [module.sgmodule.sgname] 
  tags = {
    name = "WEB server"
  }
}
output "publicip_web" {
  value = aws_instance.web.public_ip
}
output "privateip_web" {
  value = aws_instance.web.private_ip
}


resource "aws_eip" "ec2_eip" {
  instance = aws_instance.web.id
}

output "publicip_eip" {
    value = aws_eip.ec2_eip.public_ip
}

module "sgmodule" {
  source = "../sg"
}


