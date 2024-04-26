# Virtaul Network in Azure
This Module allows you to Create one or multiple virtual network in Microsoft Azure.

## Features
This module will:

- Create one or multiple virtual network in Microsoft Azure.

## Usage
```hcl
module "virtual_network" {
  source               = "../../../../../modules/azurerm/AzureNetwork/virtual_network"
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
  vnet_address_space   = var.vnet_address_space
  location                  = var.location
  vnet_tags            =  merge(
    {
      project = "stage"
    },
    var.common_tags
  )
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
| [azurerm_virtual_network.az_virtual_network](https://registry.terraform.io/providers/hashicorp/azurerm/2.73.0/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ddos_protection_plan"></a> [ddos\_protection\_plan](#input\_ddos\_protection\_plan) | A ddos\_protection\_plan id | `map(string)` | `{}` | no |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | List of dns servers to use for virtual network | `list(string)` | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table' | `string` | `"westeurope"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of resorce group where your going place the services | `string` | n/a | yes |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | Name of your Azure Virtual Network | `string` | n/a | yes |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | The address space to be used for the Azure virtual network. | `list(string)` | n/a | yes |
| <a name="input_vnet_tags"></a> [vnet\_tags](#input\_vnet\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_az_virtual_network_address_space"></a> [az\_virtual\_network\_address\_space](#output\_az\_virtual\_network\_address\_space) | List of address spaces that are used the virtual network. |
| <a name="output_az_virtual_network_id"></a> [az\_virtual\_network\_id](#output\_az\_virtual\_network\_id) | The id of the virtual network |
| <a name="output_az_virtual_network_name"></a> [az\_virtual\_network\_name](#output\_az\_virtual\_network\_name) | The name of the virtual network |

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Reference

[azurerm_virtual_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network)