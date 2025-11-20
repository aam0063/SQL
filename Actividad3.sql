DROP DATABASE IF exists alumnos;
create database alumnos;
use alumnos;

CREATE TABLE alumnos (
	email varchar(100) PRIMARY KEY,
    DNI VARCHAR(9) not null,
    nombre VARCHAR(50) not null,
    direccion VARCHAR(100) not null,
    TFNO VARCHAR (12) not null,
    ESPAÑOL BOOLEAN not null,
    cod_aula int,
    foreign key(cod_aula) references aula(cod)
);

CREATE TABLE curso (
	nombre int PRIMARY KEY auto_increment,
    URL VARCHAR(100),
    nombre VARCHAR(20),
    LIBRO VARCHAR (9),
);

CREATE TABLE tutor (
	DNI int PRIMARY KEY auto_increment,
    email VARCHAR(20),
    nombre VARCHAR(20),
);

CREATE TABLE aula (
	COD int PRIMARY KEY auto_increment,
    nombre VARCHAR(50) not null,
    direccion VARCHAR(20),
);

CREATE TABLE administrador_aula (
	DNI VARCHAR(9) PRIMARY KEY,
    email VARCHAR(100) not null,
    nombre VARCHAR(50) not null,
);

CREATE TABLE administrador_administra_aula(
    dni_administrador varchar(9),
    cod_aula int,
    primary key (dni_administrador, cod_aula),
    foreign key (dni_administrador) references administrador_aula(dni),
    foreign key (cod_aula) references aula (cod)
);

CREATE TABLE curso(
    nombre varchar(100) primary key,
    libro varchar(50) null,
    url varchar(100) not null,
);

create table alumno_matricula_curso(
    email_alumno varchar(100),
    nombre_curso varchar(100),
    fecha_inicio date not null,
    fecha_fin date null,
    primary key(email_alumno, nombre_curso)
    foreign key (email_alumno) references a ALUMNO(email),
    foreign key (nombre_curso) references CURSO(nombre)
);

create table tutor (
    dni varchar(9) primary key,
    nombre varchar(50) not null,
    email varchar(100) not null,
);

create table tutor_tutoriza_curso(
    dni_tutor varchar (9),
    nombre_curso varchar(100),
    primary key(dni_tutor, nombre_curso);
    foreign key (dni_tutor) references tutor(dni),
    foreign key(nombre_curso) references curso(nombre),
);

create table tutor_coordina_tutor (
    dni_tutor varchar(9),
    dni_coordinador varchar(9),
    primary key(dni_tutor, dni_coordinador),
    foreign key(dni_tutor) references tutor(dni),
    foreign key (dni_coordinador) references tutor(dni)
)