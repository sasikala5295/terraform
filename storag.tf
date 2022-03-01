variable "storage_account_name" {
    type=string
    default="sasikala5295"
}
 
variable "resource_group_name" {
    type=string
    default="terraform_grp"
}
 
provider "azurerm"{
version = "=2.0"
subscription_id = "209b2c02-65a2-49fc-a09f-8a2fa48a9f50"
tenant_id       = "e3cc7a9a-1413-484c-beff-30f5c6fdd53d"
features {}
}
 
resource "azurerm_resource_group" "grp" {
  name     = var.resource_group_name
  location = "North Europe"
}
 
resource "azurerm_storage_account" "store" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.grp.name
  location                 = azurerm_resource_group.grp.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}