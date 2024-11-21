const compraModel = require('../models/compraModel');

const crearCompra = async (req, res) => {
    const { id_usuario, productos, monto_total } = req.body;

    if (!id_usuario || !productos || productos.length === 0 || !monto_total) {
        return res.status(400).json({ error: 'Faltan datos obligatorios' });
    }

    try {
        const result = await compraModel.crearCompra({ id_usuario, productos, monto_total });
        res.status(201).json({ message: 'Compra registrada exitosamente', compraId: result.compraId });
    } catch (error) {
        console.error('Error al registrar la compra:', error.message);
        res.status(500).json({ error: error.message });
    }
};

const obtenerCompraPorId = async (req, res) => {
    const { id } = req.params;

    if (!id) {
        return res.status(400).json({ error: 'Falta el ID de la compra' });
    }

    try {
        const compra = await compraModel.obtenerCompraPorId(id);
        if (!compra) {
            return res.status(404).json({ error: 'Compra no encontrada' });
        }
        res.status(200).json(compra);
    } catch (error) {
        console.error('Error al obtener la compra:', error.message);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
};

const obtenerComprasPorCliente = async (req, res) => {
    const { id } = req.params;

    if (!id) {
        return res.status(400).json({ error: 'Falta el ID del cliente' });
    }

    try {
        const compras = await compraModel.obtenerComprasPorCliente(id);
        if (compras.length === 0) {
            return res.status(404).json({ error: 'No se encontraron compras para este cliente' });
        }
        res.status(200).json(compras);
    } catch (error) {
        console.error('Error al obtener las compras:', error.message);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
};

module.exports = {
    crearCompra,
    obtenerCompraPorId,
    obtenerComprasPorCliente,
};
