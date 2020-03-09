output "container_id" {
  value = azurerm_container_registry.acr.id
}

output "username" {
  value = azurerm_container_registry.acr.admin_username
}

output "password" {
  value = azurerm_container_registry.acr.admin_password
}

output "login_server" {
  value = azurerm_container_registry.acr.login_server
}


output "client_certificate" {
  value = azurerm_kubernetes_cluster.example.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.example.kube_config_raw
}