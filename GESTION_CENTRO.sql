CREATE DATABASE Gestion_centro;
USE Gestion_centro;

CREATE TABLE PROFESORES(
	id_profesor INT PRIMARY KEY,
    nombre VARCHAR(50),
    sueldo DECIMAL(10,2),
    email VARCHAR(100)
);

CREATE TABLE ASIGNATURAS(
	id_asignatura INT PRIMARY KEY AUTO_INCREMENT,
    nombre_asig VARCHAR(60),
    horas_semanales INT,
    id_profesor INT,
    cupo_alumnos INT
);

-- RESTRICCION: AÑADIR CLAVE FORANEA A TABLA ASIGNATURAS
ALTER TABLE ASIGNATURAS 
ADD CONSTRAINT fk_asignaturas_profesores 
FOREIGN KEY (id_profesor) REFERENCES PROFESORES (id_profesor); -- 6 PROBLAM INTEGRIDAD: ON DELETE SET NULL;

-- INSERTAR DATOS
INSERT PROFESORES (id_profesor, nombre, sueldo, email) VALUES
(1, "Carlos Fernandez", 1000.00, "carlos@centro.es"),
(2, "Daniel Montañes", 1000.00, "daniel@centro,es"),
(3, "Celia Macias", 1000.00, "celia@centro.es");

SELECT * FROM PROFESORES;

INSERT ASIGNATURAS (nombre_asig, horas_semanales, id_profesor, cupo_alumnos) VALUES
("Bases de Datos", 6, 1, 30),
("Lenguaje de Marcas", 3, 1, 26),
("Sistemas", 5, 1, 24),
("Programacion", 8, 2, 30),
("Entornos de desarrollo", 3, 3, 22);

SELECT * FROM ASIGNATURAS;

-- MODIFICACION DE LOS DATOS CON UPDATE
SET SQL_SAFE_UPDATES = 0;

-- DESCUENTO DE 15% AL SUELDO Y COMPROBACION
UPDATE PROFESORES SET sueldo = sueldo * 0.85;
SELECT sueldo FROM PROFESORES;

-- AUMENTO 5 UNIDADES ALUMNOS TODAS LAS ASIGNATURAS DE CARLOS Y COMPROBACION
UPDATE ASIGNATURAS SET cupo_alumnos = cupo_alumnos + 5 WHERE id_profesor = (SELECT id_profesor FROM PROFESORES WHERE nombre = "Carlos Fernandez");
SELECT cupo_alumnos FROM ASIGNATURAS;

-- CAMBIAR NOMBRE SISTEMAS Y COMPROBACION
UPDATE ASIGNATURAS SET nombre_asig = "Sistemas Informaticos" WHERE id_asignatura = 3;
SELECT nombre_asig FROM ASIGNATURAS WHERE id_asignatura = 3;

-- CAMBIAR PROFESOR BASE DATOS Y COMPROBACION
UPDATE ASIGNATURAS SET id_profesor = (SELECT id_profesor FROM PROFESORES WHERE nombre = "Celia Macias") WHERE nombre_asig = "Bases de datos"; -- Llevo 20 minutos con esto pero funciona (creo)
SELECT nombre FROM PROFESORES WHERE id_profesor = (SELECT id_profesor FROM ASIGNATURAS WHERE nombre_asig = "Bases de datos");

-- BORRAR ENTORNOS Y COMPROBACION
DELETE FROM ASIGNATURAS WHERE nombre_asig = "Entornos de desarrollo";
SELECT nombre_asig FROM ASIGNATURAS;


-- 5 PRUEBAS DE INTEGRIDAD
 -- 1.
 INSERT ASIGNATURAS (nombre_asig, horas_semanales, id_profesor, cupo_alumnos) VALUES
 ("EducacionFisica", 3, 4, 34);
 
 -- 2.
DELETE FROM PROFESORES WHERE nombre = "Daniel Montañes";
 SELECT nombre FROM PROFESORES;
 
 -- 3.
UPDATE PROFESORES SET id_profesor = 10 WHERE nombre = "Daniel Fernandez";
 SELECT * FROM ASIGNATURAS;

 
 -- 7 COMPROBACION FINAL
-- Al borrar a el profesor se han colocado los campos como "NULL" tras el cambio de la foreign key
SELECT * from PROFESORES;

-- ID CARLOS A 10: 
SELECT * FROM ASIGNATURAS WHERE id_profesor = 10;
 
 SELECT * FROM PROFESORES;
 
 SELECT * FROM ASIGNATURAS;
 



