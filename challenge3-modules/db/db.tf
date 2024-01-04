resource "aws_instance" "db" {
    ami = "ami-0230bd60aa48260c6"
    instance_type = "t2.micro"
   
    tags = {
      name = "DB server"
    }
  
}
output "publicip_db" {
  value = aws_instance.db.public_ip
}


