const db = require('../../database/db');

const Categoria = {
  getAll: async () => {
    const [result] = await db.query('SELECT * FROM CATEGORIA');
    return result;
  },
};

module.exports = Categoria;
