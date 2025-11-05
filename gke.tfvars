# Copy this file to terraform.tfvars and fill in your values

project_id   = ""
cluster_name = "my-gke-cluster"
region       = "us-central1"
zones        = ["us-central1-a", "us-central1-b", "us-central1-c"]
machine_type = "n1-standard-1"

# Optional: specify a custom service account
# compute_engine_service_account = "your-service-account@your-project.iam.gserviceaccount.com"
