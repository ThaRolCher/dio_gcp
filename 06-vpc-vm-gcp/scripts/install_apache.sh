#!/bin/bash
# =========================================================================
# SCRIPT DE INICIALIZAÇÃO (STARTUP SCRIPT) PARA INSTALAÇÃO DO APACHE
# =========================================================================

# Atualizar repositórios e instalar o Apache2
apt-get update -y
apt-get install -y apache2

# Iniciar e habilitar o serviço para rodar na inicialização da VM
systemctl start apache2
systemctl enable apache2

# Obter metadados da máquina para deixar a página dinâmica
VM_NAME=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/name)
VM_ZONE=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/zone | awk -F/ '{print $NF}')
VM_IP=$(hostname -I | awk '{print $1}')

# Criar uma página HTML customizada e estilizada (Aesthetics Premium)
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GCP VPC & VM Challenge - DIO</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(255, 255, 255, 0.2);
            text-align: center;
            max-width: 600px;
        }
        h1 {
            margin-top: 0;
            font-size: 2.5em;
            background: linear-gradient(90deg, #4285F4, #34A853, #FBBC05, #EA4335);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        p {
            font-size: 1.1em;
            line-height: 1.6;
        }
        .badge {
            display: inline-block;
            background-color: #34a853;
            color: white;
            padding: 6px 12px;
            border-radius: 20px;
            font-weight: bold;
            font-size: 0.9em;
            margin-bottom: 20px;
        }
        .info-table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }
        .info-table td {
            padding: 10px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            text-align: left;
        }
        .info-table td.label {
            font-weight: bold;
            color: #fbbc05;
        }
        .footer {
            margin-top: 30px;
            font-size: 0.85em;
            color: rgba(255, 255, 255, 0.6);
        }
    </style>
</head>
<body>
    <div class="container">
        <span class="badge">Desafio 06 Concluído com Sucesso</span>
        <h1>Google Cloud Platform</h1>
        <h2>Infraestrutura de Rede e Computação</h2>
        <p>Este servidor Apache2 foi implantado de forma automatizada por um <strong>Startup Script</strong> em uma rede VPC customizada na GCP.</p>
        
        <table class="info-table">
            <tr>
                <td class="label">Aluna:</td>
                <td>Thais Rolfsen Chericoni</td>
            </tr>
            <tr>
                <td class="label">Instância de VM:</td>
                <td>$VM_NAME</td>
            </tr>
            <tr>
                <td class="label">Zona do GCP:</td>
                <td>$VM_ZONE</td>
            </tr>
            <tr>
                <td class="label">Endereço IP Interno:</td>
                <td>$VM_IP</td>
            </tr>
        </table>

        <div class="footer">
            Formação Cloud Foundations — DIO Treinamentos
        </div>
    </div>
</body>
</html>
EOF

# Reiniciar o Apache para garantir a aplicação da nova página
systemctl restart apache2
