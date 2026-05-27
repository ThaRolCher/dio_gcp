# Desafio 06: Infraestrutura de Rede VPC e Máquinas Virtuais (VM) na GCP

[![GCP VPC](https://img.shields.io/badge/Google_Cloud-VPC_Network-4285F4?style=for-the-badge&logo=google-cloud&logoColor=white)](https://cloud.google.com/vpc)
[![Compute Engine](https://img.shields.io/badge/Compute_Engine-VM_Instance-669DF2?style=for-the-badge&logo=google-cloud&logoColor=white)](https://cloud.google.com/compute)
[![Apache Web Server](https://img.shields.io/badge/Apache2-Web_Server-D22128?style=for-the-badge&logo=apache&logoColor=white)](https://httpd.apache.org/)

Este desafio prático demonstra como planejar, configurar e implantar uma infraestrutura de rede isolada na GCP utilizando **VPC (Virtual Private Cloud)** customizada e provisionar **Instâncias de Máquinas Virtuais (Compute Engine)** rodando servidores web automáticos através de **Startup Scripts**.

---

## 🏗️ Arquitetura da Rede e da VM

O laboratório de rede foi estruturado com base na seguinte arquitetura:

```mermaid
graph TD
    subgraph VPC Customizada: vpc-custom-dio
        subgraph Subrede SP: subnet-sa [10.0.1.0/24]
            VM[VM: vm-web-sa <br> Tags: http-server <br> IP: 10.0.1.2]
        end
        subgraph Subrede EUA: subnet-us [10.0.2.0/24]
            direction LR
            Empty[Espaço Reservado para Expansão]
        end
        FW_SSH[Firewall: allow-ssh <br> Port 22 - Ingress] -->|Aplica a todas| VM
        FW_HTTP[Firewall: allow-http <br> Port 80 - Ingress] -->|Aplica via Tag: http-server| VM
    end
    Internet[Usuário / Internet] -->|Acesso HTTP na Porta 80| VM

    style VM fill:#669df2,stroke:#333,stroke-width:2px,color:#fff
    style FW_SSH fill:#fbbc05,stroke:#333,stroke-width:1px,color:#333
    style FW_HTTP fill:#ea4335,stroke:#333,stroke-width:1px,color:#fff
    style subnet-sa fill:rgba(66, 133, 244, 0.1),stroke:#4285f4,stroke-width:1px
    style subnet-us fill:rgba(52, 168, 83, 0.1),stroke:#34a853,stroke-width:1px
```

---

## 🌐 Conceitos Chave

1. **Virtual Private Cloud (VPC)**: Rede virtual global privada e isolada logicamente dentro do GCP.
   - **VPC Custom**: Permite definir manualmente as subredes, regiões e faixas de IP (CIDR). É a melhor prática de segurança corporativa.
2. **Firewall Rules**: Regras de segurança de rede *stateful* que permitem ou negam tráfego de entrada (ingress) ou saída (egress) baseado em tags de rede, faixas de IP ou portas de protocolos.
3. **Compute Engine (VM)**: Serviço de infraestrutura como serviço (IaaS) para hospedar máquinas virtuais com total controle sobre o sistema operacional e discos de boot.
4. **Startup Scripts**: Script shell executado automaticamente com privilégios de `root` no primeiro boot da VM. Útil para automatizar a instalação de pacotes e inicialização de serviços.

---

## 🚀 Passo a Passo da Configuração no Console GCP

### Passo 1: Criar a Rede VPC Customizada
1. No menu lateral do console GCP, acesse **Rede VPC** > **Redes VPC** (*VPC networks*).
2. Clique em **Criar rede VPC** (*Create VPC network*).
3. Configure os seguintes parâmetros:
   - **Nome**: `vpc-custom-dio`
   - **Modo de criação de sub-rede**: **Personalizado** (*Custom*)
   - **Subredes a adicionar**:
     * **Subrede 1**: Nome: `subnet-sa`, Região: `southamerica-east1` (São Paulo), Faixa de IP: `10.0.1.0/24`.
     * **Subrede 2**: Nome: `subnet-us`, Região: `us-central1` (Iowa), Faixa de IP: `10.0.2.0/24`.
4. Clique em **Criar** e aguarde a VPC e as duas subredes ficarem ativas.

> [!NOTE]
> *Insira abaixo o print de tela mostrando as subredes configuradas na sua VPC:*
> 
> ![VPC Configurada](images/01_vpc_configurada.png)

---

### Passo 2: Configurar as Regras de Firewall
Para permitir conexões HTTP (porta 80) e SSH (porta 22) na rede, precisamos criar duas regras de entrada:

1. Acesse **Rede VPC** > **Firewall**.
2. Clique em **Criar Regra de Firewall**:
   - **Regra 1: Permitir HTTP público via Tag**
     * **Nome**: `allow-http`
     * **Rede**: `vpc-custom-dio`
     * **Destinos**: **Tags de destino especificadas** (*Specified target tags*)
     * **Tags de destino**: `http-server`
     * **Filtros de origem**: Intervalos de IP (*IP ranges*) -> `0.0.0.0/0` (Qualquer IP da internet)
     * **Protocolos e portas**: Selecione **Protocolos e portas especificados** > Marque **TCP** e digite `80`.
   - **Regra 2: Permitir SSH geral para Administração**
     * **Nome**: `allow-ssh`
     * **Rede**: `vpc-custom-dio`
     * **Destinos**: **Todas as instâncias na rede** (*All instances in the network*)
     * **Filtros de origem**: Intervalos de IP (*IP ranges*) -> `0.0.0.0/0` (ou `35.235.240.0/20` se usar o Identity-Aware Proxy - IAP)
     * **Protocolos e portas**: Selecione **TCP** e digite `22`.
3. Clique em **Criar**.

> [!NOTE]
> *Insira abaixo o print mostrando as regras de firewall criadas associadas à vpc-custom-dio:*
> 
> ![Regras de Firewall](images/02_regras_firewall.png)

---

### Passo 3: Provisionar a Máquina Virtual (Compute Engine) com o Startup Script
1. Acesse **Compute Engine** > **Instâncias de VM** (*VM instances*).
2. Clique em **Criar Instância** (*Create instance*).
3. Preencha as configurações:
   - **Nome**: `vm-web-sa`
   - **Região**: `southamerica-east1` (São Paulo)
   - **Zona**: `southamerica-east1-a`
   - **Tipo de máquina**: General Purpose > E2 > `e2-micro` (ou f1-micro, mais econômica)
   - **Disco de inicialização**: Debian GNU/Linux 11 (Bullseye)
   - **Firewall**: Marque a caixa **Permitir tráfego HTTP** (isso adicionará automaticamente a tag de rede `http-server` necessária).
4. Abra a aba **Opções Avançadas** (*Advanced options*):
   - **Rede** (*Networking*):
     * **Interfaces de rede**: Selecione a rede `vpc-custom-dio` e a subrede `subnet-sa`.
   - **Gerenciamento** (*Management*):
     * **Metadados** > **Script de Inicialização** (*Startup script*): Copie e cole todo o conteúdo do script [install_apache.sh](file:///c:/Users/Chericoni/DIO/dio_gcp/06-vpc-vm-gcp/scripts/install_apache.sh).
5. Clique em **Criar**.

> [!NOTE]
> *Insira abaixo o print mostrando sua VM ativa e com o IP externo visível no console:*
> 
> ![Instância de VM Ativa](images/03_instancia_vm.png)

---

### Passo 4: Validar a Conectividade e Servidor Web
1. Aguarde a VM inicializar e rodar o script (cerca de 1 a 2 minutos no primeiro boot).
2. Copie o **IP externo** público gerado para a sua VM.
3. Cole o IP na barra de endereços do seu navegador (exemplo: `http://34.95.130.12`).
4. Você deverá ver a landing page personalizada estilizada com o nome da aluna **Thais Rolfsen Chericoni**, confirmando o sucesso de todo o laboratório!

> [!NOTE]
> *Insira abaixo o print de tela do seu navegador exibindo a landing page personalizada hospedada na VM:*
> 
> ![Página Web do Apache](images/04_pagina_apache.png)

---

## 🛠️ Implantação Automatizada via CLI (Cloud Shell)

Como alternativa rápida e profissional, você pode rodar os seguintes comandos diretamente no seu Cloud Shell para criar toda a estrutura deste laboratório de forma declarativa via CLI:

```bash
# 1. Criar a rede VPC customizada
gcloud compute networks create vpc-custom-dio --subnet-mode=custom

# 2. Criar a subrede em São Paulo
gcloud compute networks subnets create subnet-sa \
    --network=vpc-custom-dio \
    --region=southamerica-east1 \
    --range=10.0.1.0/24

# 3. Criar a subrede nos EUA ( Iowa )
gcloud compute networks subnets create subnet-us \
    --network=vpc-custom-dio \
    --region=us-central1 \
    --range=10.0.2.0/24

# 4. Criar a regra de firewall para HTTP (porta 80) baseada em tags
gcloud compute firewall-rules create allow-http \
    --network=vpc-custom-dio \
    --allow=tcp:80 \
    --target-tags=http-server \
    --source-ranges=0.0.0.0/0

# 5. Criar a regra de firewall para SSH (porta 22)
gcloud compute firewall-rules create allow-ssh \
    --network=vpc-custom-dio \
    --allow=tcp:22 \
    --source-ranges=0.0.0.0/0

# 6. Criar a VM do Compute Engine com o startup-script do repositório
gcloud compute instances create vm-web-sa \
    --zone=southamerica-east1-a \
    --subnet=subnet-sa \
    --machine-type=e2-micro \
    --image-family=debian-11 \
    --image-project=debian-cloud \
    --tags=http-server \
    --metadata-from-file=startup-script=c/Users/Chericoni/DIO/dio_gcp/06-vpc-vm-gcp/scripts/install_apache.sh
```

---

## 📁 Estrutura de Arquivos Deste Desafio

- [README.md](file:///c:/Users/Chericoni/DIO/dio_gcp/06-vpc-vm-gcp/README.md) -> Guia explicativo e prático (Este arquivo).
- [scripts/install_apache.sh](file:///c:/Users/Chericoni/DIO/dio_gcp/06-vpc-vm-gcp/scripts/install_apache.sh) -> Script de provisionamento automático do servidor web.
- `images/` -> Pasta reservada para os prints das suas telas.
