# Create network interface in Azure
This Module allows you to Create one or multiple Network Interface in Microsoft Azure.

## Features
This module will:

- Create one or muliple Network Interface in Microsoft Azure.

## Usage
```hcl
module "network_interface" {
  source                 = "../../../../../modules/azurerm/AzureNetwork/network_interface"
  network_interface_name = var.network_interface_name
  location               = var.location
  resource_group_name    = var.resource_group_name
  network_interface_tags = var.network_interface_tags
  ip_configuration  = var.ip_configuration
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

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_network_interface"></a> [network\_interface](#module\_network\_interface) | ../../../../../modules/azurerm/AzureNetwork/network_interface | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ip_configuration"></a> [ip\_configuration](#input\_ip\_configuration) | n/a | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `any` | n/a | yes |
| <a name="input_network_interface_name"></a> [network\_interface\_name](#input\_network\_interface\_name) | # Network interface common vars | `any` | n/a | yes |
| <a name="input_network_interface_tags"></a> [network\_interface\_tags](#input\_network\_interface\_tags) | n/a | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `any` | n/a | yes |

## Outputs

No outputs.