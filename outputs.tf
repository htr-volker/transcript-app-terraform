output resource_group_name {
  value       = azurerm_resource_group.main.name
  sensitive   = false
  description = "Name of the resource group."
}

output function_app_name {
  value       = module.function_app.app_name
  sensitive   = false
  description = "Name of the function app."
}
