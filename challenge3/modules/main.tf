provider "aws" {
  region = "us-east-1"
}

module "dbmodule" {
  source = "./db"
}

module "webmodule" {
  source = "./web"
  
}

# output "module_output" {
#   value = module.ec2module.privateip
# }
# output "module_output2" {
#   value = module.ec2module.publicip
# }