provider "aws"{
region = "us-east-1"
}

variable "vpcname" {
    type = string
    default="myvpc"
 
}

variable "shhport"{
    type = number
    default = 22
}

variable "enabled" {
  default= true
}

variable "mylist"{
type = list(string)
default = [ "value1", "value2" ]
}

variable "mymap" {
  type= map
  default = {
    key1 = "value1"
    key2 = "value2"
  }
}

variable "inputname" {
    type = string
    description = "Set the name of the vpc"
  
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"

tags = {
    name = var.inputname
}
#   tags = {
#     name = var.vpcname
#   }
# ///////////
#   here shows how to use variables with mylist and mymap
#   tags ={
#     name = var.mylist[0]
#   }
# /////////
# tags = {
#     name = var.mymap["key1"]
# }
}

output "vpcid" {
  value = aws_vpc.myvpc.id
}

variable "mytuple" {
  type = tuple([ string, number, string ])
  default = [ "cat", 2, "dog" ]
}

variable "myobject" {
  type = object({  name = string, port=list(number) })
  default = {
    name = "port"
    port = [22, 80, 403]
  }
}