# Create Proximity placement group in Azure
This Module allows you to create and manage one or multiple Proximity placement group in Microsoft Azure.

## Features
This module will:

- Create one or muliple Proximity placement group in Microsoft Azure.

## Usage
```hcl
module "proximity_placement_group" {
  source                         = "../../../../../modules/azurerm/AzureCompute/proximity_placement_group"
  for_each                       = var.proximity_placement_group_settings
  proximity_placement_group_name = each.value["proximity_placement_group_name"]
  location                       = var.location
  resource_group_name            = var.resource_group_name
  placement_group_tags = merge(
    {
      project = "stage"
    },
    var.common_tags,
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
| [azurerm_proximity_placement_group.az_placement_group](https://registry.terraform.io/providers/hashicorp/azurerm/2.73.0/docs/resources/proximity_placement_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The location in which the resources will be created. | `string` | `""` | no |
| <a name="input_placement_group_tags"></a> [placement\_group\_tags](#input\_placement\_group\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | n/a | yes |
| <a name="input_proximity_placement_group_name"></a> [proximity\_placement\_group\_name](#input\_proximity\_placement\_group\_name) | The ID of the Proximity Placement Group to which this Virtual Machine should be assigned | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the resources will be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_az_placement_group_id"></a> [az\_placement\_group\_id](#output\_az\_placement\_group\_id) | The ID of the Proximity Placement Group |


## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Reference

[azurerm_proximity_placement_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/proximity_placement_group)