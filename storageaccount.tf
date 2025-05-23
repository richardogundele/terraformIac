
resource "azurerm_storage_account" "micorazonstore1" {
  name                     = "micorazonstore1"
  resource_group_name      = local.resource_group
  location                 = local.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_recovery_services_vault" "vault" {
  name                = "micorazonvault"
  location            = local.location
  resource_group_name = local.resource_group
  sku                 = "Standard"

  soft_delete_enabled = true
}
