
variable "license_id" {
  description = "PingOne License ID"
  type        = string
}

variable "admin_environment_id" {
  description = "PingOne Admin Environment ID"
  type        = string
  default     = ""
}


variable "target_environment_name" {
  description = "PingOne Target Environment Name"
  type        = string
}


variable "target_environment_description" {
  description = "PingOne Target Environment Description"
  type        = string
  default     = ""
}

variable "admin_user_id" {
  description = "Target Environment Admin User ID"
  type        = string
  default     = ""
}

variable "flow_url" {
  description = "DaVinci Flow URL containing JSON"
  type        = string
}
