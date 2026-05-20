package com.mycompany.junit5.pagos;

/**
 * Interfaz que define el comportamiento básico de cualquier proveedor de pagos
 *
 * Todas las clases que implementen esta interfaz deberán proporcionar una
 * implementación del método pagar()
 *
 * Ejemplos: - PayPalProveedor - StripeProveedor - BizumProveedor
 *
 * @author celia.macias
 */
public class SinFondosProveedor implements ProveedorPagos {
    /**
     * Procesa el pago de una cantidad determinada
     *
     * @param cantidad importe que se desea pagar
     * @throws PagoException si ocurre un error durante el pago
     */
    @Override
    public void pagar(int cantidad) throws PagoException {
        throw new PagoException("No hay fondos suficientes");
    }
}
