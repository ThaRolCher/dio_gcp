# Desafio 10: Orquestração de Containers com Google Kubernetes Engine (GKE)

[![GCP GKE](https://img.shields.io/badge/Google_Cloud-GKE-4285F4?style=for-the-badge&logo=google-cloud&logoColor=white)](https://cloud.google.com/kubernetes-engine)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-Orchestration-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)](https://kubernetes.io/)
[![Microservices](https://img.shields.io/badge/Architecture-Microservices-008080?style=for-the-badge)](https://github.com/GoogleCloudPlatform/microservices-demo)

Este desafio prático documenta a criação de um cluster gerenciado no **Google Kubernetes Engine (GKE)** e a implantação de uma arquitetura de microserviços baseada no projeto oficial **Online Boutique** da Google Cloud Platform, além de demonstrar o deploy de manifestos declarativos customizados.

---

## 🏗️ Arquitetura de Implantação no GKE

O fluxo de entrada e distribuição de tráfego dentro do cluster Kubernetes segue a estrutura abaixo:

```mermaid
graph TD
    User[Usuários / Internet] -->|Acesso HTTP no IP Externo| LB[Kubernetes LoadBalancer Service]
    LB -->|Roteia o tráfego| Pod1[Pod: Frontend - Réplica A]
    LB -->|Roteia o tráfego| Pod2[Pod: Frontend - Réplica B]
    
    subgraph Cluster GKE (Autopilot)
        Pod1 -->|Comunicação Interna| ClusterIP[Outros Microserviços: Email, Cart, Payment, etc.]
        Pod2 -->|Comunicação Interna| ClusterIP
    end
    
    style User fill:#fff,stroke:#333,stroke-width:1px
    style LB fill:#ea4335,stroke:#333,stroke-width:2px,color:#fff
    style Pod1 fill:#34a853,stroke:#333,stroke-width:1px,color:#fff
    style Pod2 fill:#34a853,stroke:#333,stroke-width:1px,color:#fff
    style ClusterIP fill:#4285f4,stroke:#333,stroke-width:1px,color:#fff
```

---

## 📘 Visão Geral do GKE

O **Google Kubernetes Engine (GKE)** é a solução gerenciada de Kubernetes mais madura do mercado. Ele elimina a complexidade de gerenciar a máquina master (Control Plane) e o sistema operacional dos nós de processamento.

### ⚡ GKE Autopilot (Modo Recomendado)
No modo Autopilot, a GCP gerencia e otimiza automaticamente toda a infraestrutura do cluster, incluindo nós, escalonamento, segurança e limites de recursos. Você paga apenas pelos recursos de CPU, memória e armazenamento consumidos pelos Pods em execução, otimizando os custos operacionais.

---

## 🚀 Roteiro de Provisionamento e Deploy

### Passo 1: Habilitar a API do GKE e preparar o ambiente
Abra o **Cloud Shell** e ative as APIs necessárias no seu projeto da GCP:
```bash
gcloud services enable container.googleapis.com
```

### Passo 2: Criar o Cluster GKE no Modo Autopilot
Execute o comando para provisionar um cluster Autopilot na região desejada:
```bash
gcloud container clusters create-auto online-boutique \
    --region=us-central1
```
*Aguarde alguns minutos até que o Google Cloud configure a infraestrutura e os nós iniciais do cluster.*

### Passo 3: Conectar o kubectl ao Cluster Criado
Obtenha as credenciais de autenticação do cluster para que o utilitário `kubectl` consiga gerenciar os recursos:
```bash
gcloud container clusters get-credentials online-boutique \
    --region=us-central1
```

---

## 📦 Implantação da Aplicação

### Cenário A: Deploy da Online Boutique (microservices-demo)
Para implantar a demonstração de microserviços completa da Google, execute o comando apontando diretamente para o manifesto de distribuição oficial do projeto:
```bash
kubectl apply -f https://raw.githubusercontent.com/GoogleCloudPlatform/microservices-demo/main/release/kubernetes-manifests.yaml
```

Verifique o progresso da criação dos recursos com o comando:
```bash
kubectl get pods
```

Para obter a URL pública e acessar a aplicação no navegador, consulte o IP externo do balanceador de carga do frontend:
```bash
kubectl get service frontend-external
```

> [!NOTE]
> *Insira abaixo o print de tela do seu navegador exibindo a página da Online Boutique ativa:*
> 
> ![Online Boutique Ativa](images/03_online_boutique.png)

---

### Cenário B: Deploy do Manifesto Local Customizado (`hello-gke.yaml`)
Se desejar implantar a aplicação de teste contida neste diretório:
1. Certifique-se de estar no diretório do desafio e aplique o manifesto:
   ```bash
   kubectl apply -f hello-gke.yaml
   ```
2. Consulte o IP de acesso público gerado pelo serviço:
   ```bash
   kubectl get service hello-gke-service
   ```

---

## 🔍 Verificação no Console GCP

### Passo 1: Verificar Cluster Ativo
No Console da GCP, vá em **Kubernetes Engine** > **Clusters** para certificar-se de que o cluster `online-boutique` está com status verde (ativo).

> [!NOTE]
> *Insira abaixo o print do console GCP exibindo o Cluster GKE ativo no status verde:*
> 
> ![Cluster GKE Console](images/01_gke_cluster.png)

### Passo 2: Verificar Cargas de Trabalho
No menu lateral do Kubernetes Engine, vá em **Cargas de Trabalho** (*Workloads*) para visualizar todas as réplicas dos Pods em execução.

> [!NOTE]
> *Insira abaixo o print exibindo o resultado do comando `kubectl get pods` no terminal confirmando a execução:*
> 
> ![Status dos Pods no Terminal](images/02_k8s_pods.png)

---

## 📁 Estrutura de Arquivos Deste Desafio

* [README.md](file:///c:/Users/Chericoni/DIO/dio_gcp/10-kubernetes-gke/README.md) -> Guia passo a passo explicativo (Este arquivo).
* [hello-gke.yaml](file:///c:/Users/Chericoni/DIO/dio_gcp/10-kubernetes-gke/hello-gke.yaml) -> Manifesto declarativo de teste de Kubernetes.
* `images/` -> Pasta reservada para as capturas de tela.
