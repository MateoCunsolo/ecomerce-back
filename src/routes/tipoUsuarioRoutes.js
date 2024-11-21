const express = require('express');
const { getTiposUsuarios } = require('../controllers/tipoUsuarioController');
const router = express.Router();

router.get('/', getTiposUsuarios);

module.exports = router;
