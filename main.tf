# 1: PASTAS PRINCIPAIS (DEPARTAMENTOS)

resource "google_folder" "rh" {
  display_name = "RH"
  parent       = "organizations/${var.organization_id}"
}

resource "google_folder" "financeiro" {
  display_name = "Financeiro"
  parent       = "organizations/${var.organization_id}"
}

resource "google_folder" "comercial" {
  display_name = "Comercial"
  parent       = "organizations/${var.organization_id}"
}

resource "google_folder" "marketing" {
  display_name = "Marketing"
  parent       = "organizations/${var.organization_id}"
}

resource "google_folder" "operacao" {
  display_name = "Operação"
  parent       = "organizations/${var.organization_id}"
}


# 2: RAMIFICAÇÕES E SUBPASTAS

# Subpasta ERP - SAP dentro de Comercial
resource "google_folder" "erp_sap" {
  display_name = "ERP - SAP"
  parent       = google_folder.comercial.name # Vincula dinamicamente à pasta Comercial
}

# Subpastas dentro de Operação
resource "google_folder" "cloud" {
  display_name = "Cloud"
  parent       = google_folder.operacao.name
}

resource "google_folder" "suporte_usuario" {
  display_name = "Suporte ao usuário"
  parent       = google_folder.operacao.name
}

resource "google_folder" "conteudo" {
  display_name = "Conteúdo"
  parent       = google_folder.operacao.name
}


# 3: PROJETOS FINAIS (AMBIENTES)

# Projetos do ERP - SAP
resource "google_project" "sap_producao" {
  name       = "SAP Produção"
  project_id = "dio-sap-prod-9988" # IDs globais e únicos
  folder_id  = google_folder.erp_sap.name
}

resource "google_project" "sap_teste" {
  name       = "SAP Teste"
  project_id = "dio-sap-teste-9988"
  folder_id  = google_folder.erp_sap.name
}

# Projetos do Departamento de Conteúdo
resource "google_project" "conteudo_desenvolvimento" {
  name       = "Conteúdo Desenvolvimento"
  project_id = "dio-conteudo-dev-9988"
  folder_id  = google_folder.conteudo.name
}

resource "google_project" "conteudo_producao" {
  name       = "Conteúdo Produção"
  project_id = "dio-conteudo-prod-9988"
  folder_id  = google_folder.conteudo.name
}
