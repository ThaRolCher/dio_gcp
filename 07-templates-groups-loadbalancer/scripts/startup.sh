#!/bin/bash
# =========================================================================
# SCRIPT DE INICIALIZAÇÃO SIMPLIFICADO (startup.sh)
# =========================================================================

# Instalar o Apache2
apt-get update -y
apt-get install -y apache2
systemctl start apache2
systemctl enable apache2

# Obter o nome da VM (hostname)
HOSTNAME=$(hostname)

# Criar a página HTML que exibe qual VM está respondendo (para provar o balanceamento)
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>GCP Load Balancer Test - DIO</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            color: #333;
            text-align: center;
            padding-top: 100px;
        }
        .card {
            display: inline-block;
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #4285F4;
        }
        .host {
            font-weight: bold;
            font-size: 1.5em;
            color: #34A853;
            background: #e6f4ea;
            padding: 10px 20px;
            border-radius: 6px;
            margin-top: 20px;
            display: inline-block;
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>Desafio 07: Balanceador de Carga Ativo!</h1>
        <p>Esta requisição foi respondida pela instância do Compute Engine:</p>
        <span class="host">$HOSTNAME</span>
        <p style="margin-top: 30px; font-size: 0.85em; color: #777;">Atualize a página para ver o tráfego alternando entre as instâncias.</p>
    </div>
</body>
</html>
EOF

systemctl restart apache2
