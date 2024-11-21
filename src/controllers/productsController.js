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

const getProductoById = async (req, res) => {
  try{
    const {id} = req.params;
    const producto = await productoModel.getOne(id);
    res.status(200).json(producto);
  }catch(error){
    console.error('Error al obtener producto:', error.message);
    res.status(500).json({ error: 'Error al obtener producto' });
  }
};

const getProductosByCategory = async (req, res) => {
  try{
    const {categoria} = req.params;
    const productos = await productoModel.getByCategory(categoria);
    res.status(200).json(productos);
  }catch(error){
    console.error('Error al obtener productos:', error.message);
    res.status(500).json({ error: 'Error al obtener productos' });
  }
};


module.exports = {
  getProductos,
  getProductoById,
  getProductosByCategory
};
