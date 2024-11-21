const express = require('express');
const productosRoutes = require('./routes/productsRoutes');
const usuariosRoutes = require('./routes/usuarioRoutes');
const categoriasRoutes = require('./routes/categoriaRoutes');
const tiposUsuariosRoutes = require('./routes//tipoUsuarioRoutes');

const app = express();

// ---------------------------- Middlewares ---------------------------- //
app.use(express.json());

// ---------------------------- Rutas ---------------------------- //

// Ruta inicial
app.get('/', (req, res) => {
  res.status(200).send('Bienvenido a la API de un e-commerce deportivo');
});

// Rutas de productos
app.use('/productos', productosRoutes);

// Rutas de usuarios
app.use('/usuarios', usuariosRoutes);

// Rutas de categorías
app.use('/categorias', categoriasRoutes);

// Rutas de tipos de usuarios
app.use('/tipos-usuarios', tiposUsuariosRoutes);

// ---------------------------- Manejo de errores ---------------------------- //

// Ruta no encontrada
app.use((req, res, next) => {
  res.status(404).json({ error: 'Ruta no encontrada' });
});

// Middleware para manejar errores generales
app.use((err, req, res, next) => {
  console.error('Error interno:', err.message);
  res.status(500).json({ error: 'Error interno del servidor' });
});

// ---------------------------- Inicio del servidor ---------------------------- //

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
