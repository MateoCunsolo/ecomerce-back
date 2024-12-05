// models/usuarioModel.js
const db = require('../../database/db');
const bcrypt = require('bcryptjs');

const Usuario = {
  // Buscar un usuario por correo electrónico
  getByEmail: async (email) => {
    const query = 'SELECT * FROM USUARIO WHERE correo_electronico = ?';
    const [result] = await db.query(query, [email]);
    return result[0]; // Retornar el primer usuario que coincida
  },

  // Validar la contraseña
  validatePassword: async (inputPassword, storedPassword) => {
    return bcrypt.compare(inputPassword, storedPassword);
  },

  create: async (nombre, apellido, correo_electronico, contrasena,id_tipo_usuario) => {
    const query = 'INSERT INTO USUARIO (nombre, apellido, correo_electronico, contrasena, id_tipo_usuario) VALUES (?, ?, ?, ?, ?)';
    const [result] = await db.query(query, [nombre, apellido, correo_electronico, contrasena, id_tipo_usuario]);
    return result;
  },

};

module.exports = Usuario;
