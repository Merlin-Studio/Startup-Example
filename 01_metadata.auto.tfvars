
# ============================================================================
# LANDING ZONE METADATA
# ============================================================================

# Landing Zone Identification
# These values are used as prefixes and identifiers throughout your infrastructure
organization_domain = "acme.com"
landing_zone_name = "acme-lz2"

# Organization & Billing
# Source: User provided during wizard
organization = {
  id = ""
}

billing_account = {
  id = ""
}

# Primary Contact Information
# Used for critical alerts, billing notifications, and maintenance updates
contacts = {
  primary_email = "cloudteam@acme.com"
}

# Environment Configuration
# Determines default security posture and configuration
environment_type = "multi_env"

# Compliance Requirements
# These frameworks will influence org policies, logging, encryption, and access controls
compliance_frameworks = [
  "cis"
]

# ============================================================================
# REGIONAL CONFIGURATION
# ============================================================================

# Primary region for most resources
primary_region = "us-central1"

# Single region deployment (no DR region configured)
# secondary_region = null

# ============================================================================
# RESOURCE LABELING STRATEGY
# ============================================================================

# Default labels applied to all resources
# These enable cost allocation, automation, and organization
default_labels = {
  environment = "prod"
}

# Required labels - enforced via organization policies
required_labels = [
  "environment"
]

# ============================================================================
# INFRASTRUCTURE AS CODE CONFIGURATION
# ============================================================================

# Terraform state bucket will be auto-generated based on landing zone name
# automation = {
#   outputs_bucket = "acme-lz2-terraform-state"
# }

# ============================================================================
# OPTIONAL DOCUMENTATION & SUPPORT
# ============================================================================



# Configuration tracking
config_version = "1.0.0"

created_date = "2026-03-15"

# ============================================================================
