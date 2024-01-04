provider "aws" {
  region = "us-east-1"
}

variable "instancetype" {
  type = string
  default = "t2.micro"
}

variable "ingressrules" {
  type = list(number)
  default = [ 80,443 ]
}

variable "egressrules" {
  type = list(number)
  default = [ 80,443,25,3306,8080,53 ]
}

resource "aws_instance" "ec2" {
    ami = "ami-0230bd60aa48260c6"
    instance_type = var.instancetype 
    security_groups = [ aws_security_group.webtraffic.name ]

}

resource "aws_security_group" "webtraffic" {
  name = "Allow HTTPS"
 
 dynamic "ingress"  {
    iterator = port
    for_each = var.ingressrules
    content {
    from_port = port.value
    to_port = port.value
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"] 
    }
   
  }
  
dynamic "egress"  {
    iterator = port
    for_each = var.egressrules
    content {
    from_port = port.value
    to_port = port.value
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"] 
    }
}

}