# Virtaul Network in Azure
This Module allows you to Create one or multiple network security group in Microsoft Azure.

## Features
This module will:

- Create one or multiple network security group in Microsoft Azure.

## Usage
```hcl
module "network_security_group" {
  source              = "../../../../../modules/azurerm/AzureNetwork/network_security_group_new"
  location            = var.location
  security_group_name = var.security_group_name
  resource_group_name = var.resource_group_name
  nsg_tags = merge(
    {
      project = "stage"
    },
    var.common_tags
  )
  security_rules = {
  }
}
```

## Example 
Please refer Example directory to consume this module into your application.

- [main.tf](./main.tf) file calls the resource group module.
- [variables.tf](./var.tf) contains declaration of terraform variables which are passed to the resource group module.
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
| <a name="module_network_security_group"></a> [network\_security\_group](#module\_network\_security\_group) | ../../../../../modules/azurerm/AzureNetwork/network_security_group_new | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | n/a | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | # network security group common vars | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `any` | n/a | yes |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | n/a | `any` | n/a | yes |

## Outputs

No outputs.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Reference

[azurerm_virtual_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network)