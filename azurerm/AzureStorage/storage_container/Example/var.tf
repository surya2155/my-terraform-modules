# Container common vars

variable "storage_container_name" {
  description = "Name of containers, if it contains illegal characters (,-_ etc) those will be truncated."
  type        = string
  default     = ""
}


variable "container_access_type" {
  description = "he Access Level configured for this Container. Possible values are blob, container or private"
  type        = string
  default     = ""
}