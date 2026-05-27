const http = require('http');
const port = process.env.PORT || 8080;

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
  res.end(`
    <!DOCTYPE html>
    <html lang="pt-br">
    <head>
      <meta charset="UTF-8">
      <title>GCP App Engine Challenge - DIO</title>
      <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f3f4f6; color: #1f2937; text-align: center; padding-top: 80px; }
        .card { display: inline-block; background: white; padding: 40px; border-radius: 12px; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06); border-top: 5px solid #4285F4; }
        h1 { color: #4285F4; font-size: 2.2em; margin-bottom: 10px; }
        .badge { display: inline-block; background-color: #fef3c7; color: #d97706; padding: 6px 12px; font-weight: bold; border-radius: 9999px; margin-top: 15px; font-size: 0.9em; margin-right: 5px; }
        .badge-blue { background-color: #dbeafe; color: #1e40af; }
        p { font-size: 1.1em; color: #4b5563; }
      </style>
    </head>
    <body>
      <div class="card">
        <h1>App Engine Ativo com Sucesso! 🚀</h1>
        <p>Esta aplicação está rodando no Google App Engine Standard.</p>
        <span class="badge badge-blue">Classe: F2 (Personalizada)</span>
        <span class="badge">Auto Scaling: Ativado</span>
      </div>
    </body>
    </html>
  `);
});

server.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
