package junit5.catalogo;

import com.mycompany.junit5.catalogo.Carrito;
import com.mycompany.junit5.catalogo.Producto;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class ProductoTest {

    @Test
    public void crearProductoRamenEspacial() {

        Producto producto = new Producto("Ramen espacial", 7.5);

        assertEquals("Ramen espacial", producto.getNombre());
        assertEquals(7.5, producto.getPrecio());
    }

    @Test
    public void vaciarCarritoGalactico() {

        Carrito carrito = new Carrito();

        carrito.agregarProducto(new Producto("Galleta lunar", 2));
        carrito.agregarProducto(new Producto("Refresco marciano", 3));

        carrito.vaciar();

        assertEquals(0, carrito.getProductos().size());
    }
}
