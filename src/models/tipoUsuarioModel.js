const db = require('../../database/db');

const TipoUsuario = {
  getAll: async () => {
    const [result] = await db.query('SELECT * FROM TIPO_USUARIO');
    return result;
  },
};

module.exports = TipoUsuario;
