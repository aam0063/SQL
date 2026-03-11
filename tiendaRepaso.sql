drop database if exists tienda;
create database tienda;
use tienda;

create table fabricantes (
	clave_fabricante int,
    nombre varchar(30)
);

create table articulos(
	clave_articulo int auto_increment,
    nombre varchar(50),
    precio decimal(8,2),
    clave_fabricante int,
    existencias int
);

alter table fabricantes add constraint pk_fabricantes primary key(clave_fabricante);
alter table articulos add constraint fk_articulo_fab
	foreign key(clave_fabricante) references fabricantes(clave_fabricante);
    
show tables;
describe articulos;

insert into fabricantes (clave_fabricante,nombre) values
(1, 'Kingston'),
(2,'Adata'),
(3,'Logitech'),
(4,'Lexar'),
(5, 'Seagate');

select * from fabricantes;

insert into articulos (nombre, precio, clave_fabricante, existencias) values
('Teclado', 65.75, 3, 250),
('Disco duro 2 Tb', 250.50, 5, 275),
('Mouse', 37.75, 3, 300),
('Memoria USB', 14.50, 4, 25),
('Memoria RAM', 230.76, 1, 10),
('Disco duro extraíble 250 Gb', 350.00, 5, 30),
('Memoria USB', 29.75, 1, 120),
('DVD Rom', 25.40, 2, 56),
('CD Rom', 15.50, 2, 80),
('Tarjeta de red', 18.45, 3, 120);

select * from articulos a join fabricantes f on a.clave_fabricante=f.clave_fabricante;

-- 6. Realizar inserciones tabla articulos
insert into articulos(nombre,precio,clave_fabricante,existencias) values
('Altavoces',120.00,6,9);

-- usa esta sentencia para desactivar temporalmente el modo de actualizacion segura
set SQL_SAFE_UPDATES = 0;

-- 7. Realizar modificaciones
update articulos set nombre='HD extraible 250Gb' where nombre='Disco duro extraible 250 GB';
select * from articulos;

update articulos set existencias=existencias+5 where nombre = 'Memoria RAM';

update articulos set existencias=existencias-20 where clave_fabricante=3;

update articulos set precio=precio*0.9;

update articulos set precio=precio-10 where precio >= 200;

update articulo set clave_fabricante=1 where nombre = "DVD Rom";

update articulos set existencias = 0 where precio < 20;

-- 8. Realizar borrados 
delete from articulos where nombre = "CD ROM";
delete from articulos where existencias <10;
delete from articulos where clave_fabricante = 4;
delete from fabricantes where nombre = 'Seagate';

select * from fabricante;
select * from articulos;

-- borrar clave foranea y volver a crearla
alter table articulos drop foreign key fk_articulo_fab;
alter table articulos add constraint fk_articulo_fab
	foreign key(clave_fabricante) references fabricantes(clave_fabricante) on delete set null;