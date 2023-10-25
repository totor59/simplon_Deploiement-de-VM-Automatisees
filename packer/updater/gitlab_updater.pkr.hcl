packer {
  required_plugins {
    azure = {
      source  = "github.com/hashicorp/azure"
      version = "~> 1"
    }
  }
}

source "azure-arm" "update_image" {
  subscription_id                   = var.subscription_id
  use_azure_cli_auth                = true
  managed_image_name                = var.managed_image_name
  managed_image_resource_group_name = var.resource_group
  os_type                           = "Linux"
  build_resource_group_name         = var.resource_group
  vm_size                           = var.vm_size
  azure_tags                        = var.azure_tags
  shared_image_gallery {
    subscription  = var.subscription_id
    resource_group = var.resource_group
    gallery_name   = var.gallery_name
    image_name     = var.managed_image_name
    image_version  = var.current_version
  }

  shared_image_gallery_destination {
    resource_group      = var.resource_group
    gallery_name        = var.gallery_name
    image_name          = var.managed_image_name
    image_version       = var.version
    replication_regions = [var.location]
  }
}

build {
  sources = ["source.azure-arm.update_image"]

  // Update OS and Packages
  provisioner "shell" {
    execute_command = "chmod +x {{ .Path }}; {{ .Vars }} sudo -E sh '{{ .Path }}'"
    inline = [
      "sudo apt-get update",
      "sudo apt-get upgrade -y",
      "sudo apt-get dist-upgrade -y",
      "sudo apt-get autoremove -y",
      "sudo apt-get autoclean -y",
      "sudo apt-get clean"
    ]
    inline_shebang = "/bin/sh -x"
  }
}
