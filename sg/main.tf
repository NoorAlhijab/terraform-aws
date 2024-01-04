provider "aws" {
  region = "us-east-1"
}

variable "instancetype" {
  type = string
  default = "t2.micro"
}


resource "aws_instance" "ec2" {
    ami = "ami-0230bd60aa48260c6"
    instance_type = var.instancetype 
    security_groups = [ aws_security_group.webtraffic.name ]

}

resource "aws_security_group" "webtraffic" {
  name = "Allow HTTPS"
  ingress  {
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress  {
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


