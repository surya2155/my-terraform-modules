## proximity_placement_group
resource_group_name = "resource_group_name"
location            = "westeurope"

proximity_placement_group_settings = {
  ppg_demo = {
    proximity_placement_group_name = "test-pp-group"
  }

}


## common tags
common_tags = {
  cost_center = "eurofins_it"
}
