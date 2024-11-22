const jwt = require('jsonwebtoken');
const Usuario = require('../models/usuarioModel');
const bcrypt = require('bcryptjs');
const { JWT_SECRET } = process.env;

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
    const { nombre, apellido,correo_electronico, contrasena } = req.body;
      if (!nombre || !correo_electronico || !contrasena ) {
      return res.status(400).json({ error: 'Faltan parámetros necesarios' });
    }
  
    try {
      const usuario = await Usuario.getByEmail(correo_electronico);
      if (usuario) {
        return res.status(400).json({ error: 'El correo electrónico ya está en uso' });
      }
        const hashedPassword = await bcrypt.hash(contrasena, 8);
      const result = await Usuario.create(nombre, apellido, correo_electronico, hashedPassword);
      res.status(201).json({ message:"REGISTRO EXISTOSO ID: " + result.insertId });
    } catch (error) {
      console.error('Error al registrar:', error);
      res.status(500).json({ error: 'Error al registrar' });
    }
  };
  


module.exports = { login, register };
