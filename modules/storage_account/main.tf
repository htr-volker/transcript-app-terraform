resource random_string storage_account {
  length  = 4
  numeric  = true
  upper   = false
  lower   = false
  special = false
}


resource "azurerm_storage_account" "main" {
  name                     = "${replace(var.project_name,"-","")}storage${random_string.storage_account.result}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "videos" {
  name                  = "videos"
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = "private"

  depends_on = [
    azurerm_storage_account.main
  ]
}

resource "azurerm_storage_container" "transcripts" {
  name                  = "transcripts"
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = "private"

  depends_on = [
    azurerm_storage_account.main
  ]
}
