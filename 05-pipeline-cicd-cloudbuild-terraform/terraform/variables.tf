# =========================================================================
# VARIÁVEIS DO TERRAFORM (variables.tf)
# =========================================================================

variable "network_name" {
  description = "Nome da rede VPC a ser criada"
  type        = string
  default     = "terraform-network"
}

variable "region" {
  description = "Região padrão da GCP para alocação de recursos"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Zona padrão dentro da região para provisionamento da VM"
  type        = string
  default     = "us-central1-c"
}

variable "centro_custo" {
  description = "Identificador de Centro de Custo para fins de governança/faturamento"
  type        = string
  default     = "rh"
}
