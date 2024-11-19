const express = require('express');
const productosController = require('../controllers/productsController');
const router = express.Router();


// ---------------------------- Rutas  de Productos ---------------------------- //
// Ruta incial ===> http://localhost:3000/productos


// ---------------- GET ----------------

// Obtener todos los productos
router.get('/', productosController.getProductos);









module.exports = router;
