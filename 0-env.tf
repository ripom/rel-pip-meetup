variable "location" {
  default = "westeurope"
}

variable "client_id" {

}

variable "client_secret" {

}

variable "infrastructure-rg" {
  default = "rg-meetup"
}

variable "env" {
  default = "cdt"
}

variable "subscription_id" {

}

variable "tenant_id" {

}

provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  tenant_id       = "${var.tenant_id}"
  client_secret   = "${var.client_secret}"
}

terraform {
  backend "azurerm" {
    storage_account_name = "terrasa"
    container_name       = "tfstate"
    key                  = "meetup.terraform.tfstate"
    access_key           = "01JyTeB9aCiO9+dFo7U2hslVPWXr/biQ4ekt0+m5k4g78q1Gs9FB6S4jutpMPYPjCTs43tA8MZHUyrJN/4azag=="
  }
}
