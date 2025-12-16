DROP DATABASE IF EXISTS TiendaTecnologia;
CREATE DATABASE TiendaTecnologia;
USE TiendaTecnologia;

-- =========================
-- TABLA CLIENTES
-- =========================
CREATE TABLE Clientes (
    Id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(255),
    Ciudad VARCHAR(100),
    Telefono VARCHAR(20),
    Email VARCHAR(100) UNIQUE NOT NULL,
    Fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- TABLA FABRICANTES
-- =========================
CREATE TABLE Fabricantes (
    Id_fab INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Pais VARCHAR(50) NOT NULL
);

-- =========================
-- TABLA CATEGORIAS
-- =========================
CREATE TABLE Categorias (
    Id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL
);

-- =========================
-- TABLA PRODUCTOS
-- =========================
CREATE TABLE Productos (
    Id_producto INT PRIMARY KEY AUTO_INCREMENT,
    Id_fab INT NOT NULL,
    Id_categoria INT,
    Descripcion VARCHAR(255) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    Existencias INT NOT NULL,
    Fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Id_fab) REFERENCES Fabricantes(Id_fab)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (Id_categoria) REFERENCES Categorias(Id_categoria)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- =========================
-- TABLA PEDIDOS
-- =========================
CREATE TABLE Pedidos (
    N_pedido INT PRIMARY KEY AUTO_INCREMENT,
    Fecha_pedido DATE NOT NULL,
    Id_cliente INT NOT NULL,
    Estado ENUM('Pendiente', 'En proceso', 'Completado', 'Cancelado') NOT NULL,
    Metodo_pago VARCHAR(30),
    Fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Id_cliente) REFERENCES Clientes(Id_cliente)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================
-- TABLA DETALLES_PEDIDO
-- =========================
CREATE TABLE Detalles_Pedido (
    N_pedido INT,
    Id_producto INT,
    Cant INT NOT NULL,
    PRIMARY KEY (N_pedido, Id_producto),
    FOREIGN KEY (N_pedido) REFERENCES Pedidos(N_pedido)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (Id_producto) REFERENCES Productos(Id_producto)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================
-- INSERCIÓN DE DATOS
-- =========================

-- CLIENTES
INSERT INTO Clientes (Nombre, Direccion, Ciudad, Telefono, Email)
VALUES
('Juan Pérez', 'Calle Falsa 123', 'Madrid', '600123456', 'juan.perez@example.com'),
('Ana López', 'Avenida Real 45', 'Barcelona', '650987654', 'ana.lopez@example.com'),
('Carlos García', 'Plaza Mayor 2', 'Valencia', '610555444', 'carlos.garcia@example.com'),
('Laura Martínez', 'Calle Sol 33', 'Sevilla', '620334556', 'laura.martinez@example.com'),
('Miguel Fernández', 'Avenida Luna 89', 'Bilbao', '630445667', 'miguel.fernandez@example.com');

-- FABRICANTES
INSERT INTO Fabricantes (Nombre, Pais)
VALUES
('HP', 'Estados Unidos'),
('Dell', 'Estados Unidos'),
('Lenovo', 'China'),
('Asus', 'Taiwán'),
('Acer', 'Taiwán'),
('Samsung', 'Corea del Sur'),
('Sony', 'Japón'),
('Toshiba', 'Japón'),
('MSI', 'Taiwán'),
('Apple', 'Estados Unidos');

-- CATEGORIAS
INSERT INTO Categorias (Nombre)
VALUES
('Portátiles'),
('Monitores'),
('Periféricos'),
('Componentes'),
('Almacenamiento'),
('Smartphones');

-- PRODUCTOS
INSERT INTO Productos (Id_fab, Id_categoria, Descripcion, Precio, Existencias)
VALUES
(1, 1, 'Portátil HP Envy 13', 999.99, 10),
(2, 2, 'Monitor Dell UltraSharp 27', 499.99, 5),
(3, 3, 'Teclado mecánico Lenovo Legion', 89.99, 20),
(4, 4, 'Placa base Asus ROG', 299.99, 8),
(5, 1, 'Ordenador Acer Aspire 5', 599.99, 15),
(6, 5, 'Disco duro Samsung EVO 1TB', 120.00, 50),
(7, 3, 'Auriculares Sony WH-1000XM4', 350.00, 30),
(8, 1, 'Portátil Toshiba Satellite', 700.00, 12),
(9, 4, 'Tarjeta gráfica MSI RTX 3080', 899.99, 6),
(10, 6, 'iPhone 14 Pro', 1199.99, 25);

-- PEDIDOS
INSERT INTO Pedidos (Fecha_pedido, Id_cliente, Estado, Metodo_pago)
VALUES
('2024-01-01', 1, 'En proceso', 'Tarjeta'),
('2023-01-01', 1, 'Completado', 'Bizum'),
('2024-02-03', 2, 'Completado', 'Efectivo'),
('2023-02-03', 2, 'Cancelado', 'Tarjeta'),
('2024-02-05', 3, 'Pendiente', 'Tarjeta'),
('2023-02-05', 3, 'Pendiente', 'Transferencia');

-- DETALLES PEDIDO
INSERT INTO Detalles_Pedido (N_pedido, Id_producto, Cant)
VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(3, 4, 1),
(4, 5, 2),
(5, 1, 1),
(5, 6, 1),
(6, 2, 2);


-- 1Listado con todos los productos, mostrando para cada uno el id_fab, el id_producto, la descripción y el precio.
SELECT Id_fab, Id_producto, Descripcion, Precio FROM Productos;

-- 2Listado de todos los pedidos realizados por el cliente 2, extrayendo toda la información.
SELECT * FROM Pedidos WHERE Id_cliente = 2;

-- 3Consultar todos los datos de los productos de más de 100 €.
SELECT * FROM Productos WHERE Precio > 100.00;

-- 4Listado de clientes de Madrid o Barcelona.
SELECT * FROM Clientes WHERE Ciudad='Madrid' or ciudad = 'Barcelona';

-- 5Obtener el precio medio de los productos del fabricante con id_fab = '1'.
SELECT AVG(Precio) AS Precio_Medio FROM Productos WHERE Id_fab = 1;

-- 6Consultar la fecha del pedido más antiguo.
SELECT MIN(Fecha_pedido) AS Pedido_Mas_Antiguo FROM Pedidos;

-- 7Consultar los diferentes paises que existen en los fabricantes (sin repetir)
SELECT DISTINCT Pais FROM Fabricantes;

-- 8Obtén los pedidos realizados entre el 1 de enero de 2024 y el 5 de febrero de 2024.
SELECT * FROM Pedidos WHERE Fecha_pedido BETWEEN '2024-01-01' AND '2024-02-05';

-- 9Muestra una lista de los clientes con su nombre completo (direccion + ciudad) concatenados en un solo campo.
SELECT concat(Direccion, "-", Ciudad, "y su nombre es ", Nombre) as prueba from Clientes;

-- 10Muestra cuantos fabricantes hay en cada país
SELECT Pais, COUNT(Id_fab) AS Total_Fabricantes FROM Fabricantes GROUP BY Pais;

-- 11Muestra en otra columna llamada precio_con_iva todos los datos de los productos, suma el iva 21%. (lo del having es extra)
SELECT *, Precio * 1.21 AS Precio_con_IVA FROM Productos having precio_con_iva >=500;

-- 12Producto más caro


-- 13Cliente con más pedidos
select id_cliente,count(*) from pedidos group by id_Cliente;

-- 14Mostrar los productos ordenados por precio de mayor a menor
SELECT * FROM Productos ORDER BY Precio DESC;

-- 15Mostrar los clientes ordenados por ciudad alfabéticamente
SELECT * FROM Clientes ORDER BY Ciudad ASC;

-- 16Mostrar solo los 5 productos más baratos


-- 17Mostrar cuántos productos hay por fabricante
SELECT Id_fab, COUNT(Id_producto) AS Total_Productos FROM Productos GROUP BY Id_fab;

-- 18Mostrar solo los fabricantes que tengan más de 1 producto
SELECT Id_fab, COUNT(Id_producto) AS Total_Productos FROM Productos GROUP BY Id_fab HAVING COUNT(Id_producto) > 1;

-- 19Mostrar clientes cuyo nombre empiece por “A”
SELECT * FROM Clientes WHERE Nombre LIKE 'A%';

-- 20Mostrar productos cuyo nombre contenga la palabra “Portátil”
SELECT * FROM Productos WHERE Descripcion LIKE '%Portátil%';

-- 21Convertir nombres de clientes a mayúsculas
SELECT UPPER(Nombre) AS Nombre_Mayusculas FROM Clientes;

-- 22Convertir descripciones de productos a minúsculas
SELECT LOWER(Descripcion) AS Descripcion_Minusculas FROM Productos;

-- 23Nombre + dirección en mayúsculas en una columna llamada "Nombre_Completo"
SELECT UPPER(concat(Direccion," - ", Ciudad, " y su nombre es ", Nombre)) AS Nombre_Completo FROM Clientes;

-- 24Cambiar el formato de los nombres de productos para que comiencen con "Producto:" seguido de su descripción. Crear un alias Producto_Descripcion.
SELECT 'Producto: ' || Descripcion AS Producto_Descripcion FROM Productos;

-- 25Extraer las tres primeras letras del nombre de cada país de fabricantes:
select * from fabricantes;
SELECT pais, SUBSTR(Pais, 1, 3) FROM Fabricantes;
select pais, left(pais,3) as codigo from fabricantes; 

-- 26Reemplazar "Calle" por "Avda." en las direcciones de cliente
SELECT Nombre, Direccion, REPLACE(Direccion, 'Calle', 'Avda.') AS Direccion_Modificada FROM Clientes;

-- 27Calcular cuántos días han pasado desde cada pedido hasta hoy (función SYSDATE):
SELECT N_pedido, Fecha_pedido, SYSDATE - Fecha_pedido AS Dias_Transcurridos FROM Pedidos;

-- 28. Obtener la última fecha del mes en que se realizó cada pedido (función LAST_DAY):
SELECT N_pedido, Fecha_pedido, LAST_DAY(Fecha_pedido) AS UltimoDiaDelMes
FROM Pedidos;

-- 29. Asignar un estado personalizado a los pedidos dependiendo de su estado actual, 'Finalizado', 'Anulado' o 'En Gestión' (expresión CASE):
SELECT N_pedido, Estado,
CASE
    WHEN Estado = 'Completado' THEN 'Finalizado'
    WHEN Estado = 'Cancelado' THEN 'Anulado'
    ELSE 'En Gestión'
END AS EstadoPersonalizado
FROM Pedidos;

-- 30. Obtener los pedidos realizados en 2023.
SELECT *
FROM Pedidos
WHERE EXTRACT(YEAR FROM Fecha_pedido) = 2023;

-- 31. Elevar el precio de cada producto al cuadrado
SELECT Descripcion, Precio, POWER(Precio, 2) AS PrecioAlCuadrado
FROM Productos;

-- 32. Redondear el precio de cada producto a 1 decimal
SELECT Descripcion, Precio, ROUND(Precio, 1) AS PrecioRedondeado
FROM Productos;

-- 33. Extraer el año de las fechas de pedido:
SELECT N_pedido, Fecha_pedido, EXTRACT(YEAR FROM Fecha_pedido) AS AnioPedido
FROM Pedidos;

-- 34. Calcular cuántos pedidos se hicieron en un año específico (por ejemplo, 2024):
SELECT COUNT(*) AS TotalPedidos2024
FROM Pedidos
WHERE EXTRACT(YEAR FROM Fecha_pedido) = 2024;

-- 35. Invertir el nombre de los clientes:
SELECT Nombre, REVERSE(Nombre) AS NombreInvertido
FROM Clientes;

-- 36. Mostrar la longitud de cada nombre de cliente
SELECT Nombre, LENGTH(Nombre) AS LongitudNombre
FROM Clientes;

-- 37. Mostrar solo los 4 primeros caracteres del nombre del cliente
SELECT Nombre, SUBSTR(Nombre, 1, 4) AS PrimerosCuatroCaracteres
FROM Clientes;

-- 38. Mostrar “CARO” para productos >= 500 o “BARATO” según el precio

-- 39. Cantidad total de productos vendidos por cada producto

-- 40. Número de clientes por cada ciudad (Añade algo a la consulta para mostrar solo las ciudades que tengan más de un cliente)