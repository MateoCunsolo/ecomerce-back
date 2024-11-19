const productoModel = require('../models/productsModels');

const getProductos = async (req, res) => {
  try {
    const productos = await productoModel.getAll(); 
    res.status(200).json(productos); 
  } catch (error) {
    console.error('Error al obtener productos:', error.message);
    res.status(500).json({ error: 'Error al obtener productos' });
  }
};

module.exports = {
  getProductos,
};
