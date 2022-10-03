output id {
  value       = azurerm_storage_account.main.id
  description = "description"
}

output name {
  value       = azurerm_storage_account.main.name
  sensitive   = true
  description = "description"
}

output access_key {
  value       = azurerm_storage_account.main.primary_access_key
  sensitive   = true
  description = "description"
}

output connection_string {
  value       = azurerm_storage_account.main.primary_connection_string
  sensitive   = true
  description = "description"
}
