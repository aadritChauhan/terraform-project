module "resource_group" {
  source                  = "./modules/rgroup-n01516539"
  resource_group_name     = "HumberID-n01516539"
  resource_group_location = "Canada Central"
  tags = {
    Assignment     = "CCGC-5502 Automation-Assignment"
    Name           = "Aadrit Chauhan"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}

module "network" {
  source                = "./modules/network-n01516539"
  subnet_id             = module.network.subnet_id
  resource_group_name   = module.resource_group.resource_group_name
  location              = module.resource_group.resource_group_location
  vnet                  = "network-vnet"
  vnet_space            = ["10.0.0.0/16"]
  subnet                = "network-subnet"
  subnet_address_prefix = ["10.0.0.0/24"]
  nsg                   = "network-nsg"
  tags = {
    Assignment     = "CCGC-5502 Automation-Assignment"
    Name           = "Aadrit Chauhan"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}


module "common-n01516539" {
  source                       = "./modules/common-n01516539"
  resource_group_name          = module.resource_group.resource_group_name
  location                     = module.resource_group.resource_group_location
  log_analytics_workspace_name = "log01516539"
  recovery_services_vault_name = "vault01516539"
  storage_account_name         = "str01516539"
  log_sku                      = "PerGB2018"
  retention_log                = 30
  vault_sku                    = "Standard"
  tags = {
    Assignment     = "CCGC-5502 Automation-Assignment"
    Name           = "Aadrit Chauhan"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}

module "vmlinux-n01516539" {
  source               = "./modules/vmlinux-n01516539"
  resource_group_name  = module.resource_group.resource_group_name
  location             = module.resource_group.resource_group_location
  linux_avs_name       = "avset-N01516539"
  storage_account_name = "storage-n01516539"
  size                 = "Standard_DS1_v2"

  subnet_id      = module.network.subnet_id
  admin_username = "n01516539"
  vmlinux-names = { "linux-vm1" = "vm1dns-n01516539",
    "linux-vm2" = "vm2dns-n01516539",
  "linux-vm3" = "vm3dns-n01516539" }
  boot_diagnostics_storage_uri = module.common-n01516539.boot_diagnostics_storage_uri
  tags = {
    Assignment     = "CCGC-5502 Automation-Assignment"
    Name           = "Aadrit Chauhan"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}


module "vmwindows-n01516539" {
  source                       = "./modules/vmwindows-n01516539"
  resource_group_name          = module.resource_group.resource_group_name
  vm_name                      = "vm-n01516539-w"
  location                     = module.resource_group.resource_group_location
  windows_avs_name             = "avset-N01516539"
  vm_count                     = 1
  vm_size                      = "Standard_B1ms"
  admin_username               = "aadi-n01516539"
  admin_password               = "Humber@2024"
  subnet_id                    = module.network.subnet_id
  boot_diagnostics_storage_uri = module.common-n01516539.boot_diagnostics_storage_uri
  tags = {
    Assignment     = "CCGC-5502 Automation-Assignment"
    Name           = "Aadrit Chauhan"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}

module "datadisk-n01516539" {
  source              = "./modules/datadisk-n01516539"
  disk_count          = 4
  vm_names            = concat(module.vmlinux-n01516539.vm_hostnames, module.vmwindows-n01516539.hostname)
  linux_vm_ids        = module.vmlinux-n01516539.linux_vm_id
  windows_vm_ids      = module.vmwindows-n01516539.windows_vm_id
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
  tags = {
    Assignment     = "CCGC-5502 Automation-Assignment"
    Name           = "Aadrit Chauhan"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}


module "loadbalancer-n01516539" {
  source              = "./modules/loadbalancer-n01516539"
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
  load_balancer_name  = "lb-n01516539"
  vm_nic_ids          = module.vmlinux-n01516539.vm_nic_ids
  tags = {
    Assignment     = "CCGC-5502 Automation-Assignment"
    Name           = "Aadrit Chauhan"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}


module "database-n01516539" {
  source              = "./modules/database-n01516539"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  db_username         = "aadi-db"
  db_password         = "Humber@2024"
  tags = {
    Assignment     = "CCGC-5502 Automation-Assignment"
    Name           = "Aadrit Chauhan"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}
