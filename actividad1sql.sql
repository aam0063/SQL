DROP DATABASE IF exists proveedores;
create database proveedores;
use proveedores;


CREATE TABLE proveedor (
	codigo int PRIMARY KEY auto_increment,
    direccion VARCHAR(150),
    ciudad VARCHAR(20),
    provincia VARCHAR(20)
);

CREATE TABLE categoria (
	codigo int primary key auto_increment,
    nombre varchar(100) not null
);

create table pieza(
	codigo int primary key auto_increment,
    nombre varchar(100) not null,
	color varchar(50),
    precio decimal(10,2), -- numero decimal
    categoria int,
    FOREIGN KEY (categoria) REFERENCES CATEGORIA(codigo)
);

create table proveedor_suministra_pieza (
	id_proveedor int,
    id_pieza int,
    cantidad int not null,
    fecha date not null,
    primary key(id_proveedor, id_pieza, fecha),
    foreign key(id_proveedor) references PROVEEDOR(codigo),
    foreign key(id_pieza) references PIEZA(codigo)
);
