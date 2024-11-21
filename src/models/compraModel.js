const db = require('../../database/db');

const crearCompra = async (compra) => {
    const { id_usuario, productos, monto_total } = compra;

    const connection = await db.getConnection(); // Obtener conexión de MySQL
    try {
        await connection.beginTransaction();

        // Insertar en la tabla COMPRA
        const [compraResult] = await connection.query(
            'INSERT INTO COMPRA (id_usuario, monto_total, fecha) VALUES (?, ?, NOW())',
            [id_usuario, monto_total]
        );

        const compraId = compraResult.insertId;

        // Manejar productos
        for (const { id_producto, cantidad } of productos) {
            // Verificar stock
            const [stockResult] = await connection.query(
                'SELECT stock FROM PRODUCTO WHERE id = ?',
                [id_producto]
            );

            if (stockResult.length === 0 || stockResult[0].stock < cantidad) {
                throw new Error(`Stock insuficiente para el producto con ID ${id_producto}`);
            }

            // Insertar en COMPRA_X_PRODUCTO
            await connection.query(
                'INSERT INTO COMPRA_X_PRODUCTO (id_compra, id_producto, cantidad) VALUES (?, ?, ?)',
                [compraId, id_producto, cantidad]
            );

            // Actualizar stock
            await connection.query(
                'UPDATE PRODUCTO SET stock = stock - ? WHERE id = ?',
                [cantidad, id_producto]
            );
        }

        await connection.commit();
        return { compraId };
    } catch (error) {
        await connection.rollback();
        throw error;
    } finally {
        connection.release();
    }
};

const obtenerCompraPorId = async (id) => {
    const connection = await db.getConnection();
    try {
        const [compra] = await connection.query(
            'SELECT * FROM COMPRA WHERE id = ?',
            [id]
        );

        if (compra.length === 0) return null;

        // Obtener productos de la compra
        const [productos] = await connection.query(
            'SELECT p.id, p.nombre, p.descripcion, p.precio, cxp.cantidad FROM COMPRA_X_PRODUCTO cxp JOIN PRODUCTO p ON cxp.id_producto = p.id WHERE cxp.id_compra = ?',
            [id]
        );

        return {
            id: compra[0].id,
            id_usuario: compra[0].id_usuario,
            fecha: compra[0].fecha,
            monto_total: compra[0].monto_total,
            productos,
        };
    } catch (error) {
        throw error;
    } finally {
        connection.release();
    }
};

const obtenerComprasPorCliente = async (id_usuario) => {
    const connection = await db.getConnection();
    try {
        const [compras] = await connection.query(
            'SELECT * FROM COMPRA WHERE id_usuario = ?',
            [id_usuario]
        );

        if (compras.length === 0) return [];

        // Para cada compra, buscar productos relacionados
        const comprasConProductos = [];
        for (const compra of compras) {
            const productos = await obtenerProductosPorCompra(compra.id);
            comprasConProductos.push({
                ...compra,
                productos,
            });
        }

        return comprasConProductos;
    } catch (error) {
        throw error;
    } finally {
        connection.release();
    }
};

const obtenerProductosPorCompra = async (id_compra) => {
    const connection = await db.getConnection();
    try {
        const [productos] = await connection.query(
            'SELECT p.id, p.nombre, p.precio, cxp.cantidad FROM COMPRA_X_PRODUCTO cxp JOIN PRODUCTO p ON cxp.id_producto = p.id WHERE cxp.id_compra = ?',
            [id_compra]
        );
        return productos;
    } catch (error) {
        throw error;
    } finally {
        connection.release();
    }
};

module.exports = {
    crearCompra,
    obtenerCompraPorId,
    obtenerComprasPorCliente,
};
