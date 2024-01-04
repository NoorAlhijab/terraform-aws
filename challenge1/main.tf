provider "aws" {
  region = "us-east-1"
}
variable "vpctag" {
  type = string
  default = "Terraformvpc"
}
resource "aws_vpc" "challengevpc" {
  cidr_block = "192.168.0.0/24"
  tags = {
    name = var.vpctag
  }
}