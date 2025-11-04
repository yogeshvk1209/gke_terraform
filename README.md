# GKE Terraform Configuration

This Terraform configuration creates a Google Kubernetes Engine (GKE) cluster using the official `terraform-google-modules/kubernetes-engine/google` module.

## Prerequisites

1. Google Cloud SDK installed and configured
2. Terraform >= 1.0 installed
3. A GCP project with the following APIs enabled:
   - Kubernetes Engine API
   - Compute Engine API

## Setup

1. Copy the example variables file:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

2. Edit `terraform.tfvars` with your GCP project details:
   ```hcl
   project_id   = "your-gcp-project-id"
   cluster_name = "my-gke-cluster"
   region       = "us-central1"
   ```

3. Initialize Terraform:
   ```bash
   terraform init
   ```

4. Plan the deployment:
   ```bash
   terraform plan
   ```

5. Apply the configuration:
   ```bash
   terraform apply
   ```

## What's Created

- VPC network with custom subnet
- GKE regional cluster with:
  - 1-3 nodes (auto-scaling enabled)
  - e2-medium machine type
  - Container-Optimized OS
  - Horizontal Pod Autoscaling enabled

## Connecting to the Cluster

After deployment, configure kubectl:

```bash
gcloud container clusters get-credentials $(terraform output -raw kubernetes_cluster_name) --region $(terraform output -raw region) --project $(terraform output -raw project_id)
```

## Cleanup

To destroy the infrastructure:

```bash
terraform destroy
```

## Customization

You can customize the cluster by modifying variables in `terraform.tfvars`:

- `cluster_name`: Name of your GKE cluster
- `region`: GCP region for the cluster
- `zones`: Specific zones within the region
- `compute_engine_service_account`: Custom service account for nodes