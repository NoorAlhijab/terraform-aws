provider "aws" {
  region = "us-east-1"
}



resource "aws_instance" "db" {
    ami = "ami-0230bd60aa48260c6"
    instance_type = "t2.micro"
    tags = {
      Name= "DB server"
    }

}

resource "aws_instance" "web" {
    ami = "ami-0230bd60aa48260c6"
    instance_type = "t2.micro"
    depends_on = [ aws_instance.db ]

}

data "aws_instance" "dbsearch" {
  filter {
    name= "tag:Name"
    values = ["DB server"]
  }
}

output "dbservers" {
  value = data.aws_instance.dbsearch.availability_zone
}