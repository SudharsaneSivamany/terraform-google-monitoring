# terraform-google-monitoring
This module is used to create dashboards, add multiple projects as monitored project under a scoping project and to create monitoring resource groups/subgroups.

## Note: Groups and sub-groups name should be unique

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_monitoring_dashboard.dashboard](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_dashboard) | resource |
| [google_monitoring_group.root-group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_group) | resource |
| [google_monitoring_group.sub-group-level-1](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_group) | resource |
| [google_monitoring_group.sub-group-level-2](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_group) | resource |
| [google_monitoring_group.sub-group-level-3](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_group) | resource |
| [google_monitoring_group.sub-group-level-4](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_group) | resource |
| [google_monitoring_group.sub-group-level-5](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_group) | resource |
| [google_monitoring_group.sub-group-level-6](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_group) | resource |
| [google_monitoring_group.sub-group-level-7](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_group) | resource |
| [google_monitoring_group.sub-group-level-8](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_group) | resource |
| [google_monitoring_monitored_project.primary](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_monitored_project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dashboard_json"></a> [dashboard\_json](#input\_dashboard\_json) | List of Dashboard json file | `list(string)` | `[]` | no |
| <a name="input_monitored_project"></a> [monitored\_project](#input\_monitored\_project) | List of Monitored project | `list(string)` | `[]` | no |
| <a name="input_monitoring_group"></a> [monitoring\_group](#input\_monitoring\_group) | List of Monitoring Resouce Groups | <pre>list(object({<br>    name        = string<br>    parent_name = optional(string, null)<br>    filter      = string<br>    is_cluster  = optional(bool, false)<br>  }))</pre> | `[]` | no |
| <a name="input_scoping_project"></a> [scoping\_project](#input\_scoping\_project) | Scope Project | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dashboard-ids"></a> [dashboard-ids](#output\_dashboard-ids) | ID's of the Dashboards |
| <a name="output_metric-scope-ids"></a> [metric-scope-ids](#output\_metric-scope-ids) | ID's of the metric scope |
| <a name="output_monitoring-groups"></a> [monitoring-groups](#output\_monitoring-groups) | Monitoring group names |
