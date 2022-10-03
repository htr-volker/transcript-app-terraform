resource "azurerm_service_plan" "main" {
  name                = "${var.project_name}-service-plan"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "Y1"
}

resource "azurerm_linux_function_app" "main" {
  name                = "${var.project_name}-func-app"
  resource_group_name = var.resource_group_name
  location            = var.location

  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  service_plan_id            = azurerm_service_plan.main.id


  site_config {
    application_insights_connection_string = var.application_insights_connection_string
    application_insights_key = var.application_insights_key
    application_stack {
      python_version = "3.9"
    }
  }

  app_settings = {
    SUBSCRIPTION_KEY = var.cognitive_account_access_key
    REGION = lower(replace(var.location, " ", ""))
    CONNECTION_STRING = var.storage_account_connection_string
  }
}

# resource "azurerm_function_app_function" "main" {
#   name            = "TranscribeVideoTrigger"
#   function_app_id = azurerm_linux_function_app.main.id
#   language        = "Python"

#   file {
#     name    = var.function_file_name
#     content = var.function_file
#   }

#   config_json = var.function_config_json
# }
