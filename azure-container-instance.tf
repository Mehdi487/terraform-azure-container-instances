resource "azurerm_container_group" "container-nginx" {
  name                = "azurerm-container-nginx-uks-01"
  location            = azurerm_resource_group.azure-rg-container.location
  resource_group_name = azurerm_resource_group.azure-rg-container.name
  ip_address_type     = "Public"
#  dns_name_label      = "aci-label"
  os_type             = "Linux"

  container {
    name   = "webserver-nginx01"
    image  = "docker.io/nginx:alpine"
    cpu    = "0.5"
    memory = "1"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}