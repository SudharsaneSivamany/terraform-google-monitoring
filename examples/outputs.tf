output "metric-scope-ids" {
  value       = module.metric-scope.metric-scope-ids
  description = "ID's of the metric scope"
}
output "monitoring-groups" {
  value       = module.metric-scope.monitoring-groups
  description = "Monitoring group names"
}