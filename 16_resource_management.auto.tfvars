
# ============================================================================
# LABELING STRATEGY
# Labels for cost allocation, organization, and automation
# ============================================================================

labeling_strategy = {
  # Required labels - must be present on all resources
  required_labels = {
    "environment" = {
      key         = "environment"
      description = "Deployment environment"
      allowed_values = [
        "dev",
        "prod"
      ]
      default_value = ""
    }
  }

  recommended_labels = {}

  # Label enforcement configuration
  label_enforcement = {
    enabled           = false
  }

  cost_allocation_labels = []
}

# Required label keys (for org policy)
required_label_keys = [
  "environment"
]

# ============================================================================
# RESOURCE TAGS
# Tags for conditional IAM and policy binding
# ============================================================================

resource_tags = {
  enabled = false
}

# ============================================================================
# NAMING CONVENTIONS
# Standardized naming patterns for resources
# ============================================================================

naming_conventions = {
  # Project naming pattern
  project_pattern = "{org}-{env}-{purpose}"
  
  # Resource-specific naming patterns
  resource_patterns = {
    "vpc" = {
      pattern = "vpc-{env}"
      example = "vpc-prod"
    },
    "gcs_bucket" = {
      pattern = "{org}-{env}-{purpose}"
      example = "acme-prod-data"
    }
  }

  abbreviations = {}
}

# ============================================================================
# QUOTA MANAGEMENT
# Monitor and plan for quota limits
# ============================================================================

quota_management = {
  quota_alerts_enabled    = true
  alert_threshold_percent = 80
  
  monitored_quotas = [
    "compute.googleapis.com/cpus",
    "compute.googleapis.com/ssd_total_gb"
  ]

  quota_increase_requests = []
}

# Quota monitoring alert policies
quota_alerts = {
  "compute-googleapis-com-cpus" = {
    metric_type = "serviceruntime.googleapis.com/quota/allocation/usage"
    filter      = "metric.type=\"serviceruntime.googleapis.com/quota/allocation/usage\" AND metric.labels.quota_metric=\"compute.googleapis.com/cpus\""
    threshold   = 0.8
  },
  "compute-googleapis-com-ssd_total_gb" = {
    metric_type = "serviceruntime.googleapis.com/quota/allocation/usage"
    filter      = "metric.type=\"serviceruntime.googleapis.com/quota/allocation/usage\" AND metric.labels.quota_metric=\"compute.googleapis.com/ssd_total_gb\""
    threshold   = 0.8
  }
}

# ============================================================================
# ASSET INVENTORY
# Track all GCP resources
# ============================================================================

asset_inventory = {
  enabled = false
}

# ============================================================================
# RESOURCE CLEANUP POLICIES
# Identify and clean up unused resources
# ============================================================================

resource_cleanup_policies = {
  enabled = false
}

# ============================================================================
# DERIVED VALUES - Computed resource management flags
# ============================================================================

# Labeling

# Tags

# Naming

# Asset inventory

# Cleanup

# All abbreviations as a map

# ============================================================================
# Next Steps:
# 1. Enforce required labels via org policy
# 2. Create tag keys and bindings for conditional IAM
# 3. Document naming conventions for your team
# 4. Set up asset inventory exports to BigQuery
# 5. Configure cleanup policies starting with alert-only mode
# ============================================================================
