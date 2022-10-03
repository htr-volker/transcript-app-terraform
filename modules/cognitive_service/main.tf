resource "azurerm_cognitive_account" "main" {
  name                = "${var.project_name}-speech-service"
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "SpeechServices"

  sku_name = var.sku
}
