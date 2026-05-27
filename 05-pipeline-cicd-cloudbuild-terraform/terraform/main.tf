# =========================================================================
# CONFIGURAÇÃO PRINCIPAL DO TERRAFORM (main.tf)
# =========================================================================

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }

  # Configuração de Backend Remoto para armazenar o State do Terraform no GCS.
  backend "gcs" {
    bucket = "bucketdio"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = "notebook-mastera"
  region  = var.region
  zone    = var.zone
}

# 1. Criação da Rede VPC
resource "google_compute_network" "vpc_network" {
  name                    = var.network_name
  auto_create_subnetworks = true
}

# 2. Criação da VM Compute Engine
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro" # Tipo econômico (Free Tier elegível se atendidas as condições)
  tags         = ["web", "production"]

  labels = {
    centro_custo = var.centro_custo
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
      # Isso gera um IP público temporário para a máquina
    }
  }
}
