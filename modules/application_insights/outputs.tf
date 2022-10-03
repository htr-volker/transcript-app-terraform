output connection_string {
  value       = azurerm_application_insights.main.connection_string
  sensitive   = true
  description = "description"
}

output instrumentation_key {
  value       = azurerm_application_insights.main.instrumentation_key
  sensitive   = true
  description = "description"
}
