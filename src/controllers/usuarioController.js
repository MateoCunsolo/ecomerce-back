const Usuario = require('../models/usuarioModel');

const getUsuarios = async (req, res) => {
  try {
    const usuarios = await Usuario.getAll();
    res.status(200).json(usuarios);
  } catch (error) {
    res.status(500).json({ error: 'Error al obtener usuarios' });
  }
};

const createUsuario = async (req, res) => {
  const usuario = req.body;
  try {
    const userId = await Usuario.create(usuario);
    res.status(201).json({ id: userId });
  } catch (error) {
    res.status(500).json({ error: 'Error al crear usuario' });
  }
};

module.exports = { getUsuarios, createUsuario };
