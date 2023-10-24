variable "managed_image_name" {
  type    = string
  default = "jenkins"
}

variable "location" {
  type    = string
  default = "West Europe"
}

variable "vm_size" {
  type    = string
  default = "Standard_B2s_v2"
}

variable "version" {
  type    = string
  default = "1.0.0"
}

variable "azure_tags" {
  type    = map(string)
  default = {
    env = "development"
    brief = "deploiement-de-vm-automatisees"
  }
}

# AZURE SPECIFICS VARS

variable "subscription_id" {
  type    = string
}

variable "resource_group" {
  type    = string
}

variable "gallery_name" {
  type    = string
}