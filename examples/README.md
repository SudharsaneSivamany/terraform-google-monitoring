## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_metric-scope"></a> [metric-scope](#module\_metric-scope) | ../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_json_file"></a> [json\_file](#input\_json\_file) | List of Dashboard json file | `list(string)` | n/a | yes |
| <a name="input_monitor_project"></a> [monitor\_project](#input\_monitor\_project) | List of Monitored project | `list(string)` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Scope Project | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_metric-scope-ids"></a> [metric-scope-ids](#output\_metric-scope-ids) | ID's of the metric scope |
| <a name="output_monitoring-groups"></a> [monitoring-groups](#output\_monitoring-groups) | Monitoring group names |
