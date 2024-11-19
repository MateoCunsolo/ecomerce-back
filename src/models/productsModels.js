const db = require('../../database/db');

const Producto = {
  getAll: async () => {
    /* 
      desestructuración de arreglos  ==>  const [result] = await db.query('SELECT * FROM productos');
      sino sería: const result = await db.query('SELECT * FROM productos'); 
      nos ahorramos la variable result y accedemos directamente al primer elemento del arreglo que nos devuelve db.query,
      utilizando [result] = await db.query('SELECT * FROM productos'); 
      db.query devuelve un arreglo de dos elementos, 
      el primero es el resultado de la consulta, 
      el segundo es la información de los campos que se obtuvieron en la consulta, 
      por eso a nosotros solo nos interesa el primer elemento y lo desestructuramos en la variable result 
      poniendo corchetes al lado de la variable.
    */
    const [result] = await db.query('SELECT * FROM productos');
    return result;
  }
};

module.exports = Producto;
