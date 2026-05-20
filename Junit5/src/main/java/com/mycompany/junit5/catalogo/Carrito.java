package com.mycompany.junit5.catalogo;

/**
 * Interfaz que define las operaciones básicas de un carrito de compra
 *
 * @author celia.macias
 */
public interface Carrito {

    /**
     * Agrega un producto al carrito
     *
     * @param p producto que se añadirá al carrito
     */
    void agregar(Producto p);

    /**
     * Devuelve la cantidad de productos almacenados en el carrito
     *
     * @return número total de productos
     */
    int cantidad();

    /**
     * Calcula el importe total del carrito sumando el precio de todos los
     * productos
     *
     * @return precio total del carrito
     */
    int total();

    /**
     * Elimina todos los productos del carrito
     */
    void vaciar();
}
