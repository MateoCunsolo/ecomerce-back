const db = require('../../database/db');

const Producto = {
  getAll: async () => {
    const [result] = await db.query('SELECT * FROM PRODUCTO');
    return result;
  },
};

module.exports = Producto;
