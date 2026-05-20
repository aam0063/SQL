package junit5.catalogo;

import com.mycompany.junit5.catalogo.Carrito;
import com.mycompany.junit5.catalogo.Producto;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class ProductoTest {

    @Test
    public void crearProductoPasta() {

        Producto producto = new Producto("pasta", 7.5);

        assertEquals("pasta", producto.getNombre());
        assertEquals(7.5, producto.getPrecio());
    }

    @Test
    public void vaciarCarrito() {

        Carrito carrito = new Carrito();

        carrito.agregarProducto(new Producto("galleta", 2));
        carrito.agregarProducto(new Producto("selbesa", 3));

        carrito.vaciar();

        assertEquals(0, carrito.getProductos().size());
    }
}
