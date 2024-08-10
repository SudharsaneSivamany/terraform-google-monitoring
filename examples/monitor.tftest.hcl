run "monitor-apply" {
  command = apply

  variables {
    project_id      = "project-id"
    monitor_project = []
    json_file       = ["dashboard1.json"]
  }

  assert {
    condition     = contains(var.json_file, keys(module.metric-scope.dashboard-ids)[0])
    error_message = "Failed to get dashboard ids"
  }

  assert {
    condition     = length(module.metric-scope.monitoring-groups) == 3
    error_message = "Failed to get monitoring group ids"
  }
}