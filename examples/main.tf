module "metric-scope" {
  source            = "../"
  scoping_project   = var.project_id
  monitored_project = var.monitor_project
  dashboard_json    = var.json_file
  monitoring_group = [{
    name   = "group-a"
    filter = "resource.metadata.region= \"us-central1\""
    }, {
    name        = "sub-group-a1"
    parent_name = "group-a"
    filter      = "resource.metadata.region= \"us-central1\""
    }, {
    name        = "sub-group-a2"
    parent_name = "group-a"
    filter      = "resource.metadata.region= \"us-central1\""
  }]
}