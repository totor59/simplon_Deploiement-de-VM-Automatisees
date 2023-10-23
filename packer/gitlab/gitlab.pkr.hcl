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
      "sudo apt-get update",
      "sudo apt-get install -y curl openssh-server ca-certificates tzdata",
      "sudo curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash",
      "sudo apt-get install -y gitlab-ce",
      "sudo mkdir /etc/gitlab && sudo touch /etc/gitlab/gitlab.rb",
      "echo 'gitlab_rails[\"initial_root_password\"] = \"${var.root_password}\"' | sudo tee -a /etc/gitlab/gitlab.rb > /dev/null",
      "sudo gitlab-ctl reconfigure"
    ]
    inline_shebang = "/bin/sh -x"
  }
}