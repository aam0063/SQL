package com.mycompany.junit5.catalogo;

import com.mycompany.junit5.pagos.PagoException;
import com.mycompany.junit5.pagos.ProveedorPagos;

/**
 *
 * @author celia.macias
 */
public interface Pagable {
    /**
     * Permite pagar el carrito a través de un proveedor
     * @param pagos
     * @throws PagoException 
     */
    void pagar(ProveedorPagos pagos) throws PagoException;
}
