DROP DATABASE IF exists proveedores;
create database proveedores;
use proveedores;

CREATE TABLE proveedor (
	NIF int PRIMARY KEY auto_increment,
    direccion VARCHAR(150),
    nombre VARCHAR(20)
);

CREATE TABLE producto (
	codigo int PRIMARY KEY auto_increment,
    precio_unit VARCHAR(150),
    nombre VARCHAR(20)
);

CREATE TABLE clientes (
	DNI int PRIMARY KEY auto_increment,
    apellidos VARCHAR(150),
    nombre VARCHAR(20),
    direccion VARCHAR(50),
    fecha_nac VARCHAR(10)
);

create table proveedor_suministra_producto (
	NIF VARCHAR(9),
    id_producto int,
    cantidad int not null,
    primary key(NIF, codigo),
    foreign key(NIF) references PROVEEDOR(NIF),
    foreign key(codigo) references PRODUCTO(codigo)
);

create table cliente_compra_producto (
	DNI VARCHAR(9),
    codigo int,
    cantidad int not null,
    primary key(DNI, codigo),
    foreign key(DNI) references CLIENTES(DNBI),
    foreign key(codigo) references PRODUCTO(codigo)
);