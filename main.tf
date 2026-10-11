resource "databricks_model_serving_provisioned_throughput" "model_serving_provisioned_throughputs" {
  for_each = var.model_serving_provisioned_throughputs

  name             = each.value.name
  budget_policy_id = each.value.budget_policy_id

  config {
    dynamic "served_entities" {
      for_each = each.value.config.served_entities != null ? each.value.config.served_entities : []
      content {
        burst_scaling_enabled   = served_entities.value.burst_scaling_enabled
        entity_name             = served_entities.value.entity_name
        entity_version          = served_entities.value.entity_version
        name                    = served_entities.value.name
        provisioned_model_units = served_entities.value.provisioned_model_units
      }
    }
    dynamic "traffic_config" {
      for_each = each.value.config.traffic_config != null ? [each.value.config.traffic_config] : []
      content {
        dynamic "routes" {
          for_each = traffic_config.value.routes != null ? traffic_config.value.routes : []
          content {
            served_entity_name = routes.value.served_entity_name
            served_model_name  = routes.value.served_model_name
            traffic_percentage = routes.value.traffic_percentage
          }
        }
      }
    }
  }

  dynamic "ai_gateway" {
    for_each = each.value.ai_gateway != null ? [each.value.ai_gateway] : []
    content {
      dynamic "fallback_config" {
        for_each = ai_gateway.value.fallback_config != null ? [ai_gateway.value.fallback_config] : []
        content {
          enabled = fallback_config.value.enabled
        }
      }
      dynamic "guardrails" {
        for_each = ai_gateway.value.guardrails != null ? [ai_gateway.value.guardrails] : []
        content {
          dynamic "input" {
            for_each = guardrails.value.input != null ? [guardrails.value.input] : []
            content {
              invalid_keywords = input.value.invalid_keywords
              dynamic "pii" {
                for_each = input.value.pii != null ? [input.value.pii] : []
                content {
                  behavior = pii.value.behavior
                }
              }
              safety       = input.value.safety
              valid_topics = input.value.valid_topics
            }
          }
          dynamic "output" {
            for_each = guardrails.value.output != null ? [guardrails.value.output] : []
            content {
              invalid_keywords = output.value.invalid_keywords
              dynamic "pii" {
                for_each = output.value.pii != null ? [output.value.pii] : []
                content {
                  behavior = pii.value.behavior
                }
              }
              safety       = output.value.safety
              valid_topics = output.value.valid_topics
            }
          }
        }
      }
      dynamic "inference_table_config" {
        for_each = ai_gateway.value.inference_table_config != null ? [ai_gateway.value.inference_table_config] : []
        content {
          catalog_name      = inference_table_config.value.catalog_name
          enabled           = inference_table_config.value.enabled
          schema_name       = inference_table_config.value.schema_name
          table_name_prefix = inference_table_config.value.table_name_prefix
        }
      }
      dynamic "rate_limits" {
        for_each = ai_gateway.value.rate_limits != null ? ai_gateway.value.rate_limits : []
        content {
          calls          = rate_limits.value.calls
          key            = rate_limits.value.key
          principal      = rate_limits.value.principal
          renewal_period = rate_limits.value.renewal_period
          tokens         = rate_limits.value.tokens
        }
      }
      dynamic "usage_tracking_config" {
        for_each = ai_gateway.value.usage_tracking_config != null ? [ai_gateway.value.usage_tracking_config] : []
        content {
          enabled = usage_tracking_config.value.enabled
        }
      }
    }
  }

  dynamic "email_notifications" {
    for_each = each.value.email_notifications != null ? [each.value.email_notifications] : []
    content {
      on_update_failure = email_notifications.value.on_update_failure
      on_update_success = email_notifications.value.on_update_success
    }
  }

  dynamic "provider_config" {
    for_each = each.value.provider_config != null ? [each.value.provider_config] : []
    content {
      workspace_id = provider_config.value.workspace_id
    }
  }

  dynamic "tags" {
    for_each = each.value.tags != null ? each.value.tags : []
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      update = timeouts.value.update
    }
  }
}

