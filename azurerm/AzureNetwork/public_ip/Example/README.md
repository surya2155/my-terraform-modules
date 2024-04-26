# Virtaul Network in Azure
This Module allows you to Create one or multiple public ip in Microsoft Azure.

## Features
This module will:

- Create one or multiple public ip in Microsoft Azure.

## Usage
```hcl
module "azure_public_ip" {
  source              = "../../../../../modules/azurerm/AzureNetwork/public_ip"
  public_ip_name      = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_address = {
    allocation_method = "Static"
    sku               = "Standard"
  }
  public_ip_tags = merge(
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

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure_public_ip"></a> [azure\_public\_ip](#module\_azure\_public\_ip) | ../../../../../modules/azurerm/AzureNetwork/public_ip | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | n/a | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | # virtual network common vars | `any` | n/a | yes |
| <a name="input_public_ip_name"></a> [public\_ip\_name](#input\_public\_ip\_name) | n/a | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `any` | n/a | yes |

## Outputs

No outputs.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Reference

[azurerm_public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip)