packer {
  required_plugins {
    azure = {
      source  = "github.com/hashicorp/azure"
      version = "~> 1"
    }
  }
}

source "azure-arm" "image" {
  subscription_id                   = var.subscription_id
  use_azure_cli_auth                = true
  managed_image_resource_group_name = var.resource_group
  managed_image_name                = var.managed_image_name
  os_type                           = "Linux"
  image_publisher                   = "Canonical"
  image_offer                       = "0001-com-ubuntu-server-jammy"
  image_sku                         = "22_04-lts-gen2"
  location                          = var.location
  vm_size                           = var.vm_size
  azure_tags                        = var.azure_tags
  shared_image_gallery_destination {
    resource_group      = var.resource_group
    gallery_name        = var.gallery_name
    image_name          = var.managed_image_name
    image_version       = var.version
    replication_regions = [var.location]
  }
}

build {
  sources = [
    "source.azure-arm.image"
  ]

  provisioner "shell" {
    execute_command = "chmod +x {{ .Path }}; {{ .Vars }} sudo -E sh '{{ .Path }}'"
    inline = [
      "curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null",
      "echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null",
      "apt-get update",
      "apt-get install -y openjdk-17-jre",
      "apt-get install -y python3 jenkins"
    ]
    inline_shebang = "/bin/sh -x"
  }
}