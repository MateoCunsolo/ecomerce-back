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

app.use(express.json()); 

// CORS
app.use(cors({
    origin: '*',
    methods: ['GET', 'POST', 'PUT', 'DELETE'],
    allowedHeaders: ['Content-Type', 'Authorization']
}));

// Cargar el archivo Swagger
const swaggerDocument = require(path.join(__dirname, 'swaggerDef.json'));
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

// Rutas
app.get('/',(req, res)=>{res.status(200).send('Bienvenido a la API de un e-commerce deportivo');});
app.use('/productos', productosRoutes);
app.use('/tipos-usuarios', tipoUsuarioRoutes);
app.use('/categorias', categoriasRoutes);
app.use('/compra', compraRoutes);
app.use('/auth', authRoutes);

// Ruta no encontrada
app.use((req, res, next) => { 
    res.status(404).json({ error: 'Ruta no encontrada' }); 
});

// Iniciar servidor
const PORT = process.env.PORT;
app.listen(PORT, () => {
    console.log('\n=================================================================================');
    console.log(`\t ✅ Servidor corriendo en http://localhost:${PORT}`);
    console.log(`\t ✅ Documentación disponible en http://localhost:${PORT}/api-docs`);
    console.log('=================================================================================\n');
});
