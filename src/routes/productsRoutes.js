const express = require('express');
const productosController = require('../controllers/productsController');
const router = express.Router();

router.get('/', productosController.getProductos);
router.get('/:id', productosController.getProductoById);
router.get('/categoria/:categoria', productosController.getProductosByCategory);

module.exports = router;
