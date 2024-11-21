const db = require('../../database/db');

const Usuario = {
  getAll: async () => {
    const [result] = await db.query('SELECT * FROM USUARIO');
    return result;
  },
  create: async (usuario) => {
    const { id_tipo_usuario, nombre, apellido, correo_electronico, contrasena } = usuario;
    const [result] = await db.query(
      `INSERT INTO USUARIO (id_tipo_usuario, nombre, apellido, correo_electronico, contrasena)
       VALUES (?, ?, ?, ?, ?)`,
      [id_tipo_usuario, nombre, apellido, correo_electronico, contrasena]
    );
    return result.insertId;
  },
};

module.exports = Usuario;
