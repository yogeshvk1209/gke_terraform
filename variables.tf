variable "project_id" {
  description = "The project ID to host the cluster in"
  type        = string
}

variable "cluster_name" {
  description = "The name for the GKE cluster"
  type        = string
  default     = "my-gke-cluster"
}

variable "region" {
  description = "The region to host the cluster in"
  type        = string
}

variable "machine_type" {
  description = "The machine type for GKE nodes"
  type        = string
}

variable "zones" {
  description = "The zones to host the cluster in (optional if regional cluster / required if zonal)"
  type        = list(string)
  default     = ["us-central1-a", "us-central1-b", "us-central1-c"]
}

variable "compute_engine_service_account" {
  description = "Service account to associate to the nodes in the cluster"
  type        = string
  default     = null
}

variable "enable_private_cluster" {
  description = "Enable private cluster for the GKE cluster"
  type        = bool
  default     = false
}

variable "master_ipv4_cidr_block" {
  description = "The IP range in CIDR notation to use for the GKE master."
  type        = string
  default     = "172.16.0.0/28"
}

variable "master_authorized_networks" {
  description = "List of master authorized networks. If master authorized networks is defined, the master endpoint is not authorized for any other networks."
  type = list(object({
    cidr_block   = string
    display_name = string
  }))
  default = []
}