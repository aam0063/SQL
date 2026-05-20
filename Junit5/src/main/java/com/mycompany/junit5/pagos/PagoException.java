package com.mycompany.junit5.pagos;

/**
 * Excepción personalizada utilizada para indicar errores relacionados con el
 * proceso de pago
 *
 * Esta clase hereda de Exception, por lo que representa una excepción
 * comprobada (checked exception) que debe controlarse con try/catch o throws
 *
 * @author celia.macias
 */
public class PagoException extends Exception {

    /**
     * Crea una nueva excepción de pago con un mensaje descriptivo del error
     *
     * @param mensaje descripción del error ocurrido
     */
    public PagoException(String mensaje) {

        super(mensaje);

    }
}
