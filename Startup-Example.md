# How to Set Up GCP for a Small Team — A Complete Example

---

## The Problem

You're a small team — maybe 5, maybe 10 people. You have a GCP account, a billing card, and a product to build. Setting up GCP properly is not on anyone's roadmap.

So you improvise. One project becomes three. IAM roles get assigned generously because there's no time to be precise. Nobody set up billing alerts until the first surprise invoice. The Terraform state lives on someone's laptop.

None of this is fatal. But six months later, when you hire your first DevOps engineer or your first enterprise customer asks about your security posture, cleaning up that improvised setup takes longer than building it right the first time would have.

This repository shows what "built right the first time" looks like for a small GCP team — simple, documented, and ready to grow.

---

## The Scenario

The organization in this example is a small technology company — 11 to 50 employees, an engineering team of 1 to 5, no dedicated platform team. Cloud native, greenfield — no on-premises infrastructure, no hybrid connectivity. Primary workloads are Cloud Run, Cloud Functions, and Compute Engine. Data services: Cloud SQL, Firestore, Cloud Storage, and Pub/Sub.

One compliance requirement: CIS GCP Benchmarks — not a certification, not an audit. A set of technical best practices that tell you exactly what to configure in GCP and why. Budget under $1,000/month. Two environments: dev and prod. Single region: us-central1.

This is the Simple profile in Merlin — the right fit for a small team that wants a clean, documented GCP foundation without over-engineering it.

---

## From Requirements to Configuration

Before any files are generated, Merlin runs the architect through a structured requirements wizard. For every field, Merlin already knows what CIS GCP Benchmarks require and sets the default accordingly. The architect doesn't research which controls matter — Merlin brings that knowledge to each decision, with compliance badges showing exactly which benchmark requires it and why.

Every confirmed decision is recorded in `spec.json` — the file sitting in this repository. That file is the complete requirements record: what was needed, what was decided, and what Merlin generated from it.

Three examples of how one field in spec.json becomes infrastructure:

**`compliance_requirements: [cis]`** — CIS GCP Benchmarks is a technical checklist maintained by the Center for Internet Security. Unlike SOC 2 or FedRAMP, there is no auditor and no certification process — just a set of configuration checks that define what "secure GCP" looks like. For a startup, it's the honest starting point: not because a customer demands it, but because these are simply the right defaults. Merlin maps CIS requirements directly to org policies, IAM controls, and logging configuration — 8 org policies enforced in this example.

**`encryption_requirements: google_managed`** — Unlike the healthcare and government examples which use CMEK, this startup uses Google-managed encryption. The right choice for a small team: no key management overhead, no KMS costs, full encryption at rest. CMEK adds compliance value when you need to demonstrate key custody — at this stage, it adds complexity without proportional benefit.

**`expected_monthly_spend: under_1k`** — Merlin sets a $1,000 monthly budget with alerts at 50%, 80%, and 100%. Preemptible VMs recommended for dev. No committed use discounts — too early. The billing export to BigQuery is enabled from day one, so when spend grows you already have the data to understand where it's going.

The full `spec.json` is in the repository. Every decision in the rest of this article traces back to a field in that file.

*[Screenshot: Merlin wizard — CIS benchmark badge on a configuration field]*

---

## A Tour of the Repository Outputs

### Architecture Diagrams

*[Screenshot: Resource Hierarchy diagram rendered from architecture.mmd]*

As simple as it gets — 2 folders, 1 shared services project. Production and Development, nothing else. No Security folder, no Networking folder, no Data Platform. A small team doesn't need organizational separation between functions — they need separation between environments. That's what this hierarchy provides.

One VPC, one subnet in us-central1, Private Google Access enabled. No NAT, no interconnect, no peering. Cloud Run and Cloud Functions don't need it — they're serverless. Compute Engine instances reach Google APIs through Private Google Access without a public IP.

### Scorecards

*[Screenshot: Merlin scorecard — 100/100]*

100/100. Zero warnings. This is what a correctly scoped design looks like — not because everything is enabled, but because everything that's enabled is appropriate for the scenario. The government example scored 96/100 with a complex configuration. This scores 100/100 with a simple one. Complexity is not quality.

### Terraform .auto.tfvars Files

11 `.auto.tfvars` files — one per configuration section. Unlike the healthcare and government examples which output FAST YAML for Cloud Foundation Fabric, these are standard Terraform variable files usable with any module structure.

The `DEPLOYMENT_GUIDE.md` in this repository explains exactly how to go from these files to running infrastructure — how to structure your Terraform project, write the variable declarations, configure the state backend, and deploy stage by stage.

### FAST or not FAST?

This example does not use Cloud Foundation Fabric. For a small team with moderate GCP experience, FAST adds dependency and complexity that isn't warranted at this scale. The `.auto.tfvars` output works with standard Google provider modules — simpler to understand, simpler to maintain.

When the team grows and requirements get more complex, regenerating in Merlin at Standard or Advanced profile produces FAST YAML. The migration path exists — you just don't need it yet.

---

## Try It Yourself

Everything in this repository was generated in a single Merlin session. The `spec.json`, the 11 Terraform variable files, the scorecard, the deployment guide — one wizard run for a small technology company that wants a clean GCP foundation without spending weeks on architecture.

The configurations in the healthcare and government repositories in this series use [Cloud Foundation Fabric (FAST)](https://github.com/GoogleCloudPlatform/cloud-foundation-fabric) — Google's reference framework for GCP landing zones. FAST provides the Terraform modules. Merlin generates the configuration data that goes into them. For this Simple profile, the `.auto.tfvars` files work directly with standard Terraform Google provider modules — no framework dependency required.

If your scenario is different — more environments, compliance requirements, hybrid connectivity — the output will be different. That's the point.

The repository is open. Clone it, study it, deploy it as a reference. Or run your own requirements through Merlin at [merlinstudio.cloud](https://site.merlin-studio.cloud) and get a design built for your specific situation — free to try.

---

*Part of the [Merlin Studio](https://site.merlin-studio.cloud) GCP landing zone example series.*
*See also: [Healthcare Example](https://github.com/Merlin-Studio/Healthcare-Example) · [US Federal Agency Example](https://github.com/Merlin-Studio/US-Federal-Agency-Example)*
