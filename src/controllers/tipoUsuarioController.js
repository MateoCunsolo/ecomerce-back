const TipoUsuario = require('../models/tipoUsuarioModel');

const getTiposUsuarios = async (req, res) => {
  try {
    const tiposUsuarios = await TipoUsuario.getAll();
    res.status(200).json(tiposUsuarios);
  } catch (error) {
    res.status(500).json({ error: 'Error al obtener tipos de usuarios' });
  }
};

module.exports = { getTiposUsuarios };
