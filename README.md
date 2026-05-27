# Formação Google Cloud Platform (GCP) — Desafios Práticos DIO

Este repositório foi criado para centralizar e documentar a resolução de todos os desafios práticos propostos durante a formação em **Google Cloud Platform (GCP)** na [DIO (Digital Innovation One)](https://www.dio.me/).

Aqui você encontrará a implementação em infraestrutura como código (IaC), modelagens de governança, automações e guias de laboratórios práticos executados diretamente na nuvem da Google.

---

Aluna
Thais Rolfsen Chericoni
GitHub [@ThaRolCher](https://github.com/ThaRolCher)
LinkedIn Thaís Chericoni](https://www.linkedin.com/in/thais-chericoni-34954930/)

---

## 📂 Portfólio de Desafios GCP

Abaixo está o índice de todos os desafios concluídos neste repositório. Cada pasta possui sua própria documentação detalhada com diagramas, explicações técnicas, códigos e capturas de tela dos resultados.

| # | Desafio | Descrição | Tecnologias Utilizadas | Acesso Direto |
| :--- | :--- | :--- | :--- | :--- |
| **01** | **Organização de Pastas e Projetos (IAM)** | Modelagem e automação de estrutura hierárquica de recursos da GCP, separando ambientes de Produção e Testes, e aplicando permissões via Google Groups. | `Terraform` / `GCP IAM` / `Draw.io` | [Ver Desafio 📁](file:///c:/Users/Chericoni/DIO/dio_gcp/01-organizacao-pastas-iam/README.md) |
| **02** | **Exportação de Billing para o BigQuery** | Configuração do fluxo automático de exportação de dados de faturamento para análise analítica e FinOps através do BigQuery. | `GCP Billing` / `BigQuery` / `SQL` | [Ver Desafio 📁](file:///c:/Users/Chericoni/DIO/dio_gcp/02-exportacao-billing-bigquery/README.md) |

---

## 🛠️ Como navegar por este repositório

1. Cada desafio está contido em sua respectiva subpasta numerada (ex: `01-...`, `02-...`).
2. Acesse a pasta correspondente ao desafio de seu interesse para visualizar o passo a passo de execução e os recursos utilizados.
3. Na pasta do **Desafio 01**, você encontrará os arquivos de configuração do **Terraform** (`main.tf`, `providers.tf`, `variables.tf`) que podem ser aplicados diretamente em sua conta GCP.
4. Na pasta do **Desafio 02**, você encontrará um script de **Consultas SQL** (`queries/billing_analysis.sql`) pronto para executar em seu dataset de faturamento do BigQuery.

---

## 🎓 Certificação GCP

Este treinamento e portfólio fazem parte da preparação técnica focada na computação em nuvem da Google Cloud, abordando governança, infraestrutura, segurança, análise de dados e otimização financeira (FinOps).
