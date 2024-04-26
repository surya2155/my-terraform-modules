# Create Subnet in Azure
This Module allows you to Create one or multiple subnet in Microsoft Azure.

## Features
This module will:

- Create one or multiple subnet in Microsoft Azure.

## Usage
```hcl
module "subnet" {
  source                        = "../../../../../modules/azurerm/AzureNetwork/subnet"
  subnet_name                   = var.subnet_name
  resource_group_name           = var.resource_group_name
  virtual_network_name          = var.virtual_network_name
  subnet_address_prefix         = var.subnet_address_prefix
  service_endpoints             = var.service_endpoints
  subnet_delegation             = var.subnet_delegation
}
```

## Example 
Please refer Example directory to consume this module into your application.

- [main.tf](./main.tf) file calls the resource group module.
- [variables.tf](./variables.tf) contains declaration of terraform variables which are passed to the resource group module.
- [values.auto.tfvars](./values.auto.tfvars) contains the variable defination or actual values for respective variables which are passed to the resource group module.

## Best practices for variable declaration/defination
- All names of the Resources should be defined as per Eurofins standard naming conventions.

- While declaring variables with data type 'map(object)' or 'object; or 'list(object)', It's mandatory to define all the attributes in object. If you don't want to set any attribute then define its value as null or empty list([]) or empty map({}) as per the object data type.

- Please make sure all the Required paramaters are set. Refer below section to understand the required and optional input values when using this module.

- Please verify that the values provided to the variables are in comfort with the allowed values for that variable. Refer below section to understand the allowed values for each variable when using this module.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 0.14.11 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 2.73.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.73.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_subnet.az_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/2.73.0/docs/resources/subnet) | resource |
| [azurerm_subnet_nat_gateway_association.az_nat_gateway_sub_association](https://registry.terraform.io/providers/hashicorp/azurerm/2.73.0/docs/resources/subnet_nat_gateway_association) | resource |
| [azurerm_subnet_network_security_group_association.az_subnet_nsg_association](https://registry.terraform.io/providers/hashicorp/azurerm/2.73.0/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_route_table_association.az_route_table_association](https://registry.terraform.io/providers/hashicorp/azurerm/2.73.0/docs/resources/subnet_route_table_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_subnet_nat_gateway_association"></a> [create\_subnet\_nat\_gateway\_association](#input\_create\_subnet\_nat\_gateway\_association) | condition to create subnet nat gateway association | `bool` | `false` | no |
| <a name="input_create_subnet_nsg_association"></a> [create\_subnet\_nsg\_association](#input\_create\_subnet\_nsg\_association) | condition to create subnet nsg association | `bool` | `false` | no |
| <a name="input_create_subnet_routetable_association"></a> [create\_subnet\_routetable\_association](#input\_create\_subnet\_routetable\_association) | condition to create subnet route table association | `bool` | `false` | no |
| <a name="input_enforce_private_link"></a> [enforce\_private\_link](#input\_enforce\_private\_link) | Enable or Disable network policies for the private link endpoint on the subnet | `bool` | `false` | no |
| <a name="input_enforce_private_link_service_network_policies"></a> [enforce\_private\_link\_service\_network\_policies](#input\_enforce\_private\_link\_service\_network\_policies) | Enable or Disable network policies for the private link endpoint on the subnet | `bool` | `false` | no |
| <a name="input_nat_gateway_id"></a> [nat\_gateway\_id](#input\_nat\_gateway\_id) | The nat gateway Id to associate with the subnets | `string` | `""` | no |
| <a name="input_network_security_group_id"></a> [network\_security\_group\_id](#input\_network\_security\_group\_id) | The Network Security Group Id to associate with the subnets | `string` | `""` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) Map of the resource groups to create | `string` | n/a | yes |
| <a name="input_route_table_id"></a> [route\_table\_id](#input\_route\_table\_id) | The route table Id to associate with the subnets | `string` | `""` | no |
| <a name="input_service_endpoints"></a> [service\_endpoints](#input\_service\_endpoints) | The list of Service endpoints to associate with the subnet | `list(string)` | `[]` | no |
| <a name="input_subnet_address_prefix"></a> [subnet\_address\_prefix](#input\_subnet\_address\_prefix) | The address prefix list to use for the subnet | `list(string)` | n/a | yes |
| <a name="input_subnet_delegation"></a> [subnet\_delegation](#input\_subnet\_delegation) | Configuration delegations on subnet<br>object({<br>  name = object({<br>    name = string,<br>    actions = list(string)<br>  })<br>}) | `map(list(any))` | `{}` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | name of the azure subnet | `string` | n/a | yes |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | name of the parent virtual network | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_az_subnet_address_prefixes"></a> [az\_subnet\_address\_prefixes](#output\_az\_subnet\_address\_prefixes) | The address prefixes for the subnet |
| <a name="output_az_subnet_cidrs_map"></a> [az\_subnet\_cidrs\_map](#output\_az\_subnet\_cidrs\_map) | The address prefixes for the subnet |
| <a name="output_az_subnet_id"></a> [az\_subnet\_id](#output\_az\_subnet\_id) | Id of the created subnet |
| <a name="output_az_subnet_name"></a> [az\_subnet\_name](#output\_az\_subnet\_name) | Names of the created subnet |
| <a name="output_az_subnet_virtual_network_name"></a> [az\_subnet\_virtual\_network\_name](#output\_az\_subnet\_virtual\_network\_name) | The name of the virtual network in which the subnet is created in |