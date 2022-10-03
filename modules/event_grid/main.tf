resource "azurerm_eventgrid_system_topic" "main" {
  name                   = "BlobEvents"
  resource_group_name    = var.resource_group_name
  location               = var.location
  source_arm_resource_id = var.storage_account_id
  topic_type             = "Microsoft.Storage.StorageAccounts"
}

# resource "azurerm_eventgrid_system_topic_event_subscription" "main" {
#   name                = "CreateVideoBlob"
#   system_topic        = azurerm_eventgrid_system_topic.main.name
#   resource_group_name = var.resource_group_name

#   included_event_types = ["Microsoft.Storage.BlobCreated"]

#   azure_function_endpoint {
#     function_id = var.function_id
#   }

#   subject_filter {
#     subject_begins_with = var.filter_subject_begins_with
#   }
# }
