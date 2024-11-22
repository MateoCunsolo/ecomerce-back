const db = require('../../database/db');

const Producto = {
  getAll: async () => {
    const [result] = await db.query('SELECT * FROM PRODUCTO');
    return result;
  },

  getOne: async (id) => {
    const [result] = await db.query('SELECT * FROM PRODUCTO WHERE id = ?', [id]);
    return result;
  },

  getByCategory: async (categoria) => {
    const [result] = await db.query('SELECT * FROM PRODUCTO WHERE id_categoria = ?', [categoria]);
    return result;
  },

  updateStock: async (id, stock) => {
    if (stock >= 0) {
      const [result] = await db.query('UPDATE PRODUCTO SET stock = ? WHERE id = ?', [stock, id]);
      return result;
    } else {
      return { error: 'El stock debe ser mayor o igual a 0' };
    }
  },

  updatePrice: async (id, price) => {
    if (price >= 0) {
      const [result] = await db.query('UPDATE PRODUCTO SET precio = ? WHERE id = ?', [price, id]);
      return result;
    } else {
      return { error: 'El precio debe ser mayor o igual a 0' };
    }
  },

  updateDescription: async (id, description) => {
    const [result] = await db.query('UPDATE PRODUCTO SET descripcion = ? WHERE id = ?', [description, id]);
    return result;
  },

  updateName: async (id, name) => {
    const [result] = await db.query('UPDATE PRODUCTO SET nombre = ? WHERE id = ?', [name, id]);
    return result;
  },

  updateImg: async (id, img) => {
    const [result] = await db.query('UPDATE PRODUCTO SET imagen_url = ? WHERE id = ?', [img, id]);
    return result;
  },

  updateCategory: async (id, category) => {
    const [result] = await db.query('UPDATE PRODUCTO SET id_categoria = ? WHERE id = ?', [category, id]);
    return result;
  },

  updateProduct: async (id, product) => {
    const [result] = await db.query('UPDATE PRODUCTO SET nombre = ?, descripcion = ?, precio = ?, stock = ?, imagen_url = ?, id_categoria = ? WHERE id = ?', [product.nombre, product.descripcion, product.precio, product.stock, product.imagen_url, product.id_categoria, id]);
    return result;
  },

  createProduct: async (product) => {
    const [result] = await db.query('INSERT INTO PRODUCTO (nombre, descripcion, precio, stock, imagen_url, id_categoria) VALUES (?, ?, ?, ?, ?, ?)', [product.nombre, product.descripcion, product.precio, product.stock, product.imagen_url, product.id_categoria]);
    if (result.affectedRows) {
      return { message: 'Producto creado con éxito', id: result.insertId };  
    }
    return { error: 'No se pudo crear el producto' };
  },

  deleteProduct: async (id) => {
    const [result] = await db.query('DELETE FROM PRODUCTO WHERE id = ?', [id]);
    if (result.affectedRows) {
      return { message: 'Producto eliminado con éxito' };
    }
    return { error: 'No existe ese producto' };
  }

};

module.exports = Producto;
