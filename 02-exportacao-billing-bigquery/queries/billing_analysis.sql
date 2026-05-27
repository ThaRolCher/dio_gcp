-- =========================================================================
-- CONSULTAS SQL PARA ANÁLISE DE FATURAMENTO DA GCP NO BIGQUERY
-- =========================================================================
-- Substitua `SEU_PROJETO.SEU_DATASET.gcp_billing_export_v1_XXXXXX` pela tabela
-- correspondente gerada pela exportação do Billing no seu BigQuery.
-- =========================================================================

-- 1. Custo Mensal Total (Sem Créditos/Descontos) vs Custo Líquido (Com Créditos)
-- Esta consulta ajuda a entender o valor bruto consumido comparado ao valor real cobrado.
SELECT
  invoice.month AS mes_faturamento,
  ROUND(SUM(cost), 2) AS custo_bruto,
  ROUND(SUM(cost + (SELECT SUM(c.amount) FROM UNNEST(credits) c)), 2) AS custo_liquido,
  ROUND(SUM(SELECT SUM(c.amount) FROM UNNEST(credits) c), 2) AS total_creditos,
  currency AS moeda
FROM
  `SEU_PROJETO.SEU_DATASET.gcp_billing_export_v1_XXXXXX`
GROUP BY
  mes_faturamento,
  moeda
ORDER BY
  mes_faturamento DESC;


-- 2. Custos Agrupados por Serviço GCP
-- Identifica os serviços que mais consomem orçamento (ex: Compute Engine, BigQuery, Cloud Storage).
SELECT
  service.description AS servico,
  ROUND(SUM(cost), 2) AS custo_bruto,
  ROUND(SUM(cost + (SELECT SUM(c.amount) FROM UNNEST(credits) c)), 2) AS custo_liquido,
  currency AS moeda
FROM
  `SEU_PROJETO.SEU_DATASET.gcp_billing_export_v1_XXXXXX`
GROUP BY
  servico,
  moeda
ORDER BY
  custo_liquido DESC;


-- 3. Custos Agrupados por Projeto GCP
-- Mostra quais projetos dentro da sua organização estão gerando mais despesas.
SELECT
  project.id AS projeto_id,
  project.name AS projeto_nome,
  ROUND(SUM(cost), 2) AS custo_bruto,
  ROUND(SUM(cost + (SELECT SUM(c.amount) FROM UNNEST(credits) c)), 2) AS custo_liquido,
  currency AS moeda
FROM
  `SEU_PROJETO.SEU_DATASET.gcp_billing_export_v1_XXXXXX`
GROUP BY
  projeto_id,
  projeto_nome,
  moeda
ORDER BY
  custo_liquido DESC;


-- 4. Top 10 Recursos / SKUs Mais Caros
-- Detalha os SKUs específicos (ex: instâncias de VM, tráfego de rede, armazenamento) que mais custam.
SELECT
  service.description AS servico,
  sku.description AS sku_descricao,
  ROUND(SUM(cost), 2) AS custo_bruto,
  ROUND(SUM(cost + (SELECT SUM(c.amount) FROM UNNEST(credits) c)), 2) AS custo_liquido,
  currency AS moeda
FROM
  `SEU_PROJETO.SEU_DATASET.gcp_billing_export_v1_XXXXXX`
GROUP BY
  servico,
  sku_descricao,
  moeda
ORDER BY
  custo_liquido DESC
LIMIT 10;


-- 5. Análise de Créditos e Descontos Aplicados
-- Mostra o detalhamento de cada tipo de crédito recebido (como descontos por uso contínuo, cupons de teste, etc).
SELECT
  c.name AS tipo_credito,
  ROUND(SUM(c.amount), 2) AS total_desconto,
  currency AS moeda
FROM
  `SEU_PROJETO.SEU_DATASET.gcp_billing_export_v1_XXXXXX`,
  UNNEST(credits) c
GROUP BY
  tipo_credito,
  moeda
ORDER BY
  total_desconto ASC; -- Valores de créditos costumam ser negativos


-- 6. Custos por Label/Etiqueta (Exemplo: Centro de Custo, Ambiente, Owner)
-- Ideal para quando você utiliza labels (etiquetas) para governança e controle de recursos.
-- Substitua 'environment' pela chave da label que você deseja analisar.
SELECT
  labels.value AS ambiente,
  ROUND(SUM(cost), 2) AS custo_bruto,
  ROUND(SUM(cost + (SELECT SUM(c.amount) FROM UNNEST(credits) c)), 2) AS custo_liquido
FROM
  `SEU_PROJETO.SEU_DATASET.gcp_billing_export_v1_XXXXXX`
LEFT JOIN
  UNNEST(labels) labels ON labels.key = 'environment'
GROUP BY
  ambiente
ORDER BY
  custo_liquido DESC;
