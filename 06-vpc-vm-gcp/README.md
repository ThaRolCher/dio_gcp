# Desafio 06: Documentação de Instância VM no Google Compute Engine

[![GCP Compute Engine](https://img.shields.io/badge/Google_Cloud-Compute_Engine-669DF2?style=for-the-badge&logo=google-cloud&logoColor=white)](https://cloud.google.com/compute)
[![Project](https://img.shields.io/badge/Project-projeto--rag--validacao-34A853?style=for-the-badge)](https://console.cloud.google.com/)
[![Org](https://img.shields.io/badge/Org-mastera.com.br-FABC05?style=for-the-badge)](https://console.cloud.google.com/)

Esta documentação detalha a infraestrutura, as configurações de rede, armazenamento e políticas de segurança da máquina virtual **`instance-20260116-141231`** em execução no projeto **`projeto-rag-validacao`** sob a organização **`mastera.com.br`** na Google Cloud Platform (GCP).

---

## 🏗️ Especificações da Infraestrutura Ativa

Abaixo está o resumo arquitetural e técnico da máquina virtual ativa:

```mermaid
graph TD
    subgraph Projeto GCP: projeto-rag-validacao
        subgraph Rede VPC: default
            subgraph Subrede: default [10.128.0.0/20]
                VM[VM: instance-20260116-141231 <br> Zona: us-central1-c <br> IP Interno: 10.128.0.5]
            end
            
            FW_HTTP[Firewall: HTTP Ativado <br> Tag: http-server <br> Porta: 80] --> VM
            FW_HTTPS[Firewall: HTTPS Ativado <br> Tag: https-server <br> Porta: 443] --> VM
        end
        
        SA[Service Account <br> 497690216990-compute@...] -->|Identidade e Escopos| VM
        Disk[(Boot Disk: 512 GB Balanced)] -->|Armazenamento| VM
        Meta[Metadados: enable-osconfig = TRUE] -->|Gerenciamento| VM
    end
    
    User[Internet / Usuário] -->|Acesso Público: 136.119.234.111| VM

    style VM fill:#669df2,stroke:#333,stroke-width:2px,color:#fff
    style FW_HTTP fill:#34a853,stroke:#333,stroke-width:1px,color:#fff
    style FW_HTTPS fill:#ea4335,stroke:#333,stroke-width:1px,color:#fff
    style Disk fill:#7b42bc,stroke:#333,stroke-width:1px,color:#fff
```

---

## 🛠️ Detalhamento das Configurações do Console

### 1. Painel de Controle e Recursos de Computação (VM Instances)
A instância está alocada na zona **`us-central1-c`** e possui um perfil de alto desempenho para processamento de dados:
* **Tipo de Máquina**: `n2-highmem-8` (8 vCPUs virtuais Intel Broadwell e 64 GB de memória RAM).
* **IP Externo (Efemérico)**: `136.119.234.111`.

> **Visão Geral das Instâncias no Projeto:**
> ![Lista de VMs](images/01_lista_vms.jpg)

---

### 2. Configuração de Rede e Regras de Firewall
A instância está conectada à rede padrão (`default`) e configurada para permitir tráfego da Web (HTTP e HTTPS) por meio de tags de rede associadas às regras de firewall globais do projeto:
* **Tags de Rede Ativas**: `http-server`, `https-server`.
* **Rede/Subrede**: `default` / `default` (região `us-central1`).
* **IP Interno Primário**: `10.128.0.5`.

> **Configurações de Hardware e Firewall da Máquina:**
> ![Configuração da VM e Firewall](images/02_config_maquina.jpg)

---

### 3. Armazenamento (Storage)
A máquina está equipada com um disco de inicialização robusto para persistência de dados e logs:
* **Tamanho do Disco**: `512 GB`.
* **Tipo de Disco**: Disco permanente equilibrado (*Balanced Persistent Disk*).
* **Modo de Acesso**: Leitura/Gravação.
* **Regra de Exclusão**: Excluir disco automaticamente quando a instância for deletada.

> **Configuração de Rede e Armazenamento:**
> ![Armazenamento e Rede](images/03_detalhes_rede.jpg)

---

### 4. Gerenciamento de APIs, Identidade e Acesso (IAM)
A VM utiliza a conta de serviço de computação padrão do projeto para se autenticar e interagir com outras APIs da Google Cloud de forma segura:
* **Conta de Serviço**: `497690216990-compute@developer.gserviceaccount.com`.
* **Escopos de Acesso às APIs do Cloud**: Permite acesso padrão com permissões de gravação no Stackdriver Monitoring e de leitura no Cloud Storage.
* **Metadados Personalizados**: `enable-osconfig = TRUE` (Habilita o gerenciador de patches e políticas do OS Config da GCP).

> **Permissões de APIs e Identidades:**
> ![APIs e Acessos](images/04_apis_identidade.jpg)

> **Políticas de Gerenciamento e Metadados personalizados:**
> ![Metadados e OS Config](images/05_metadados_gerenciamento.jpg)

---

## 🏁 Validação do Servidor Web
Com as regras de firewall ativas para a tag `http-server`, qualquer servidor web instalado na VM (como Apache ou Nginx) pode ser acessado publicamente pelo IP externo:
1. Acesse o endereço IP externo no navegador: `http://136.119.234.111`.
2. O servidor responderá com a página inicial customizada do desafio.

> **Página do Servidor Web Respondendo ao Acesso Externo:**
> ![Servidor Web Ativo](images/06_servidor_web_ativo.jpg)

---

## 📁 Orientações de Como Organizar Seus Prints

Para que as imagens apareçam corretamente no seu GitHub como documentado acima, salve os prints que você tirou do console dentro da pasta **`06-vpc-vm-gcp/images/`** renomeando-os exatamente com os seguintes nomes de arquivos:

1. **`01_lista_vms.jpg`** (O print mostrando a lista de VMs com o IP externo `136.119.234.111`).
2. **`02_config_maquina.jpg`** (O print mostrando as especificações da máquina `n2-highmem-8` e as tags `http-server`).
3. **`03_detalhes_rede.jpg`** (O print mostrando a tabela de interfaces de rede e o disco de `512 GB`).
4. **`04_apis_identidade.jpg`** (O print da seção de "Contas de serviço" e escopos de acesso).
5. **`05_metadados_gerenciamento.jpg`** (O print da seção de administração e a tabela de metadados com `enable-osconfig`).
6. **`06_servidor_web_ativo.jpg`** (Opcional: print da página web carregada no navegador ao acessar o IP `136.119.234.111`).
