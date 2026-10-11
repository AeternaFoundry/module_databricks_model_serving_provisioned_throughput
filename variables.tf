variable "model_serving_provisioned_throughputs" {
  description = <<EOT
Map of model_serving_provisioned_throughputs, attributes below
Required:
    - name
    - config (block):
        - served_entities (optional, block):
            - burst_scaling_enabled (optional)
            - entity_name (required)
            - entity_version (required)
            - name (optional)
            - provisioned_model_units (required)
        - traffic_config (optional, block):
            - routes (optional, block):
                - served_entity_name (optional)
                - served_model_name (optional)
                - traffic_percentage (required)
Optional:
    - budget_policy_id
    - ai_gateway (block):
        - fallback_config (optional, block):
            - enabled (required)
        - guardrails (optional, block):
            - input (optional, block):
                - invalid_keywords (optional)
                - pii (optional, block):
                    - behavior (optional)
                - safety (optional)
                - valid_topics (optional)
            - output (optional, block):
                - invalid_keywords (optional)
                - pii (optional, block):
                    - behavior (optional)
                - safety (optional)
                - valid_topics (optional)
        - inference_table_config (optional, block):
            - catalog_name (optional)
            - enabled (optional)
            - schema_name (optional)
            - table_name_prefix (optional)
        - rate_limits (optional, block):
            - calls (optional)
            - key (optional)
            - principal (optional)
            - renewal_period (required)
            - tokens (optional)
        - usage_tracking_config (optional, block):
            - enabled (optional)
    - email_notifications (block):
        - on_update_failure (optional)
        - on_update_success (optional)
    - provider_config (block):
        - workspace_id (optional)
    - tags (block):
        - key (required)
        - value (optional)
    - timeouts (block):
        - create (optional)
        - update (optional)
EOT

  type = map(object({
    name             = string
    budget_policy_id = optional(string)
    config = object({
      served_entities = optional(list(object({
        burst_scaling_enabled   = optional(bool)
        entity_name             = string
        entity_version          = string
        name                    = optional(string)
        provisioned_model_units = number
      })))
      traffic_config = optional(object({
        routes = optional(list(object({
          served_entity_name = optional(string)
          served_model_name  = optional(string)
          traffic_percentage = number
        })))
      }))
    })
    ai_gateway = optional(object({
      fallback_config = optional(object({
        enabled = bool
      }))
      guardrails = optional(object({
        input = optional(object({
          invalid_keywords = optional(list(string))
          pii = optional(object({
            behavior = optional(string)
          }))
          safety       = optional(bool)
          valid_topics = optional(list(string))
        }))
        output = optional(object({
          invalid_keywords = optional(list(string))
          pii = optional(object({
            behavior = optional(string)
          }))
          safety       = optional(bool)
          valid_topics = optional(list(string))
        }))
      }))
      inference_table_config = optional(object({
        catalog_name      = optional(string)
        enabled           = optional(bool)
        schema_name       = optional(string)
        table_name_prefix = optional(string)
      }))
      rate_limits = optional(list(object({
        calls          = optional(number)
        key            = optional(string)
        principal      = optional(string)
        renewal_period = string
        tokens         = optional(number)
      })))
      usage_tracking_config = optional(object({
        enabled = optional(bool)
      }))
    }))
    email_notifications = optional(object({
      on_update_failure = optional(list(string))
      on_update_success = optional(list(string))
    }))
    provider_config = optional(object({
      workspace_id = optional(string)
    }))
    tags = optional(list(object({
      key   = string
      value = optional(string)
    })))
    timeouts = optional(object({
      create = optional(string)
      update = optional(string)
    }))
  }))
}

