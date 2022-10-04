# output function_id {
#   value       = azurerm_function_app_function.main.id
#   sensitive   = true
#   description = "description"
# }

output app_name {
  value       =  azurerm_linux_function_app.main.name
  sensitive   = false
  description = "Name of the function app"
}
