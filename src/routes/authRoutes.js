const express = require('express');
const router = express.Router();
const authController = require('../controllers/authController');  // Asegúrate de tener este controlador correctamente exportado

// Ruta POST para login
router.post('/login', authController.login);
router.post('/register', authController.register);

module.exports = router;
