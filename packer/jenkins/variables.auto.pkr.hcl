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