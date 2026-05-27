# Usar imagem base oficial do Python slim
FROM python:3.9-slim

# Definir o diretório de trabalho dentro do container
WORKDIR /app

# Copiar os requerimentos e instalar dependências
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar todo o código fonte do projeto
COPY . .

# Expor a porta que o Cloud Run escuta por padrão (8080)
EXPOSE 8080

# Comando para iniciar o servidor do FastAPI usando Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
