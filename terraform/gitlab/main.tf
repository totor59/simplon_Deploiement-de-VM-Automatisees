variable "admin_username" {}
variable "resource_group_name" {}
variable "image_id" {}
variable "vnet_name" {}
variable "subnet_name" {}
variable "nsg_name" {}

module "basic_infra" {
  source              = "../modules/basic_infra"
  admin_username      = var.admin_username
  image_id            = var.image_id
  nsg_name            = var.nsg_name
  prefix              = "gitlab"
  resource_group_name = var.resource_group_name
  subnet_name         = var.subnet_name
  vnet_name           = var.vnet_name
}
