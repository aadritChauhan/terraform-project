module "resource_group" {
  source                  = "./modules/rgroup-n01516539"
  resource_group_name     = "HumberID-n01516539"
  resource_group_location = "Canada Central"
}

module "network" {
  source                  = "./modules/network-n01516539"
  subnet_id               = module.network.subnet_id
  network_resource_group_name  = module.resource_group.resource_group_name
  network_resource_group_location = module.resource_group.resource_group_location
  vnet                    = "network-vnet"
  vnet_space              = ["10.0.0.0/16"]
  subnet                  = "network-subnet"
  subnet_address_prefix   = ["10.0.0.0/24"]
  nsg                     = "network-nsg"
}


module "common-n01516539" {
  source                       = "./modules/common-n01516539"
  resource_group_name          = module.resource_group.resource_group_name
  resource_group_location      = module.resource_group.resource_group_location
  log_analytics_workspace_name = "log-n01516539"
  recovery_services_vault_name = "vault-n01516539"
  storage_account_name         = "storage-n01516539"
}

module "vmlinux-n01516539" {
  source                  = "./modules/vmlinux-n01516539"
  resource_group_name     = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  linux_avs_name          = "avset-N01516539"
  subnet_id               = module.network.subnet_id
  admin_username          = "n01516539"
  admin_password          = "Humber@24"
  vmlinux-names = { "linux-vm1" = "vm1dns-n01516539",
    "linux-vm2" = "vm2dns-n01516539",
  "linux-vm3" = "vm3dns-n01516539" }

}
