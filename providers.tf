terraform {
  required_version = ">= 1.0.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0" # Usa a versão estável mais recente do provider do Google
    }
  }
}

provider "google" {
  #Terraform - credenciais ambiente de execucao
}
