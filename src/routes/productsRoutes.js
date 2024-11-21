const express = require('express');
const productosController = require('../controllers/productsController');
const router = express.Router();


//CREAR
router.post('/create', productosController.createProducto);

//OBETENER
router.get('/', productosController.getProductos);
router.get('/:id', productosController.getProductoById);
router.get('/categoria/:categoria', productosController.getProductosByCategory);

//ACTUALIZAR
router.put('/update/stock/:id', productosController.updateProductoStockById);
router.put('/update/precio/:id', productosController.updateProductoPriceById);
router.put('/update/descripcion/:id', productosController.updateProductoDescriptionById);
router.put('/update/nombre/:id', productosController.updateProductoNameById);
router.put('/update/imagen/:id', productosController.updateProductoImgById);
router.put('/update/categoria/:id', productosController.updateProductoCategoryById);
router.put('/update/:id', productosController.updateProductoById);

//ELIMINAR
router.delete('/delete/:id', productosController.deleteProductoById);


module.exports = router;
