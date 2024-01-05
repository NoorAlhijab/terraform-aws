variable "server_names" {
  type = list(string)
}

resource "aws_instance" "db" {
    ami = "ami-0230bd60aa48260c6"
    instance_type = "t2.micro"
    count = length(var.server_names)
   
    tags = {
      name = var.server_names[count.index]
    }
  
}
output "publicip_db" {
  value = [aws_instance.db.*.public_ip]
}



