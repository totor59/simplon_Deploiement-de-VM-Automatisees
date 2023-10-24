variable "prefix" {
  type        = string
  description = "The prefix used to name the resources."
}

variable "suffix" {
  type        = string
  description = "The suffix used to differentiate the resources. If not provided, the default value will be used."
  default     = "001"
}

variable "location" {
  type        = string
  default     = "West Europe"
  description = "The location where the resources will be provisioned."
}

variable "vm_size" {
  type        = string
  default     = "Standard_B2s_v2"
  description = "The size of the virtual machine, specifying the hardware configuration for the VM."
}

variable "admin_username" {
  type        = string
  description = "The username for the administrator of the virtual machine."

}

variable "azure_tags" {
  type        = map(string)
  description = "A set of tags that can be assigned to Azure resources for identification and categorization purposes."
  default = {
    env   = "development"
    brief = "deploiement-de-vm-automatisees"
  }
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Azure Resource Group where the resources will be provisioned."
}

variable "image_id" {
  type        = string
  description = "The ID of the custom image or the reference to a platform image that will be used for the virtual machine creation."
}

variable "vnet_name" {
  type        = string
  description = "The name of the Virtual Network (VNet) to which the virtual machine will be connected."
}

variable "subnet_name" {
  type        = string
  description = "The name of the Subnet within the Virtual Network where the virtual machine will be deployed."
}

variable "nsg_name" {
  type        = string
  description = "The name of the Network Security Group (NSG) associated with the Virtual Network and Subnet to control network traffic to the virtual machine."
}


