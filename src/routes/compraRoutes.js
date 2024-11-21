const express = require('express');
const compraController = require('../controllers/compraController');
const router = express.Router();

router.get('/:id', compraController.obtenerCompraPorId);
router.get('/cliente/:id', compraController.obtenerComprasPorCliente);
router.post('/', compraController.crearCompra);

module.exports = router;
