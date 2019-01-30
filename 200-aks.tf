resource "azurerm_kubernetes_cluster" "aksfrontend" {
  name                = "${var.env}-meetup-aksfrontend-${var.location}"
  location            = "${var.location}"
  resource_group_name = "${var.infrastructure-rg}"
  dns_prefix          = "${var.env}-meetup-aksfrontend-${var.location}"
  kubernetes_version  = "1.10.9"



  agent_pool_profile {
    name            = "default"
    count           = 2 
    vm_size         = "Standard_DS2_v2"
    os_type         = "Linux"
    os_disk_size_gb = 30
    vnet_subnet_id  = "${azurerm_subnet.sn1-frontend.id}"
  }

  service_principal {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }
  network_profile {
    network_plugin = "azure"
  }
}

resource "azurerm_kubernetes_cluster" "aksbackend" {
  name                = "${var.env}-meetup-aksbackend-${var.location}"
  location            = "${var.location}"
  resource_group_name = "${var.infrastructure-rg}"
  dns_prefix          = "${var.env}-meetup-aksfrontend-${var.location}"

  agent_pool_profile {
    name            = "default"
    count           = 1
    vm_size         = "Standard_B2s"
    os_type         = "Linux"
    os_disk_size_gb = 30
    vnet_subnet_id  = "${azurerm_subnet.sn2-backend.id}"
  }

  service_principal {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }
  network_profile {
    network_plugin = "azure"
  }
}

