module "resource_group" {
  source                  = "./modules/rgroup-n01516539"
  resource_group_name     = "HumberID-n01516539"
  resource_group_location = "Canada Central"
}

module "network" {
  source                  = "./modules/network-n01516539"
  resource_group_name     = module.rgroup-n01516539.resource_group_name
  resource_group_location = module.rgroup-n01516539.resource_group_location
  vnet                    = "network-vnet"
  vnet_space              = ["10.0.0.0/16"]
  subnet                  = "network-subnet"
  subnet_address_prefix   = ["10.0.0.0/24"]
  nsg                     = "network-nsg"
}


module "common-n01516539" {
  source                       = "./modules/common-n01516539"
  resource_group_name          = module.rgroup-n01516539.resource_group_name
  resource_group_location      = module.rgroup-n01516539.resource_group_location
  log_analytics_workspace_name = "log-n01516539"
  recovery_services_vault_name = "vault-n01516539"
  storage_account_name         = "storage-n01516539"
}
