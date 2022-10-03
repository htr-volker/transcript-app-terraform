resource "azurerm_storage_account" "main" {
  name                     = "${replace(var.project_name,"-","")}storage"
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
