# variable "ingress" {
#   type = list(number)
#   default = [ 88,22,443 ]
# }
# variable "egress" {
#   type = list(number)
#   default = [ 88,443 ]
# }

# resource "aws_instance" "db" {
#     ami = "ami-0230bd60aa48260c6"
#     instance_type = "t2.micro"
   
#     tags = {
#       name = "DB server"
#     }
  
# }

# resource "aws_instance" "web" {
#   ami = "ami-0230bd60aa48260c6"
#   instance_type = "t2.micro"
#  security_groups = [aws_security_group.web_traffic.name]
#   tags = {
#     name = "WEB server"
#   }
# }

# resource "aws_eip" "web_ip" {
#   instance = aws_instance.web.id
# }

# resource "aws_security_group" "web_traffic" {
#   name = "Allow Web Traffic"
#   dynamic "ingress" {
#     iterator = port
#     for_each = var.ingress
#    content{
#     from_port = port.value
#     to_port = port.value
#     protocol = "TCP"
#     cidr_blocks = ["0.0.0.0/0"]
#    }
#   }
#     dynamic "egress" {
#     iterator = port
#     for_each = var.egress
#    content{
#     from_port = port.value
#     to_port = port.value
#     protocol = "TCP"
#     cidr_blocks = ["0.0.0.0/0"]
#    }
#   }
# }

# output "privateip" {
#   value = aws_instance.web.private_ip
# }

# output "publicip" {
#     value = aws_eip.web_ip.public_ip
# }