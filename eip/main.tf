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

}

resource "aws_eip" "elasticeip" {
  instance = aws_instance.ec2.id
}

output "EIP" {
  value = aws_eip.elasticeip.public_ip
}
