package com.mycompany.junit5.pagos;

/**
 *
 * @author celia.macias
 */
public interface ProveedorPagos {
        void pagar(int cantidad) throws PagoException;
}
