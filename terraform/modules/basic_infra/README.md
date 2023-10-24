# basic_infra module

## Description

deploy:
   - az vm with custom image from compute gallery
   - public ip 
   - network interface & network interface security group association

needs on existing:
   - resource group
   - compute gallery with images
   - subnet
   - nsg

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.77.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.77.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface_security_group_association.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_public_ip.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/public_ip) | resource |
| [azurerm_network_security_group.dev](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/data-sources/network_security_group) | data source |
| [azurerm_subnet.dev](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | The username for the administrator of the virtual machine. | `string` | n/a | yes |
| <a name="input_azure_tags"></a> [azure\_tags](#input\_azure\_tags) | A set of tags that can be assigned to Azure resources for identification and categorization purposes. | `map(string)` | <pre>{<br>  "brief": "deploiement-de-vm-automatisees",<br>  "env": "development"<br>}</pre> | no |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | The ID of the custom image or the reference to a platform image that will be used for the virtual machine creation. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location where the resources will be provisioned. | `string` | `"West Europe"` | no |
| <a name="input_nsg_name"></a> [nsg\_name](#input\_nsg\_name) | The name of the Network Security Group (NSG) associated with the Virtual Network and Subnet to control network traffic to the virtual machine. | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix used to name the resources. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Azure Resource Group where the resources will be provisioned. | `string` | n/a | yes |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | The name of the Subnet within the Virtual Network where the virtual machine will be deployed. | `string` | n/a | yes |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | The suffix used to differentiate the resources. If not provided, the default value will be used. | `string` | `"001"` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | The size of the virtual machine, specifying the hardware configuration for the VM. | `string` | `"Standard_B2s_v2"` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The name of the Virtual Network (VNet) to which the virtual machine will be connected. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->