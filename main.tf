terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.0.0"
    }
  }
  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}

resource "random_integer" "random_int" {
  min = 1000
  max = 9999
}

resource "azurerm_resource_group" "example" {
  name     = "rg-{Kenzo}-${random_integer.random_int.result}"
  location = "West Europe"
}

resource "azurerm_app_service_plan" "example" {
  name                = "asp-{Kenzo}-${random_integer.random_int.result}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_linux_web_app" "example" {
  name                = "webapp-{Kenzo}-${random_integer.random_int.result}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  site_config {
    app_command = ""
    java_version = "JAVA"
    java_version = "java17"
    java_version = "17"
  }
}
