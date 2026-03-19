CREATE DATABASE empresa;
USE empresa;

CREATE TABLE DEPARTAMENTOS(
id_departamento INT,
nombre VARCHAR(40),
ciudad VARCHAR(40)
);

CREATE TABLE EMPLEADOS(
id_empleado INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50),
salario DECIMAL(8,2),
id_departamento INT
);

-- add primary keys
ALTER TABLE DEPARTAMENTOS ADD PRIMARY KEY (id_departamento);

ALTER TABLE EMPLEADOS ADD PRIMARY KEY (id_empleado);

-- add foreign key
ALTER TABLE EMPLEADOS
ADD CONSTRAINT fk_empleados_departamentos
FOREIGN KEY (id_departamento) REFERENCES DEPARTAMENTOS (id_departamento);

-- check all tables n data
SHOW TABLES;
DESCRIBE DEPARTAMENTOS;
DESCRIBE EMPLEADOS;

-- insert data

INSERT INTO DEPARTAMENTOS (id_departamento, nombre, ciudad) VALUES
(1, 'Ventas', 'Madrid'),
(2, 'Informatica', 'Sevilla'),
(3, 'Recursos Humanos', 'Valencia'),
(4, 'Administracion', 'Bilbao');

INSERT INTO EMPLEADOS (nombre, salario, id_departamento) VALUES
('Ana Gomez', 1850.00, 1),
('Luis Perez', 2100.00, 2),
('Marta Ruiz', 1700.00, 4),
('Carlos Sanz', 2200.00, 2),
('Elena Martín', 1950.00, 3),
('Pablo Díaz', 1800.00, 1),
('Laura Gil', 1750.00, 4);

-- insert new specific stuff
INSERT INTO EMPLEADOS (nombre, salario, id_departamento) VALUES ('Sonia Lopez', 2150.00, 2);

INSERT INTO EMPLEADOS (nombre, salario, id_departamento) VALUES ('Mario Torres', 1780.00, 1);

INSERT INTO EMPLEADOS (nombre, salario, id_departamento) VALUES ('Nuria Vega', 1900.00, 8);

-- change stuff
UPDATE EMPLEADOS SET salario = 1900.00 WHERE nombre = 'Ana Gomez';

UPDATE EMPLEADOS SET salario = salario + 100 WHERE id_departamento = 2;

UPDATE DEPARTAMENTOS SET ciudad = 'Malaga' WHERE id_departamento = 4;

UPDATE EMPLEADOS SET id_departamento = 3 WHERE nombre = 'Marta Ruiz';

UPDATE EMPLEADOS SET salario = salario + 50 WHERE id_departamento = (SELECT id_departamento FROM DEPARTAMENTOS WHERE ciudad = 'Madrid');

UPDATE EMPLEADOS SET salario = salario - 100 WHERE id_departamento = (SELECT id_departamento FROM DEPARTAMENTOS WHERE nombre = 'Ventas');

UPDATE EMPLEADOS SET id_departamento = 9 WHERE nombre = 'Laura Gil';

-- delete stuff
DELETE FROM EMPLEADOS WHERE nombre = 'Pablo Diaz';

DELETE FROM EMPLEADOS WHERE salario < 1800;

DELETE FROM DEPARTAMENTOS WHERE nombre = 'Ventas';

DELETE FROM DEPARTAMENTOS WHERE nombre = 'Informatica';

DELETE FROM EMPLEADOS WHERE id_departamento = (SELECT id_departamento FROM DEPARTAMENTOS WHERE nombre = 'Recursos Humanos');

DELETE FROM DEPARTAMENTOS WHERE nombre = 'Recursos Humanos';

DELETE FROM EMPLEADOS WHERE id_departamento = (SELECT id_departamento FROM DEPARTAMENTOS WHERE ciudad = 'Malaga');

DELETE FROM DEPARTAMENTOS WHERE nombre = 'Administracion';

-- try stuff out

-- insert a worker into a non existant departament
INSERT INTO EMPLEADOS (nombre, salario, id_departamento) VALUES ('Michael', 2, 8);

-- modify an existing employee to asign him a departament that doesn't exist
UPDATE EMPLEADOS SET id_departamento = 8 WHERE nombre = 'Pablo Diaz';

-- delete a department that still got asociated stuff
DELETE FROM DEPARTAMENTOS WHERE nombre = 'Informatica';

-- last queries to check everything out
SELECT * FROM DEPARTAMENTOS;

SELECT * FROM EMPLEADOS;

SELECT e.nombre, d.nombre FROM EMPLEADOS e JOIN DEPARTAMENTOS d ON e.id_departamento = d.id_departamento;

SELECT nombre FROM DEPARTAMENTOS WHERE id_departamento NOT IN (SELECT id_departamento FROM EMPLEADOS);