output access_key {
  value       = azurerm_cognitive_account.main.primary_access_key
  sensitive   = true
  description = "description"
}
