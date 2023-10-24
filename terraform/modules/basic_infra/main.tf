terraform {
  required_providers {
    azurerm = {
      version = "3.77.0"
    }
  }
}

data "azurerm_subnet" "dev" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_name
}

data "azurerm_network_security_group" "dev" {
  name                = var.nsg_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_public_ip" "main" {
  name                = "${var.prefix}-pubip-${var.suffix}"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  tags                = var.azure_tags
}

resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-nic-${var.suffix}"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.azure_tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.dev.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.main.id
  }
}

resource "azurerm_network_interface_security_group_association" "main" {
  network_interface_id      = azurerm_network_interface.main.id
  network_security_group_id = data.azurerm_network_security_group.dev.id
}

resource "azurerm_linux_virtual_machine" "main" {
  name                  = "${var.prefix}-vm-${var.suffix}"
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.vm_size
  admin_username        = var.admin_username
  source_image_id       = var.image_id
  tags                  = var.azure_tags
  network_interface_ids = [azurerm_network_interface.main.id]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}
