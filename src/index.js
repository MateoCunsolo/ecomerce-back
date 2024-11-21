const express = require('express');
const productosRoutes = require('./routes/productsRoutes');
const authRoutes = require('./routes/authRoutes'); 
const categoriasRoutes = require('./routes/categoriaRoutes'); 
const tipoUsuarioRoutes = require('./routes/tipoUsuarioRoutes');
const compraRoutes = require('./routes/compraRoutes');
const app = express();

app.use(express.json());

// rutas
app.get('/', (req, res) => {res.status(200).send('Bienvenido a la API de un e-commerce deportivo');});
app.use('/productos', productosRoutes);
app.use('/tipo-usuario', tipoUsuarioRoutes);
app.use('/categorias', categoriasRoutes);
app.use('/compra', compraRoutes);
app.use('/auth', authRoutes); 

// ruta no encontrada
app.use((req, res, next) => {res.status(404).json({ error: 'Ruta no encontrada' });});



app.listen(3000, () => {
  console.log('Servidor iniciado en http://localhost:3000');
});
app.use((err, req, res, next) => {
  console.error('Error interno:', err.message);
  res.status(500).json({ error: 'Error interno del servidor' });
});