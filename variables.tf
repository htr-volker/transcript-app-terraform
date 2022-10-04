variable project_name {
  type        = string
  default     = "transcript-app"
  description = "The name of the project – this will provide a prefix for most resource names."
}

variable location {
  type        = string
  default     = "UK South"
  description = "Region where the resources will be provisioned."
}

variable owner {
  type        = string
  description = "Owner of the resource (used in resource tagging)."
}

