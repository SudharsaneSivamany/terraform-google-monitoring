variable "project_id" {
  type        = string
  description = "Scope Project"
}

variable "monitor_project" {
  type        = list(string)
  description = "List of Monitored project"
}

variable "json_file" {
  type        = list(string)
  description = "List of Dashboard json file"
}