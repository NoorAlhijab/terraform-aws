provider "aws" {
  region = "us-east-1"
}

variable "tagsname" {
  type = string
  default = "prod"
}
variable "instancetype" {
  type = string
  default = "t2.micro"
}


resource "aws_instance" "ec2" {
    ami = "ami-0230bd60aa48260c6"
    instance_type = var.instancetype 

    tags = {
      name = var.tagsname
    }
}

output "ec2id" {
  value = aws_instance.ec2.id
}
