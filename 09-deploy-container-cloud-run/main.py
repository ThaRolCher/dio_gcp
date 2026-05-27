from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import List, Optional

app = FastAPI(
    title="API Mastera - Integrador e Roadmap",
    version="0.1.0",
    openapi_version="3.1.0",
    docs_url="/docs"
)

# Schemas
class ComentarioBase(BaseModel):
    id_projeto: int
    autor: str
    texto: str

class ComentarioResponse(BaseModel):
    id: int
    id_projeto: int
    autor: str
    texto: str
    status: str

class ExportRequest(BaseModel):
    formato: str  # ex: csv, json
    campos: List[str]

# Endpoints
@app.get(
    "/api/projetos/{id_projeto}/dados/{nome_arquivo}",
    summary="Buscar Dados Projeto",
    tags=["default"]
)
def buscar_dados_projeto(id_projeto: int, nome_arquivo: str):
    return {
        "id_projeto": id_projeto,
        "nome_arquivo": nome_arquivo,
        "status": "success",
        "dados": {"mensagem": "Dados do projeto mockados com sucesso."}
    }

@app.get(
    "/api/projetos/{id_projeto}/tecnologias/{tech_id}/dados/{nome_arquivo}",
    summary="Buscar Dados Tecnologia",
    tags=["default"]
)
def buscar_dados_tecnologia(id_projeto: int, tech_id: str, nome_arquivo: str):
    return {
        "id_projeto": id_projeto,
        "tech_id": tech_id,
        "nome_arquivo": nome_arquivo,
        "dados": {"tecnologia": tech_id, "status": "ativo"}
    }

@app.post(
    "/api/projetos/comentarios",
    response_model=ComentarioResponse,
    summary="Adicionar Comentario",
    tags=["default"]
)
def adicionar_comentario(comentario: ComentarioBase):
    return ComentarioResponse(
        id=123,
        id_projeto=comentario.id_projeto,
        autor=comentario.autor,
        texto=comentario.texto,
        status="comentario_adicionado"
    )

@app.post(
    "/api/projetos/exportar",
    summary="Exportar Dados",
    tags=["default"]
)
def exportar_dados(request: ExportRequest):
    return {
        "status": "exportado",
        "formato": request.formato,
        "url_download": f"https://storage.googleapis.com/bucketdio/export_{request.formato}.zip"
    }

@app.post(
    "/api/projetos/{id_projeto}/iniciar_roadmap",
    summary="Iniciar Roadmap",
    tags=["default"]
)
def iniciar_roadmap(id_projeto: int):
    return {
        "id_projeto": id_projeto,
        "status": "roadmap_iniciado",
        "mensagem": f"Roadmap para o projeto {id_projeto} foi iniciado com sucesso."
    }

@app.get(
    "/api/projetos/{id_projeto}/roadmap/dados",
    summary="Ler Roadmap Dados",
    tags=["default"]
)
def ler_roadmap_dados(id_projeto: int):
    return {
        "id_projeto": id_projeto,
        "etapas": [
            {"etapa": 1, "nome": "Configuração GCP", "concluido": True},
            {"etapa": 2, "nome": "App Engine & VM", "concluido": True},
            {"etapa": 3, "nome": "Cloud Run Deploy", "concluido": False}
        ]
    }

@app.get(
    "/api/projetos/{id_projeto}/roadmap/exportar_pdf",
    summary="Exportar Roadmap Pdf",
    tags=["default"]
)
def exportar_roadmap_pdf(id_projeto: int):
    return {
        "id_projeto": id_projeto,
        "status": "gerado",
        "pdf_url": f"https://storage.googleapis.com/bucketdio/roadmap_projeto_{id_projeto}.pdf"
    }

@app.post(
    "/api/projetos/{id_projeto}/finalizar",
    summary="Finalizar Projeto",
    tags=["default"]
)
def finalizar_projeto(id_projeto: int):
    return {
        "id_projeto": id_projeto,
        "status": "finalizado",
        "mensagem": f"Projeto {id_projeto} marcado como concluído."
    }
