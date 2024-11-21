const Categoria = require('../models/categoriaModel');

const getCategorias = async (req, res) => {
  try {
    const categorias = await Categoria.getAll();
    res.status(200).json(categorias);
  } catch (error) {
    res.status(500).json({ error: 'Error al obtener categorías' });
  }
};

module.exports = { getCategorias };
