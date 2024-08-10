/* 
MIT License

Copyright (c) 2024 Sudharsane Sivamany

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

*/

variable "scoping_project" {
  type        = string
  description = "Scope Project"
}

variable "dashboard_json" {
  type        = list(string)
  description = "List of Dashboard json file"
  default     = []
}

variable "monitored_project" {
  type        = list(string)
  description = "List of Monitored project"
  default     = []
}

variable "monitoring_group" {
  type = list(object({
    name        = string
    parent_name = optional(string, null)
    filter      = string
    is_cluster  = optional(bool, false)
  }))
  default     = []
  description = "List of Monitoring Resouce Groups"
}