# Test comment
resource "azurerm_virtual_network" "vnet" {
  resource_group_name = "${var.infrastructure-rg}"
  location            = "${var.location}"
  name                = "${var.env}-meetup-${var.location}-vnet"

  address_space = ["172.20.0.0/16"]
}

resource "azurerm_subnet" "sn0-ingress" {
  resource_group_name  = "${var.infrastructure-rg}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  name                 = "sn0-ingress"

  address_prefix = "172.20.0.0/24"

}

resource "azurerm_subnet" "sn1-frontend" {
  resource_group_name  = "${var.infrastructure-rg}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  name                 = "sn1-frontend"

  address_prefix = "172.20.1.0/24"

}

resource "azurerm_subnet" "sn2-backend" {
  resource_group_name  = "${var.infrastructure-rg}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  name                 = "sn2-backend"

  address_prefix = "172.20.2.0/24"

}
