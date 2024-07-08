terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01516539RG"
    storage_account_name = "tfstaten01516539sa"
    container_name       = "tfstatefiles"
    key                  = "tfstate"
  }
}
