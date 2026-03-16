
# ============================================================================
# IDENTITY PROVIDER CONFIGURATION
# ============================================================================

# Primary identity source for GCP access
identity_provider = "google_workspace"


# ============================================================================
# ADMINISTRATIVE GROUPS
# Organization-level access management groups
# ============================================================================

# Organization IAM bindings (derived from admin groups)
org_iam = {
  "roles/resourcemanager.organizationAdmin" = [
    "group:gcp-admins@acme.com",
  ]
  "roles/billing.admin" = [
    "group:gcp-admins@acme.com",
  ]
}

# Admin groups configuration for reference and automation
admin_groups = {
  "org_admin" = {
    name        = "gcp-admins@acme.com"
    purpose     = "org_admin"
    roles       = [
      "roles/resourcemanager.organizationAdmin",
      "roles/billing.admin"
    ]
    description = "Cloud administrators"
  }
}

# ============================================================================
# SERVICE ACCOUNTS
# Bootstrap and automation service accounts
# ============================================================================

service_accounts = {
  "terraform-sa" = {
    display_name         = "Terraform Automation"
    purpose              = "terraform_org"
    project              = "prj-shared-services"
    disable_key_creation = true
    
    # IAM roles granted to this service account
    roles = [
      "roles/resourcemanager.organizationAdmin",
      "roles/iam.organizationRoleAdmin",
      "roles/orgpolicy.policyAdmin",
      "roles/billing.admin"
    ]
    
    # Principals allowed to impersonate this service account
    impersonators = [
      "group:gcp-admins@acme.com"
    ]
  }
}

# ============================================================================
# WORKLOAD IDENTITY FEDERATION
# Keyless authentication for external workloads
# ============================================================================

# Workload Identity Federation not configured
# workload_identity_pools = {}

# ============================================================================
# SERVICE ACCOUNT KEY POLICY
# Organization policy for SA key creation
# ============================================================================

service_account_key_policy = "deny_all"


# Organization policy constraint for SA key creation
org_policy_sa_key_creation = {
  "constraints/iam.disableServiceAccountKeyCreation" = {
    rules = [{ enforce = true }]
  }
  "constraints/iam.disableServiceAccountKeyUpload" = {
    rules = [{ enforce = true }]
  }
}

# ============================================================================
# DOMAIN RESTRICTED SHARING
# Restrict IAM grants to specific domains
# ============================================================================

domain_restricted_sharing = {
  enabled              = true
  allowed_domains      = [
    "acme.com"
  ]
  allow_google_managed = true
}

# Organization policy for domain restriction
org_policy_domain_restriction = {
  "constraints/iam.allowedPolicyMemberDomains" = {
    rules = [
      {
        allow = {
          values = [
            "is:acme.com"
          ]
        }
      }
    ]
  }
}

# ============================================================================
# API KEY MANAGEMENT POLICY (CIS GCP 1.12-1.15)
# ============================================================================


# ============================================================================
# BREAK-GLASS ACCOUNTS
# Emergency access for disaster recovery
# ============================================================================

# Break-glass accounts not configured
# RECOMMENDATION: Configure at least one break-glass account for emergency access
# break_glass_accounts = {}

# ============================================================================
# PRIVILEGED ACCESS MANAGEMENT (PAM)
# Just-in-time elevated access with approvals
# ============================================================================

# Privileged Access Management not enabled
privileged_access_management = {
  enabled = false
}

# ============================================================================
# IAM RECOMMENDER
# Automated permission recommendations
# ============================================================================

iam_recommender = {
  enabled            = true
  auto_apply         = false
  notification_email = ""
}

# ============================================================================
# CUSTOM ROLES
# Organization-specific custom IAM roles
# ============================================================================

# No custom roles defined
# custom_roles = {}

# ============================================================================
# DERIVED VALUES - Computed for reference
# ============================================================================

# All admin group emails for easy reference

# Service account emails

# Identity provider type

# Compliance-driven settings

# ============================================================================
# Next Steps:
# 1. Create admin groups in your identity provider before applying
# 2. Review service account permissions follow least-privilege
# 3. Configure Workload Identity Federation for external workloads
# 4. Proceed to 04_networking.tfvars for network configuration
# ============================================================================
