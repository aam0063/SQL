drop database if exists biblioteca;
create database biblioteca;
use biblioteca;

drop table if exists autor;
drop table if exists libro;

create table autor (
	cod_autor int primary key,
    nombre varchar(50) not null
);

create table libro (
	isbn varchar(10) primary key,
	titulo varchar(100) not null,
    anio date not null,
    autor int,
    foreign key (autor) references autor(cod_autor_)
);

create table socio (
	cod_socio int primary key,
    nombre varchar(15),
    apellidos varchar(20),
    telefono int(9)
);

create table prestamo (
	cod_prestamo int primary key auto_increment,
    fecha_prestamo date not null,
    fecha_devolucion date,
    libro varchar(10),
    foreign key (libro) references libro(isbn)
);

alter table socio add direccion varchar(50);
alter table libro modify  titutlo varchar(150) not null;
alter table socio modify telefono varchar(9) not null;
alter table socio drop telefono;
drop table socio;
truncate table socio;

alter table prestamo add socio int;
alter table prestamo add foreign key (socio) references socio(cod_socio) on update cascade;
    