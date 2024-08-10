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


locals {
  root_group        = [for val in var.monitoring_group : val if val.parent_name == null]
  sub_group_level_1 = setsubtract(distinct([for val in var.monitoring_group : val.parent_name == null ? {} : contains(local.root_group[*].name, val.parent_name) ? val : {}]), [{}])
  sub_group_level_2 = setsubtract(distinct([for val in var.monitoring_group : val.parent_name == null ? {} : contains(local.sub_group_level_1[*].name, val.parent_name) ? val : {}]), [{}])
  sub_group_level_3 = setsubtract(distinct([for val in var.monitoring_group : val.parent_name == null ? {} : contains(local.sub_group_level_2[*].name, val.parent_name) ? val : {}]), [{}])
  sub_group_level_4 = setsubtract(distinct([for val in var.monitoring_group : val.parent_name == null ? {} : contains(local.sub_group_level_3[*].name, val.parent_name) ? val : {}]), [{}])
  sub_group_level_5 = setsubtract(distinct([for val in var.monitoring_group : val.parent_name == null ? {} : contains(local.sub_group_level_4[*].name, val.parent_name) ? val : {}]), [{}])
  sub_group_level_6 = setsubtract(distinct([for val in var.monitoring_group : val.parent_name == null ? {} : contains(local.sub_group_level_5[*].name, val.parent_name) ? val : {}]), [{}])
  sub_group_level_7 = setsubtract(distinct([for val in var.monitoring_group : val.parent_name == null ? {} : contains(local.sub_group_level_6[*].name, val.parent_name) ? val : {}]), [{}])
  sub_group_level_8 = setsubtract(distinct([for val in var.monitoring_group : val.parent_name == null ? {} : contains(local.sub_group_level_7[*].name, val.parent_name) ? val : {}]), [{}])
  output_mg = flatten([[for id in local.root_group : { (id.name) = google_monitoring_group.root-group[id.name].name }],
    [for id in local.sub_group_level_1 : { (id.name) = google_monitoring_group.sub-group-level-1[id.name].name }],
    [for id in local.sub_group_level_2 : { (id.name) = google_monitoring_group.sub-group-level-2[id.name].name }],
    [for id in local.sub_group_level_3 : { (id.name) = google_monitoring_group.sub-group-level-3[id.name].name }],
    [for id in local.sub_group_level_4 : { (id.name) = google_monitoring_group.sub-group-level-4[id.name].name }],
    [for id in local.sub_group_level_5 : { (id.name) = google_monitoring_group.sub-group-level-5[id.name].name }],
    [for id in local.sub_group_level_6 : { (id.name) = google_monitoring_group.sub-group-level-6[id.name].name }],
    [for id in local.sub_group_level_7 : { (id.name) = google_monitoring_group.sub-group-level-7[id.name].name }],
  [for id in local.sub_group_level_8 : { (id.name) = google_monitoring_group.sub-group-level-8[id.name].name }]])
}

resource "google_monitoring_dashboard" "dashboard" {
  for_each       = toset(var.dashboard_json)
  dashboard_json = file("${path.root}/${each.value}")
  project        = var.scoping_project
}

#attach project to scoping project

resource "google_monitoring_monitored_project" "primary" {
  for_each      = toset(var.monitored_project)
  metrics_scope = var.scoping_project
  name          = each.value
}

#monitoring groups

resource "google_monitoring_group" "root-group" {
  depends_on   = [google_monitoring_monitored_project.primary]
  for_each     = { for i in local.root_group : i.name => i }
  display_name = each.key
  parent_name  = each.value.parent_name
  filter       = each.value.filter
  project      = var.scoping_project
  is_cluster   = each.value.is_cluster

}

resource "google_monitoring_group" "sub-group-level-1" {
  for_each     = { for i in local.sub_group_level_1 : i.name => i }
  display_name = each.key
  parent_name  = google_monitoring_group.root-group[each.value.parent_name].name
  filter       = each.value.filter
  project      = var.scoping_project
  is_cluster   = each.value.is_cluster
}

resource "google_monitoring_group" "sub-group-level-2" {
  for_each     = { for i in local.sub_group_level_2 : i.name => i }
  display_name = each.key
  parent_name  = google_monitoring_group.sub-group-level-1[each.value.parent_name].name
  filter       = each.value.filter
  project      = var.scoping_project
  is_cluster   = each.value.is_cluster
}

resource "google_monitoring_group" "sub-group-level-3" {
  for_each     = { for i in local.sub_group_level_3 : i.name => i }
  display_name = each.key
  parent_name  = google_monitoring_group.sub-group-level-2[each.value.parent_name].name
  filter       = each.value.filter
  project      = var.scoping_project
  is_cluster   = each.value.is_cluster
}

resource "google_monitoring_group" "sub-group-level-4" {
  for_each     = { for i in local.sub_group_level_4 : i.name => i }
  display_name = each.key
  parent_name  = google_monitoring_group.sub-group-level-3[each.value.parent_name].name
  filter       = each.value.filter
  project      = var.scoping_project
  is_cluster   = each.value.is_cluster
}

resource "google_monitoring_group" "sub-group-level-5" {
  for_each     = { for i in local.sub_group_level_5 : i.name => i }
  display_name = each.key
  parent_name  = google_monitoring_group.sub-group-level-4[each.value.parent_name].name
  filter       = each.value.filter
  project      = var.scoping_project
  is_cluster   = each.value.is_cluster
}

resource "google_monitoring_group" "sub-group-level-6" {
  for_each     = { for i in local.sub_group_level_6 : i.name => i }
  display_name = each.key
  parent_name  = google_monitoring_group.sub-group-level-5[each.value.parent_name].name
  filter       = each.value.filter
  project      = var.scoping_project
  is_cluster   = each.value.is_cluster
}

resource "google_monitoring_group" "sub-group-level-7" {
  for_each     = { for i in local.sub_group_level_7 : i.name => i }
  display_name = each.key
  parent_name  = google_monitoring_group.sub-group-level-6[each.value.parent_name].name
  filter       = each.value.filter
  project      = var.scoping_project
  is_cluster   = each.value.is_cluster
}

resource "google_monitoring_group" "sub-group-level-8" {
  for_each     = { for i in local.sub_group_level_8 : i.name => i }
  display_name = each.key
  parent_name  = google_monitoring_group.sub-group-level-7[each.value.parent_name].name
  filter       = each.value.filter
  project      = var.scoping_project
  is_cluster   = each.value.is_cluster
}
