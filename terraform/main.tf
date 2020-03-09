resource "azurerm_resource_group" "resource_gp" {
  location = "eastus"
  name = "cicd-project-rg"
}

resource "azurerm_container_registry" "acr" {
  name                     = "cicdProjectAcr"
  resource_group_name      = azurerm_resource_group.resource_gp.name
  location                 = azurerm_resource_group.resource_gp.location
  sku                      = "Basic"
  admin_enabled            = true
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "cicdProjectAks"
  location            = azurerm_resource_group.resource_gp.location
  resource_group_name = azurerm_resource_group.resource_gp.name
  dns_prefix          = "cicdprojectacr"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  tags = {
    Environment = "dev"
  }
}