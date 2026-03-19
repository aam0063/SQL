-- Crear usuario para que se conecte desde el mismo equipo de la BBDD
create user 'usuario_prueba'@'localhost' identified by '123456';

-- Crear usuario para que se conecte desde cualquier parte
create user 'usuario_prueba'@'%' identified by '123456';

-- Crear usuario para que se conecte desde una direccion
create user 'usuario_prueba'@'192.168.20.105' identified by '123456';


-- Permisos o privilegios
-- SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER, INDEX


-- COMANDOS DE CONTROL 
-- GRANT - Asigna permisos
-- REVOKE - Elimina permisos

-- VISTA - Es una consulta almacenada uqe se upede usar como si fuera una tabla
-- Simplifica consultas, Oculta datos sensibles, Mejora la seguridad

-- Indice - es una estructura que permite acceder a datos mas rapido
-- Sin indice - recorre toda la tabla
-- Con indice - Se accede directamente al dato

-- EJERCICIO 1: CREACION DE INDICE
-- 1. Crear un indice sobre la columna nombre_asig de la tabla asignaturas
use gestion_centro;
create index idx_nombre_asign ON asignaturas(nombre_asig);

-- 2. Ejecutar la consulta
select * from asignaturas where nombre_asig = 'Sistemas Informaticos';

-- 3. Que diferencia hay con y sin indice?


-- EJERCICIO 2 - CREACION DE VISTA
-- 1. Crea una vista que muestre nombre de asignatura, nombre de profesor
create view vista_asignaturas_profesores as
select a.nombre_asig, p.nombre from profesores p join asignaturas a on p.id_profesor = a.id_profesor;

-- 2. Consulta la vista 
select * from vista_asignaturas_profesores;

-- 3. Crear una vista que solo muestre todos los datos menos el sueldo del profesor como seguridad
create view vista_profesores_seguridad as
select id_profesor, nombre, email from profesores;

-- Consultar vista 
select * from vista_profesores_seguridad;

-- EJERCICIO 3: CREACION DE USUARIOS
-- Crear el usuario carlos_user solo desde el mismo equipo
-- Crear el ususario daniel_user desde cualquier parte
-- Crear el usuario celia_user desde el mismo equipo
create user 'carlos_user'@'localhost' identified by '123456';
create user 'daniel_user'@'%' identified by '123456';
create user 'celia_user'@'localhost' identified by '123456';

-- EJERCICIO 4: ASIGNACION DE PERMISOS
-- Asignar permisos a Carlos solo SELET en toda la base de datos
GRANT select on gestion_centro.* to 'carlos_user'@'localhost';
-- a Daniel SELECT, INSERT a la tabla ASIGNATURAS
grant select, insert on gestion_centro.asignaturas to 'daniel_user'@'localhost';
-- a Celia SELECT, UPDATE a la tabla ASIGNATURAS
grant select, update on gestion_centro.asignaturas to 'celia_user'@'localhost';

-- EJERCICIO 6: COMPROBACION DE PERMISOS
-- Probar con Carlos
-- Probar Daniel
-- Probar Celia

select User, Host from mysql.user;

-- EJERCICIO 7: SEGURIDAD CON VISTAS
-- Eliminar todos los permisos de Carlos
revoke select on gestion_centro.* from 'carlos_user'@'localhost';
-- dar acceso solo a la vista en el ejercicio 2 (seguridad)
grant select on gestion_centro.vista_profesores_seguridad to 'carlos_user'@'localhost';

flush privileges;

-- EJERCICIO 7: REVOCAR PERMISOS
-- Quitar a Daniel el permiso INSERT
-- Comprobar que ya no puede insertar
