provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "my_rg" {
  name     = "rg-${var.namespace}"
  location = var.location
  tags     = var.tags
}

module "my_vnet" {
  source              = "https://github.com/3c0jb4d/azure-networking-releases"
  vnet_tags           = var.tags
  vnet_name           = format("vnet-%s", var.namespace)
  resource_group_name = azurerm_resource_group.my_rg.name
  location            = azurerm_resource_group.my_rg.location

  address_space   = ["10.0.0.0/8"]
  subnet_prefixes = ["10.1.0.0/16"]

  subnet_tags = var.tags
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-${var.namespace}"
  location            = azurerm_resource_group.my_rg.location
  resource_group_name = azurerm_resource_group.my_rg.name
  dns_prefix          = "aks-${var.namespace}"
  tags                = var.tags

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
  }
}
