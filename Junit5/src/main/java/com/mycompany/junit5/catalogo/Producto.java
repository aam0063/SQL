package com.mycompany.junit5.catalogo;

/**
 * Representa un producto del catálogo con un nombre y un precio
 *
 * Al ser un record, Java genera automáticamente: 
 * - constructor 
 * - getters (nombre() y precio()) 
 * - toString() 
 * - equals() 
 * - hashCode()
 *
 * @param nombre nombre del producto
 * @param precio precio del producto
 *
 * @author celia.macias
 */
public record Producto(String nombre, int precio) {

}
