package junit5.catalogo;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.mycompany.junit5.catalogo.Pedido;
import com.mycompany.junit5.catalogo.Producto;


public class PedidoTest {

    @Test
    public void testCantidad(){
        Producto p1 = new Producto("queso", 2);
        Producto p2 = new Producto("pan", 4);

        Pedido p = new Pedido();

        Assertions.assertEquals(0, p.cantidad());
        p.agregar(p1);

        Assertions.assertEquals(1, p.cantidad());
        p.agregar(p2);

        Assertions.assertEquals(2, p.cantidad());
        Assertions.assertTrue(true);
    }
}