const express = require('express');
const { getCategorias } = require('../controllers/categoriaController');
const router = express.Router();

router.get('/', getCategorias);

module.exports = router;
