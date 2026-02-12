variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "log_groups" {
  description = "CloudWatch Log Groups to monitor"
  type        = list(string)
}

variable "alert_email" {
  description = "Customer email for alerts"
  type        = string
}

variable "error_filter_pattern" {
  description = "Error pattern to match in logs"
  type        = string
  default     = "ERROR"
}
