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