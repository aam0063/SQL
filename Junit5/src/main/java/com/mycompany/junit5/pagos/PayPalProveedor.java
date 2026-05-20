package com.mycompany.junit5.pagos;

/**
 * Implementación de un proveedor de pagos que simula pagos realizados mediante
 * PayPal
 *
 * Esta clase implementa la interfaz ProveedorPagos y define el comportamiento
 * concreto del método pagar()
 *
 * @author celia.macias
 */
public class PayPalProveedor implements ProveedorPagos {

    /**
     * Realiza el pago de una cantidad determinada utilizando PayPal
     *
     * Si la cantidad es menor o igual que cero, se lanza una excepción
     * indicando que el importe no es válido
     *
     * @param cantidad importe que se desea pagar
     * @throws PagoException si la cantidad es inválida
     */
    @Override
    public void pagar(int cantidad) throws PagoException {
        if (cantidad <= 0) {
            throw new PagoException("Cantidad inválida");
        }
        System.out.println("Pago realizado con PayPal: " + cantidad + "€");
    }
}
