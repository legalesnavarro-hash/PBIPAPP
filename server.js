require('dotenv').config();
const express = require('express');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware para servir archivos estáticos
app.use(express.static(__dirname));

// Ruta principal que sirve el archivo HTML
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'PBIPAPP.HTML'));
});

// Rutas adicionales para los otros archivos HTML (versiones)
app.get('/original', (req, res) => {
  res.sendFile(path.join(__dirname, 'PBIPAPP -Original.HTML'));
});

app.get('/copia', (req, res) => {
  res.sendFile(path.join(__dirname, 'PBIPAPP - copia.HTML'));
});

// Middleware para manejar errores 404
app.use((req, res) => {
  res.status(404).send(`
    <h1>404 - Página no encontrada</h1>
    <p>La página que buscas no existe.</p>
    <a href="/">Volver al inicio</a>
  `);
});

// Iniciar el servidor
app.listen(PORT, () => {
  console.log(`🚀 PBIP APP está ejecutándose en http://localhost:${PORT}`);
  console.log(`📱 Aplicación principal: http://localhost:${PORT}/`);
  console.log(`📄 Versión original: http://localhost:${PORT}/original`);
  console.log(`📄 Versión copia: http://localhost:${PORT}/copia`);
});

// Manejo de errores del servidor
process.on('unhandledRejection', (err) => {
  console.error('Error no manejado:', err);
});

process.on('uncaughtException', (err) => {
  console.error('Excepción no capturada:', err);
  process.exit(1);
});