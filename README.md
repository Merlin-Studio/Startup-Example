# acme-lz2 - Configuration Documentation

> **Generated:** 2026-03-15T13:43:29.788801Z
> **Profile:** Simple
> **Organization:** acme.com

---

## Executive Summary

This document describes the Cloud Foundation configuration for **acme.com**. This establishes your GCP Landing Zone.

| Attribute | Value |
|-----------|-------|
| Cloud Foundation Name | `acme-lz2` |
| Organization ID | `` |
| Primary Region | `us-central1` |
| Configuration Profile | Simple |
| Architecture Type | Standalone |

| Compliance Frameworks | CIS |


| Organization Policies | 8 enforced |


| Log Retention | 365 days |

| Billing Account | `` |


### Compliance Requirements

This cloud foundation is configured to support:

- **CIS**



---

## 1. Organization Structure

### 1.1 Folder Hierarchy


```
acme.com ()
│

├── 📁 Production
│   └── Purpose: environment

├── 📁 Development
│   └── Purpose: environment

```

| Folder | Purpose | Description |
|--------|---------|-------------|

| Production | environment | Production workloads |

| Development | environment | Development and testing |



### 1.2 Bootstrap Projects


| Project Name | Folder | Purpose | APIs |
|--------------|--------|---------|------|

| `prj-shared-services` | Production | cicd | cloudbuild.googleapis.com |



### 1.3 Environments


Configured environments: **Development, Production**


---

## 2. Identity & Access Management

### 2.1 Administrative Groups


| Group Name | Purpose | Roles |
|------------|---------|-------|

| `gcp-admins@acme.com` | org_admin | roles/resourcemanager.organizationAdmin, roles/billing.admin |





### 2.3 Service Accounts


| Name | Project | Purpose | Roles |
|------|---------|---------|-------|

| `terraform-sa` | prj-shared-services | terraform_org | roles/resourcemanager.organizationAdmin, roles/iam.organizationRoleAdmin, roles/orgpolicy.policyAdmin, roles/billing.admin |



---

## 3. Networking

### 3.1 Network Architecture

| Attribute | Value |
|-----------|-------|
| Architecture Type | Standalone |

### 3.2 VPC Networks


| VPC Name | Project | Routing Mode | Purpose |
|----------|---------|--------------|---------|

| `vpc-main` | prj-shared-services | GLOBAL | production |



### 3.3 Subnets


| Subnet | VPC | Region | CIDR | Private Google Access |
|--------|-----|--------|------|----------------------|

| `sb-main-us-central1` | vpc-main | us-central1 | `10.0.0.0/24` | Yes |



---



## 4. Security Configuration

### 4.1 Organization Policies


8 organization policies configured:

| Constraint | Enforcement | Scope |
|---|---|---|

| compute.skipDefaultNetworkCreation | enforce | organization |

| storage.uniformBucketLevelAccess | enforce | organization |

| iam.disableServiceAccountKeyCreation | not_enforce | organization |

| compute.requireShieldedVm | enforce | organization |

| compute.disableSerialPortAccess | enforce | organization |

| compute.requireOsLogin | enforce | organization |

| compute.disableNestedVirtualization | enforce | organization |

| compute.vmExternalIpAccess | deny_all | organization |



---

## 5. Logging & Monitoring

### 5.1 Log Retention

| Setting | Value |
|---------|-------|
| Default Retention Period | 365 days |



### 5.3 Centralized Logging

| Setting | Value |
|---------|-------|
| Logging Project |  |



---



## 6. Cost Management

### 6.1 Budgets


| Budget Name | Amount | Scope |
|-------------|--------|-------|

| Total Monthly Budget | USD 1000 | billing_account |



---

## Next Steps

This wizard has generated **configuration data files** (`.tfvars`) that capture your cloud foundation design decisions. These files are **not directly executable** — they require Terraform modules to consume them.

### What You Have

| File Type | Purpose | Directly Executable? |
|-----------|---------|---------------------|
| `*.tfvars` | Variable values for Terraform | No — needs modules |
| `README.md` | This documentation | N/A |

### How to Use These Files

#### Option 1: Use with Google FAST Fabric (Recommended)

Transform these configurations for use with [Google FAST Fabric](https://github.com/GoogleCloudPlatform/cloud-foundation-fabric/tree/master/fast):

FAST Fabric provides:
- Production-tested modules
- Multi-stage deployment
- Built-in CI/CD integration
- YAML-based factories

#### Option 2: Create Custom Terraform Modules

Use the tfvars as a reference to build your own modules, then reference the generated files:
```bash
terraform plan -var-file="02_resource_hierarchy.auto.tfvars"
```

#### Option 3: Engage Professional Services

Share these files with Google Cloud Professional Services (PSO), Google Cloud Partners, or independent cloud consultants.

### Deployment Order

Deploy in this order when you have modules:

```
1. Bootstrap (0-bootstrap)
   └── 2. Resource Management (1-resman)
       └── 3. Networking (2-networking)
           └── 4. Security (2-security)
               └── 5. Project Factory (3-project-factory)
```

### Getting Help

- **FAST Fabric**: See [FAST documentation](https://github.com/GoogleCloudPlatform/cloud-foundation-fabric/blob/master/fast/README.md)
- **Community**: [r/googlecloud](https://reddit.com/r/googlecloud), [Stack Overflow](https://stackoverflow.com/questions/tagged/google-cloud-platform)


---

## Important Disclaimers

1. **No Warranty**: These configurations are generated based on your inputs. Review thoroughly before any deployment.

2. **Security Review Required**: Have your security team review IAM bindings and org policies before deployment.

3. **Cost Implications**: Deploying this infrastructure will incur GCP charges. Review the Cost Management section.


4. **Not Production-Ready Code**: The tfvars files are design artifacts, not production Terraform modules.


5. **Your Responsibility**: Actual deployment, testing, and maintenance are your responsibility.

---

## Contacts

| Role | Email |
|------|-------|
| Primary Contact | cloudteam@acme.com |


---

Generated by Merlin Studio. Licensed under __CC BY-ND 4.0__