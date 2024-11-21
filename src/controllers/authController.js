// controllers/authController.js
const jwt = require('jsonwebtoken');
const Usuario = require('../models/usuarioModel');
const JWT_SECRET = 'CILSA_2024_E-COMERCE_a1b2c3d4e5f6g7h8i9j0';
const bcrypt = require('bcryptjs');

const login = async (req, res) => {
  const { correo_electronico, contrasena } = req.body;

  try {
    const usuario = await Usuario.getByEmail(correo_electronico);
    
    if (!usuario) {
      return res.status(404).json({ error: 'Usuario con ese email no encontrado' });
    }
    const isPasswordValid = await Usuario.validatePassword(contrasena, usuario.contrasena);
    if (!isPasswordValid) {
      return res.status(401).json({ error: 'Contraseña incorrecta' });
    }
    const payload = {
        id: usuario.id,
        nombre: usuario.nombre,
        apellido: usuario.apellido,
        correo_electronico: usuario.correo_electronico,
        tipo_usuario: usuario.id_tipo_usuario === 1 ? 'admin' : 'cliente',
    };
    const token = jwt.sign(payload, JWT_SECRET, { expiresIn: '1h' });
    console.log('\nEl usuario [ '+usuario.nombre+', '+usuario.apellido+ ' ] ha iniciado sesión');
    res.status(200).json({ message:"LOGIN EXISTOSO",...payload, token });
  } catch (error) {
    console.error('Error al autenticar:', error);
    res.status(500).json({ error: 'Error al autenticar' });
  }
};


const register = async (req, res) => {
    const { nombre, apellido,correo_electronico, contrasena, id_tipo_usuario } = req.body;
  
    // Verifica si faltan campos en la solicitud
    if (!nombre || !correo_electronico || !contrasena || !id_tipo_usuario) {
      return res.status(400).json({ error: 'Faltan parámetros necesarios' });
    }
  
    try {
      // Verificar si el correo ya está en uso
      const usuario = await Usuario.getByEmail(correo_electronico);
      if (usuario) {
        return res.status(400).json({ error: 'El correo electrónico ya está en uso' });
      }
  
      // Hashear la contraseña
      const hashedPassword = await bcrypt.hash(contrasena, 8);
  
      // Crear el usuario
      const result = await Usuario.create(nombre, apellido, correo_electronico, hashedPassword, id_tipo_usuario);
      //devolver token del usuario creado
        const payload = {
            id: result.insertId,
            nombre,
            apellido,
            correo_electronico,
            tipo_usuario: id_tipo_usuario === 1 ? 'admin' : 'cliente',
        };
        const token = jwt.sign(payload, JWT_SECRET, { expiresIn: '1h' });
        console.log('\nEl usuario [ '+nombre+', '+apellido+ ' ] se ha registrado en el sistema');
        res.status(201).json({ message:"REGISTRO EXISTOSO", ...payload, token });

    } catch (error) {
      console.error('Error al registrar:', error);
      res.status(500).json({ error: 'Error al registrar' });
    }
  };
  


module.exports = { login, register };
