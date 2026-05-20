package com.mycompany.junit5.catalogo;

import com.mycompany.junit5.pagos.PagoException;
import com.mycompany.junit5.pagos.ProveedorPagos;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author celia.macias
 */
public class Pedido implements Carrito, Pagable {

    private final List<Producto> productos = new ArrayList<>();

    /**
     * Agrega un producto al carrito
     *
     * @param p producto que se añadirá al pedido
     */
    @Override
    public void agregar(Producto p) {
        this.productos.add(p);
    }

    /**
     * Calcula el precio total del pedido sumando el precio de todos los
     * productos almacenados en la lista
     *
     * @return suma total de los precios de los productos
     */
    @Override
    public int total() {
        return this.productos.stream()
                .map(Producto::precio)
                .reduce(0, Integer::sum);
    }

    /**
     * Devuelve la cantidad de productos almacenados en el pedido
     *
     * @return úmero total de productos del pedido
     */
    @Override
    public int cantidad() {
        return this.productos.size();
    }

    /**
     * Elimina todos los productos del pedido, dejando el carrito vacío
     */
    @Override
    public void vaciar() {
        this.productos.clear();
    }

    /**
     * Realiza el pago del pedido utilizando el proveedor de pagos indicado
     *
     * @param proveedor proveedor encargado de procesar el pago
     * @throws PagoException si ocurre un error durante el pago
     */
    @Override
    public void pagar(ProveedorPagos proveedor)
            throws PagoException {

        proveedor.pagar(this.total());
    }
}
