variable project_name {
  type        = string
  default     = "transcript-app"
  description = "The name of the project – this will provide a prefix for most resource names."
}

variable location {
  type        = string
  default     = "East US"
  description = "Region where the resources will be provisioned."
}
