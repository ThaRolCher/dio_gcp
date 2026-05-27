# Desafio 03: Dashboard Personalizado e Preferências de Idioma

[![GCP Console](https://img.shields.io/badge/Google_Cloud-Console-4285F4?style=for-the-badge&logo=google-cloud&logoColor=white)](https://console.cloud.google.com/)
[![Preferences](https://img.shields.io/badge/Console-Settings-gray?style=for-the-badge&logo=settings&logoColor=white)](https://console.cloud.google.com/)

Este desafio prático demonstra como gerenciar e customizar a interface de trabalho no **Google Cloud Platform (GCP) Console**. Aprender a organizar seu painel de controle e ajustar suas preferências de idioma/região melhora drasticamente a produtividade, a acessibilidade e a eficiência na administração de recursos na nuvem.

---

## 🎨 1. Personalização do Dashboard Inicial (Painel da GCP)

O Dashboard do GCP é a primeira tela exibida ao acessar o console. Ele funciona como uma central de monitoramento ágil onde você pode visualizar rapidamente a saúde de seus projetos, o consumo de APIs, custos recentes e atividades suspeitas.

### Como Personalizar seu Dashboard (Passo a Passo)

1. **Acessar o Painel Inicial**:
   - Entre no [GCP Console](https://console.cloud.google.com/).
   - Selecione o projeto desejado na barra superior.
2. **Ativar o Modo de Edição**:
   - No canto superior direito da tela do painel, clique em **Personalizar** (*Customize*).
3. **Adicionar/Remover Cartões (Cards)**:
   - Uma barra lateral ou caixas de seleção serão exibidas. Você pode selecionar os cartões que deseja ver, como:
     - **Gráficos de APIs** (para monitorar requisições).
     - **Faturamento** (*Billing*) (para ver gastos acumulados).
     - **Status do Google Cloud** (saúde global dos serviços GCP).
     - **Atividade** (logs recentes de quem criou/destruiu recursos).
     - **Compute Engine** (resumo de máquinas virtuais ativas).
4. **Organizar por Arrastar-e-Soltar (Drag and Drop)**:
   - Clique na barra de título de qualquer cartão e arraste-o para reorganizar o layout de acordo com sua prioridade.
5. **Salvar Layout**:
   - Clique em **Concluído** (*Done*) no canto superior direito para fixar o layout personalizado.

> [!NOTE]
> ![Dashboard Personalizado](images/Dashboard%20sendo%20personalizado.jpg)

---

## 📌 2. Fixando Serviços Favoritos (Navigation Pinning)

Com centenas de serviços disponíveis na GCP, navegar pelo menu lateral pode ser demorado. Fixar (Pin) seus serviços favoritos no topo do menu de navegação é a melhor prática para otimizar o fluxo de trabalho.

### Como Fixar Recursos no Menu Lateral

1. Clique no menu de navegação de três linhas (**Menu Hambúrguer**) no canto superior esquerdo.
2. Passe o mouse sobre qualquer serviço que você usa frequentemente (ex: **IAM e Administrador**, **Compute Engine**, **BigQuery**, **Cloud Storage**).
3. Um ícone de **Alfinete** (*Pin*) aparecerá ao lado do nome do serviço.
4. Clique no alfinete para fixar o serviço no topo da barra lateral (seção **Fixados** ou *Pinned*).
5. Para remover, basta clicar no alfinete novamente.

> [!NOTE]
> ![Menu Lateral com Favoritos Fixados](images/Recurso%20fixado%20do%20menu%20lateral.jpg)

---

## 🌐 3. Configurando Preferências de Idioma e Região

Trabalhar com a GCP no idioma e formato regionais corretos evita erros de leitura de dados, além de facilitar a consulta a documentações oficiais.

### Impactos de Idioma e Região no Console
- **Tradicional vs Traduzido**: Alguns administradores preferem o console em *Inglês* para facilitar a correlação com tutoriais globais e exames de certificação. Outros preferem em *Português* para melhor legibilidade no dia a dia.
- **Formatação de Dados**: A escolha da região altera a exibição de formatos de datas (DD/MM/AAAA vs MM/DD/AAAA) e separadores decimais de valores monetários.

### Como Alterar a Preferência de Idioma (Passo a Passo)

1. No canto superior direito do Console GCP, clique no ícone de **Mais Opções** (três pontos verticais) ou no ícone de **Configurações (Engrenagem)**.
2. No menu suspenso, selecione **Preferências** (*Preferences*).
3. No painel de preferências, selecione a aba **Idioma e Região** (*Language & Region*).
4. Altere as opções:
   - **Idioma** (*Language*): Selecione **Português (Brasil)** ou **English (United States)** conforme sua preferência.
   - **Região** (*Region*): Selecione a região correspondente para ajustar os formatos de exibição (ex: Brasil).
5. Clique em **Salvar** (*Save*) para atualizar o console. A página será recarregada automaticamente com o novo idioma aplicado.

> [!NOTE]
> ![Configuração de Idioma e Região](images/Prefer%C3%AAncia%20de%20idioma.jpg)

---

## 📁 Estrutura de Arquivos Deste Desafio

- [README.md](file:///c:/Users/Chericoni/DIO/dio_gcp/03-dashboard-personalizado-preferencias-idioma/README.md) -> Guia explicativo e didático do desafio (Este arquivo).
- `images/` -> Pasta onde você deve colocar os prints das suas configurações de console e de idioma.
