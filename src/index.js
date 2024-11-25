const express = require('express');
const cors = require('cors');
const path = require('path');
const productosRoutes = require('./routes/productsRoutes');
const authRoutes = require('./routes/authRoutes'); 
const categoriasRoutes = require('./routes/categoriaRoutes'); 
const tipoUsuarioRoutes = require('./routes/tipoUsuarioRoutes');
const compraRoutes = require('./routes/compraRoutes');
const swaggerUi = require('swagger-ui-express');
const app = express();

// Middleware para manejar cuerpos JSON
app.use(express.json()); // Solo una vez es necesario

// CORS
app.use(cors({
    origin: '*', // Puedes cambiar '*' por orígenes específicos si lo prefieres
    methods: ['GET', 'POST', 'PUT', 'DELETE'],
    allowedHeaders: ['Content-Type', 'Authorization']
}));

// Cargar el archivo Swagger
const swaggerDocument = require(path.join(__dirname, 'swaggerDef.json'));

// Usar Swagger UI en la ruta '/api-docs'
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

// Rutas
app.get('/', (req, res) => { 
    res.status(200).send('Bienvenido a la API de un e-commerce deportivo'); 
});
app.use('/productos', productosRoutes);
app.use('/tipos-usuarios', tipoUsuarioRoutes);
app.use('/categorias', categoriasRoutes);
app.use('/compra', compraRoutes);
app.use('/auth', authRoutes);

// Ruta no encontrada
app.use((req, res, next) => { 
    res.status(404).json({ error: 'Ruta no encontrada' }); 
});

// Manejo de errores internos
app.use((err, req, res, next) => {
    console.error('Error interno:', err.message);
    res.status(500).json({ error: 'Error interno del servidor' });
});

// Iniciar servidor
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Servidor corriendo en http://localhost:${PORT}`);
    console.log(`Documentación disponible en http://localhost:${PORT}/api-docs`);
});
