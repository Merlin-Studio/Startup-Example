
# ============================================================================
# BIGQUERY CONFIGURATION
# ============================================================================
# Serverless data warehouse for analytics and machine learning

bigquery_config = {
  enabled = true
  
  # Default dataset location
  default_location = "US"
  

  # Encryption Settings
  cmek_enabled = true

  # Security Features
  authorized_datasets = false
  column_level_security = false
  data_masking = false
}

# BigQuery Dataset Defaults
# Apply these settings when creating new datasets
bigquery_dataset_defaults = {
  location = "US"

  access = [
    {
      role          = "OWNER"
      special_group = "projectOwners"
    },
    {
      role          = "READER"
      special_group = "projectReaders"
    }
  ]
  
  labels = {
    managed_by = "terraform"
    created_by = "landing-zone-wizard"
  }
}

# ============================================================================
# CLOUD STORAGE CONFIGURATION
# ============================================================================
# Object storage for any amount of data

cloud_storage_config = {
  enabled = true
  
  # Default storage class for new buckets
  default_storage_class = "STANDARD"
  
  # Access Control
  uniform_bucket_level_access = true
  public_access_prevention = "enforced"
  
  # Data Protection
  versioning_enabled = true
  
  # Encryption
  cmek_enabled = true

  # Retention
  retention_policy_enabled = false
}

# Cloud Storage Bucket Defaults
# Apply these settings when creating new buckets
gcs_bucket_defaults = {
  storage_class = "STANDARD"
  location      = "US"
  
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
  
  versioning = {
    enabled = true
  }


  labels = {
    managed_by = "terraform"
    created_by = "landing-zone-wizard"
  }
}


# ============================================================================
# CLOUD SQL CONFIGURATION
# ============================================================================
# Managed relational databases (PostgreSQL, MySQL, SQL Server)

cloud_sql_config = {
  enabled = false
}

# Cloud SQL is disabled
# Enable in wizard to configure managed databases

# ============================================================================
# PUB/SUB CONFIGURATION
# ============================================================================
# Messaging and event streaming

pubsub_config = {
  enabled = false
}

# Pub/Sub is disabled
# Enable in wizard to configure messaging infrastructure

# ============================================================================
# FIRESTORE CONFIGURATION
# ============================================================================
# Serverless NoSQL document database

firestore_config = {
  enabled = false
}

# Firestore is disabled
# Enable in wizard to configure NoSQL document database

# ============================================================================
# DATAFLOW CONFIGURATION
# ============================================================================
# Stream and batch data processing

dataflow_config = {
  enabled = false
}

# Dataflow is disabled
# Enable in wizard for stream/batch data processing

# ============================================================================
# DATA SERVICES SUMMARY
# ============================================================================
# Summary of enabled data platform services

data_services_enabled = {
  bigquery      = true
  cloud_storage = true
  cloud_sql     = false
  pubsub        = false
  firestore     = false
  dataflow      = false
}

# CMEK Encryption Status
cmek_status = {
  bigquery      = true
  cloud_storage = true
}

# ============================================================================
# DATA PLATFORM SUMMARY
# ============================================================================
# Summary of data platform configuration

# Enabled Services:
#   - BigQuery (Location: US)
#   - Cloud Storage (Class: STANDARD)

# ============================================================================
# Next Steps:
# 1. Review the generated configuration above
# 2. Run: terraform init
# 3. Run: terraform plan -out=13_data_platform.tfplan
# 4. Review the plan carefully
# 5. Run: terraform apply 13_data_platform.tfplan
# 7. Create KMS keys for CMEK encryption
# ============================================================================
