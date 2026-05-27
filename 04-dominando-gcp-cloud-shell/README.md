# Desafio 04: Dominando o GCP Cloud Shell

[![GCP Cloud Shell](https://img.shields.io/badge/Google_Cloud-Cloud_Shell-4285F4?style=for-the-badge&logo=google-cloud&logoColor=white)](https://cloud.google.com/shell)
[![gcloud CLI](https://img.shields.io/badge/gcloud-CLI-34A853?style=for-the-badge&logo=google-cloud&logoColor=white)](https://cloud.google.com/sdk/gcloud)

Este desafio prático aborda as capacidades e o uso do **Google Cloud Shell**, uma ferramenta indispensável para administradores e desenvolvedores na nuvem da Google. O Cloud Shell fornece acesso direto via linha de comando a recursos na nuvem sem a necessidade de instalar ferramentas localmente em sua máquina.

---

## 💡 O que é o GCP Cloud Shell?

O **Cloud Shell** é uma máquina virtual temporária (baseada em Debian Linux) provisionada sob demanda para você. 

### Principais Características:
* 🛠️ **Ferramental Completo Pré-instalado**: Já vem com ferramentas como `gcloud CLI`, `kubectl`, `terraform`, `git`, `docker`, `helm`, `python`, `pip`, `npm`, e compiladores de várias linguagens prontos para uso.
* 💾 **Armazenamento Persistente**: Você tem direito a **5 GB de armazenamento em disco persistente** mapeado na sua pasta pessoal (`$HOME` ou `~/`). Seus arquivos salvos ali não são apagados quando a sessão é encerrada.
* ⚡ **Ambiente Efêmero**: O restante do sistema operacional (fora da pasta `$HOME`) é redefinido toda vez que a máquina virtual é encerrada por inatividade (cerca de 20 a 30 minutos ocioso).
* 🔒 **Autenticação Automática**: Ele já inicializa autenticado com a mesma conta que você usou para fazer login no console web da GCP, herdando suas permissões IAM automaticamente.

---

## 🚀 Passo a Passo Prático no Cloud Shell

### Passo 1: Como Abrir o Cloud Shell
1. Acesse o [Console da GCP](https://console.cloud.google.com/).
2. No menu superior direito (ao lado da barra de pesquisa), clique no ícone **Ativar o Cloud Shell** (`>_`).
3. Uma seção de terminal abrirá na parte inferior da sua tela. Aguarde o provisionamento da máquina virtual.

> [!NOTE]
> *Insira abaixo o print de tela do seu Cloud Shell sendo aberto e inicializado no console:*
> 
> ![Abrir Cloud Shell](images/cloudshell%201.jpg)

---

### Passo 2: Executando Comandos gcloud Básicos (Gere seu Portfólio)
Abra o terminal do Cloud Shell e execute os comandos abaixo de forma didática para aprender a controlar seus projetos e contas:

```bash
# 1. Listar as contas ativas autorizadas (garante que você está logado na conta certa)
gcloud auth list

# 2. Listar a configuração atual do gcloud (mostra a conta ativa e o projeto atual)
gcloud config list

# 3. Listar todos os projetos GCP aos quais sua conta tem acesso
gcloud projects list

# 4. Definir o seu projeto ativo padrão
# (Substitua 'ID-DO-SEU-PROJETO' pelo ID real que apareceu no comando anterior)
gcloud config set project ID-DO-SEU-PROJETO

# 5. Listar as zonas de computação disponíveis na região de São Paulo (ou outra de sua escolha)
gcloud compute zones list --filter="region:southamerica-east1"

# 6. Definir a zona padrão para criação de recursos de computação (VMs)
gcloud config set compute/zone southamerica-east1-a
```

> [!NOTE]
> ![Comandos do gcloud](images/cloudshell%202.jpg)

---

### Passo 3: Explorando o Editor do Cloud Shell (Cloud Shell Editor)
Para escrever códigos ou editar arquivos de texto complexos, o Cloud Shell possui um editor visual embutido baseado no VS Code.

1. Na barra superior do terminal do Cloud Shell, clique no botão **Abrir Editor** (*Open Editor*).
2. O console se dividirá, mostrando uma interface de desenvolvimento completa no navegador, com árvore de arquivos à esquerda e abas de arquivos à direita.
3. Para voltar ao terminal clássico, clique em **Abrir Terminal** (*Open Terminal*).

---

### Passo 4: Rodando uma Prévia Web (Web Preview)
O Cloud Shell permite hospedar servidores web de teste na porta `8080` (e outras portas suportadas) e testar a exibição diretamente pelo navegador.

1. No terminal do Cloud Shell, execute o comando abaixo para iniciar um servidor HTTP Python temporário servindo sua pasta pessoal na porta `8080`:
   ```bash
   python3 -m http.server 8080
   ```
2. Na barra de ferramentas do Cloud Shell (canto superior direito do terminal), clique no ícone **Visualização na Web** (*Web Preview*).
3. Selecione **Visualizar na porta 8080** (*Preview on port 8080*).
4. Uma nova aba do seu navegador abrirá mostrando a listagem de arquivos da sua pasta no Cloud Shell!
5. Para encerrar o servidor no terminal, digite `Ctrl + C`.

> [!NOTE]
> **Terminal do Cloud Shell (Servidor Python ativo):**
> ![Servidor Python 1](images/cloudshell%203%20servidor%20python%201.jpg)
> 
> **Prévia Web renderizada no navegador (Web Preview):**
> ![Servidor Python 2](images/cloudshell%203%20servidor%20python%202.jpg)

---

## 📁 Estrutura de Arquivos Deste Desafio

- [README.md](file:///c:/Users/Chericoni/DIO/dio_gcp/04-dominando-gcp-cloud-shell/README.md) -> Guia explicativo e didático do desafio (Este arquivo).
- `images/` -> Pasta onde você deve colocar os prints do terminal e da execução de comandos.
