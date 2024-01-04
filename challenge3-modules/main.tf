provider "aws" {
  region = "us-east-1"
}

module "dbmodule" {
  source = "./db"
}

module "webmodule" {
  source = "./web"
}

# output "module_outputeip" {
#   value = module.webmodule.publicip_eip
    
#   }

  output "module_publicip_web" {
    value = module.webmodule.publicip_web
  }
  output "module_publicip_db" {
    value = module.dbmodule.publicip_db
  }

  output "modoule_privateip_web" {
    value = module.webmodule.privateip_web
  }