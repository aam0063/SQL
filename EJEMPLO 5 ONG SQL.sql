drop database if exists ong;
create database ong;
use ong;

create table asociation (
	CIF varchar(9) primary key,
    denominacion varchar(20) not null,
    direccion varchar(50),
    provincia varchar(15),
    tipo ENUM('Ecologista', 'Integración, Desarrollo'),
    utilitdadpublica ENUM('SI', 'NO') default 'SI'    
);


create table socio (
	DNI char(9) primary key,
    nombre varchar(30),
    direccion varchar(50),
    provincia varchar(30),
    fecha_alta DATE NOT NULL,
    cuota_mensual DECIMAL(7.5) not null CHECK(cuota_mensual >= 0),
    aportacion_anual DECIMAL(7,5) check (aportacion_anual >=0),
    CIF varchar(9),
    foreign key (CIF) references asociacion(CIF) on delete set null on update cascade
);

create table trabajador(
DNI char(9) primary key,
nombre varchar(30) not null,
fingreso date,
tipo ENUM("Asalariado","Voluntario"),
irpf int check (irpf between 0 and 100),
pagos decimal(9,2) check(pagos >=0),
profesion varchar(30),
horas int check(horas >= 0 and horas <=300),
edad int check(edad between 18 and 100)
);

create table proyecto(
	id int auto_increment primary key,
    pais varchar(20),
    zona varchar(30),
    objetivo varchar(100)
);

create table trabaja (
	dni char(9),
    id_proyecto int,
    primary key (dni, id_proyecto),
    foreign key (dni) references trabajador(dni),
    foreign key (id_proyecto) references proyecto(id)
);

alter table proyecto add column nro_beneficiario int not null check(nro_beneficiario >=0);
alter table proyecto add foreign key (cif) references asociacion(CIF) on delete restrict on update cascade;