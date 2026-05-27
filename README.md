# Formação Google Cloud Platform (GCP) — Desafios Práticos DIO

Este repositório foi criado para centralizar e documentar a resolução de todos os desafios práticos propostos durante a formação em **Google Cloud Platform (GCP)** na [DIO (Digital Innovation One)](https://www.dio.me/).

Aqui você encontrará a implementação em infraestrutura como código (IaC), modelagens de governança, automações e guias de laboratórios práticos executados diretamente na nuvem da Google.

---

Aluna
Thais Rolfsen Chericoni
GitHub [@ThaRolCher](https://github.com/ThaRolCher)
LinkedIn [Thaís Chericoni](https://www.linkedin.com/in/thais-chericoni-34954930/)

---

## 📂 Portfólio de Desafios GCP

Abaixo está o índice de todos os desafios concluídos neste repositório. Cada pasta possui sua própria documentação detalhada com diagramas, explicações técnicas, códigos e capturas de tela dos resultados.

| # | Desafio | Descrição | Tecnologias Utilizadas | Acesso Direto |
| :--- | :--- | :--- | :--- | :--- |
| **01** | **Organização de Pastas e Projetos (IAM)** | Modelagem e automação de estrutura hierárquica de recursos da GCP, separando ambientes de Produção e Testes, e aplicando permissões via Google Groups. | `Terraform` / `GCP IAM` / `Draw.io` | [Ver Desafio 📁](file:///c:/Users/Chericoni/DIO/dio_gcp/01-organizacao-pastas-iam/README.md) |
| **02** | **Exportação de Billing para o BigQuery** | Configuração do fluxo automático de exportação de dados de faturamento para análise analítica e FinOps através do BigQuery. | `GCP Billing` / `BigQuery` / `SQL` | [Ver Desafio 📁](file:///c:/Users/Chericoni/DIO/dio_gcp/02-exportacao-billing-bigquery/README.md) |
| **03** | **Dashboard Personalizado e Idioma** | Customização do painel de controle da GCP, fixação de atalhos no menu de navegação e ajuste de preferências regionais/idioma. | `GCP Console` / `Preferências` | [Ver Desafio 📁](file:///c:/Users/Chericoni/DIO/dio_gcp/03-dashboard-personalizado-preferencias-idioma/README.md) |
| **04** | **Dominando o GCP Cloud Shell** | Utilização da CLI gcloud no terminal integrado, exploração do Cloud Shell Editor e do recurso de visualização web (Web Preview). | `Cloud Shell` / `gcloud CLI` / `Linux` | [Ver Desafio 📁](file:///c:/Users/Chericoni/DIO/dio_gcp/04-dominando-gcp-cloud-shell/README.md) |
| **05** | **Pipeline CI/CD com Cloud Build & Terraform** | Automação completa de infraestrutura como código (IaC) utilizando pipeline de CI/CD para provisionar VPC e VM na GCP via gatilhos do GitHub. | `Terraform` / `Cloud Build` / `CI/CD` | [Ver Desafio 📁](file:///c:/Users/Chericoni/DIO/dio_gcp/05-pipeline-cicd-cloudbuild-terraform/README.md) |
| **06** | **Infraestrutura de Rede VPC e VMs na GCP** | Planejamento e implantação de rede VPC customizada com subredes regionalizadas, regras de firewall e provisionamento de VM rodando Apache automatizado por Startup Script. | `VPC` / `Compute Engine` / `Apache` | [Ver Desafio 📁](file:///c:/Users/Chericoni/DIO/dio_gcp/06-vpc-vm-gcp/README.md) |
| **07** | **Instance Template, Instance Group e Load Balancer** | Criação de um modelo de instância, grupo de instâncias gerenciado (MIG) com auto-scaling e balanceador de carga (HTTP Load Balancer) clássico para alta disponibilidade. | `Compute Engine` / `Load Balancing` / `Autoscaling` | [Ver Desafio 📁](file:///c:/Users/Chericoni/DIO/dio_gcp/07-templates-groups-loadbalancer/README.md) |
| **08** | **Deploy no App Engine com Auto Scaling** | Implantação de aplicação Node.js no App Engine Standard com classe de instância personalizada F2 e escalonamento automático de recursos. | `App Engine` / `Autoscaling` / `Node.js` | [Ver Desafio 📁](file:///c:/Users/Chericoni/DIO/dio_gcp/08-deploy-appengine-scaling/README.md) |
| **09** | **Deploy de Aplicação em Container no Cloud Run** | Empacotamento de uma API FastAPI (API Mastera) em container Docker, publicação no Artifact Registry e deploy serverless no Cloud Run com auto-scaling. | `Cloud Run` / `Docker` / `FastAPI` | [Ver Desafio 📁](file:///c:/Users/Chericoni/DIO/dio_gcp/09-deploy-container-cloud-run/README.md) |
| **10** | **Cluster Kubernetes no Google Kubernetes Engine (GKE)** | Provisionamento de um cluster Kubernetes gerenciado via GKE Autopilot e implantação da aplicação baseada em microserviços (Online Boutique) e manifestos declarativos customizados. | `GKE` / `Kubernetes` / `kubectl` | [Ver Desafio 📁](file:///c:/Users/Chericoni/DIO/dio_gcp/10-kubernetes-gke/README.md) |

---

## 🛠️ Como navegar por este repositório

1. Cada desafio está contido em sua respectiva subpasta numerada (ex: `01-...`, `02-...`).
2. Acesse a pasta correspondente ao desafio de seu interesse para visualizar o passo a passo de execução e os recursos utilizados.
3. Na pasta do **Desafio 01**, você encontrará os arquivos de configuração do **Terraform** (`main.tf`, `providers.tf`, `variables.tf`) que podem ser aplicados diretamente em sua conta GCP.
4. Na pasta do **Desafio 02**, você encontrará um script de **Consultas SQL** (`queries/billing_analysis.sql`) pronto para executar em seu dataset de faturamento do BigQuery.

---

## 🎓 Certificação GCP

Este treinamento e portfólio fazem parte da preparação técnica focada na computação em nuvem da Google Cloud, abordando governança, infraestrutura, segurança, análise de dados e otimização financeira (FinOps).
