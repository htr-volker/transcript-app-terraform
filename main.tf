terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = var.project_name
  location = var.location
}

module "cognitive_service" {
  source = "./modules/cognitive_service"

  project_name        = var.project_name
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location

  sku = "F0"
}

module "storage_account" {
  source              = "./modules/storage_account"
  project_name        = var.project_name
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
}

module "application_insights" {
  source              = "./modules/application_insights"
  project_name        = var.project_name
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
}


module "function_app" {
  source = "./modules/function_app"

  project_name        = var.project_name
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location

  function_file_name                     = "__init__.py"
  function_file                          = file("../function-app/TranscribeVideoTrigger/__init__.py")
  function_config_json                   = file("../function-app/TranscribeVideoTrigger/function.json")
  storage_account_name                   = module.storage_account.name
  storage_account_access_key             = module.storage_account.access_key
  storage_account_connection_string      = module.storage_account.connection_string
  cognitive_account_access_key           = module.cognitive_service.access_key
  application_insights_connection_string = module.application_insights.connection_string
  application_insights_key               = module.application_insights.instrumentation_key

  depends_on = [
    module.cognitive_service,
    module.storage_account,
    module.application_insights
  ]
}

module "event_grid" {
  source = "./modules/event_grid"

  project_name        = var.project_name
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location

  storage_account_id         = module.storage_account.id
  # function_id                = module.function_app.function_id
  filter_subject_begins_with = "/blobServices/default/containers/videos"
}
