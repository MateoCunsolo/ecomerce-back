const express = require('express');
const productosRoutes = require('./routes/productsRoutes');

const app = express();
app.use(express.json());

// ---------------------------- Rutas ---------------------------- //

// Inicial
app.get('', (req, res) => { res.send('Bienvenido a la API de productos de un e-commerce deportivo');});

// Productos
app.use('/productos', productosRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
