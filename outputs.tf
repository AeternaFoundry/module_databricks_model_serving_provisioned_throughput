output "model_serving_provisioned_throughputs_id" {
  description = "Map of id values across all model_serving_provisioned_throughputs, keyed the same as var.model_serving_provisioned_throughputs except keys with no id are omitted"
  value       = { for k, v in databricks_model_serving_provisioned_throughput.model_serving_provisioned_throughputs : k => v.id if v.id != null && length(v.id) > 0 }
}
output "model_serving_provisioned_throughputs_ai_gateway" {
  description = "Map of ai_gateway values across all model_serving_provisioned_throughputs, keyed the same as var.model_serving_provisioned_throughputs except keys with no ai_gateway are omitted"
  value       = { for k, v in databricks_model_serving_provisioned_throughput.model_serving_provisioned_throughputs : k => one(v.ai_gateway) if v.ai_gateway != null && length(v.ai_gateway) > 0 }
}
output "model_serving_provisioned_throughputs_budget_policy_id" {
  description = "Map of budget_policy_id values across all model_serving_provisioned_throughputs, keyed the same as var.model_serving_provisioned_throughputs except keys with no budget_policy_id are omitted"
  value       = { for k, v in databricks_model_serving_provisioned_throughput.model_serving_provisioned_throughputs : k => v.budget_policy_id if v.budget_policy_id != null && length(v.budget_policy_id) > 0 }
}
output "model_serving_provisioned_throughputs_config" {
  description = "Map of config values across all model_serving_provisioned_throughputs, keyed the same as var.model_serving_provisioned_throughputs except keys with no config are omitted"
  value       = { for k, v in databricks_model_serving_provisioned_throughput.model_serving_provisioned_throughputs : k => one(v.config) if v.config != null && length(v.config) > 0 }
}
output "model_serving_provisioned_throughputs_email_notifications" {
  description = "Map of email_notifications values across all model_serving_provisioned_throughputs, keyed the same as var.model_serving_provisioned_throughputs except keys with no email_notifications are omitted"
  value       = { for k, v in databricks_model_serving_provisioned_throughput.model_serving_provisioned_throughputs : k => one(v.email_notifications) if v.email_notifications != null && length(v.email_notifications) > 0 }
}
output "model_serving_provisioned_throughputs_name" {
  description = "Map of name values across all model_serving_provisioned_throughputs, keyed the same as var.model_serving_provisioned_throughputs except keys with no name are omitted"
  value       = { for k, v in databricks_model_serving_provisioned_throughput.model_serving_provisioned_throughputs : k => v.name if v.name != null && length(v.name) > 0 }
}
output "model_serving_provisioned_throughputs_provider_config" {
  description = "Map of provider_config values across all model_serving_provisioned_throughputs, keyed the same as var.model_serving_provisioned_throughputs except keys with no provider_config are omitted"
  value       = { for k, v in databricks_model_serving_provisioned_throughput.model_serving_provisioned_throughputs : k => one(v.provider_config) if v.provider_config != null && length(v.provider_config) > 0 }
}
output "model_serving_provisioned_throughputs_serving_endpoint_id" {
  description = "Map of serving_endpoint_id values across all model_serving_provisioned_throughputs, keyed the same as var.model_serving_provisioned_throughputs except keys with no serving_endpoint_id are omitted"
  value       = { for k, v in databricks_model_serving_provisioned_throughput.model_serving_provisioned_throughputs : k => v.serving_endpoint_id if v.serving_endpoint_id != null && length(v.serving_endpoint_id) > 0 }
}
output "model_serving_provisioned_throughputs_tags" {
  description = "Map of tags values across all model_serving_provisioned_throughputs, keyed the same as var.model_serving_provisioned_throughputs except keys with no tags are omitted"
  value       = { for k, v in databricks_model_serving_provisioned_throughput.model_serving_provisioned_throughputs : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

