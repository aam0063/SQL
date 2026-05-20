/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */
package com.mycompany.junit5;

import com.mycompany.junit5.catalogo.Pedido;
import com.mycompany.junit5.catalogo.Producto;

/**
 *
 * @author celia.macias
 */
public class Junit5 {
    public static void main(String[] args) {
        Producto p1 = new Producto("Coco", 400);

        Producto p2 = new Producto("Canela", 200);

        System.out.println(p1);

        System.out.println(p2);

        Pedido p = new Pedido();

        p.agregar(p1);

        p.agregar(p2);

        System.out.println("Cantidad, " + p.cantidad());

        System.out.println("Total, " + p.total());
    }
}
