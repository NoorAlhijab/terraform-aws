provider "aws" {
  region = "us-east-1"
}
variable "ingressrules" {
  type = list(number)
  default = [ 443,80 ]
}
variable "egressrules" {
  type = list(number)
  default = [ 443,80 ]
}

resource "aws_instance" "webserver" {
  ami = "ami-0230bd60aa48260c6"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.demosecurity.name]
  user_data = file("server-script.sh")
  
}

resource "aws_eip" "eip" {
  instance = aws_instance.webserver.id
}

resource "aws_security_group" "demosecurity" {
    name = "Allows HTTPS Aand HTTP"
   dynamic "ingress" {
     iterator = port
     for_each = var.ingressrules
     content {
       from_port = port.value
       to_port = port.value
       protocol = "TCP"
       cidr_blocks = [ "0.0.0.0/0" ]
     }
   }
      dynamic "egress" {
     iterator = port
     for_each = var.egressrules
     content {
       from_port = port.value
       to_port = port.value
       protocol = "TCP"
       cidr_blocks = [ "0.0.0.0/0" ]
     }
   }

  
}

output "privateip" {
  value = aws_eip.eip.private_ip
}
output "publicip" {
  value = aws_eip.eip.public_ip
}