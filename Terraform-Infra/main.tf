terraform {
  required_version = "~> 1.5.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = " 3.69" # for production-grade
    }
  }
}
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.rgname
  location = var.rglocation
}


# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "=2.46.0"
#     }
#   }
# }

# # Configure the Microsoft Azure Provider
# provider "azurerm" {
#   features {}
# }

# terraform {
#   backend "azurerm" {
#     resource_group_name  = "TerraformGh-RG"
#     storage_account_name = "terraformghpoc"
#     container_name       = "tfstategh"
#     key                  = "dev.terraform.tfstate"
#   }
# }


# resource "azurerm_resource_group" "rg" {
#   name     = var.rgname
#   location = var.rglocation
# }

# resource "azurerm_virtual_network" "vnet1" {
#   name                = "${var.prefix}-10"
#   resource_group_name = "${azurerm_resource_group.rg.name}"
#   location            = "${azurerm_resource_group.rg.location}"
#   address_space       = ["${var.vnet_cidr_prefix}"]
# }

# resource "azurerm_subnet" "subnet1" {
#   name                 = "subnet1"
#   virtual_network_name = "${azurerm_virtual_network.vnet1.name}"
#   resource_group_name  = "${azurerm_resource_group.rg.name}"
#   address_prefixes     = ["${var.subnet1_cidr_prefix}"]
# }

# resource "azurerm_network_security_group" "nsg1" {
#   name                = "${var.prefix}-nsg1"
#   resource_group_name = "${azurerm_resource_group.rg.name}"
#   location            = "${azurerm_resource_group.rg.location}"
# }

# NOTE: this allows RDP from any network
# resource "azurerm_network_security_rule" "rdpnsg" {
#   name                        = "rdpnsg"
#   resource_group_name         = "${azurerm_resource_group.rg.name}"
#   network_security_group_name = "${azurerm_network_security_group.nsg1.name}"
#   priority                    = 102
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_range      = "3389"
#   source_address_prefix       = "*"
#   destination_address_prefix  = "*"
# }

# resource "azurerm_subnet_network_security_group_association" "nsg_subnet_assoc" {
#   subnet_id                 = azurerm_subnet.subnet1.id
#   network_security_group_id = azurerm_network_security_group.nsg1.id
# }

# resource "azurerm_network_interface" "nic1" {
#   name                = "${var.prefix}-nic"
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = azurerm_resource_group.rg.location

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = azurerm_subnet.subnet1.id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

# resource "azurerm_windows_virtual_machine" "main" {
#   name                  = "${var.prefix}-vmt01"
#   resource_group_name   = azurerm_resource_group.rg.name
#   location              = azurerm_resource_group.rg.location
#   size                  = "Standard_B1s"
#   admin_username        = "adminuser"
#   admin_password        = "P@ssw0rd1234!"
#   network_interface_ids = [azurerm_network_interface.nic1.id]

#   source_image_reference {
#     publisher = "MicrosoftWindowsServer"
#     offer     = "WindowsServer"
#     sku       = "2012-R2-Datacenter"
#     version   = "latest"
#   }

#   os_disk {
#     storage_account_type = "Standard_LRS"
#     caching              = "ReadWrite"
#   }
# }
