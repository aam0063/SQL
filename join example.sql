use profesores;

select * from profesores;
select * from coordinadores;
select * from asignaturas;
select * from imparte;
select * from prepara;

-- 1. Muestra los datos de la asignatura y del dni del profesor que la imparte
select * from asignaturas a join imparte i on a.codigo = i.asignatura;

select i.dni, a.descripcion from asignaturas a join imparte i on a.codigo = i.asignatura;

select * from asignaturas a, imparte i where a.codigo = i.asignatura;

-- 2. Muestra los datos de los profesores que imparten alguna asignatura
select * from profesores p join imparte i on p.dni = i.dni;

-- 3. Lo mismo que el anterior pero con natural join
select * from profesores natural join imparte;

-- Producto cartesiano (CROSS JOIN, Une dos tablas sin relacionarlas)
select * from profesores, asignaturas;
select * from profesores cross join asignaturas;

-- 4. Suma de creditos que imparte cada profesor segun su dni
select dni,sum(creditos) from asignaturas a, imparte i where a.codigo = i.asignatura group by dni;

-- 5. Mostrar el nombre de los profesores y cuantas asignaturas imparten cada uno
select nombre, count(*) from profesores p join imparte i on p.dni = i.dni group by dni;

-- 6. Mostrar el nombre del profesor y la descripcion de la asignatura que imparte
select * from profesores;
select * from asignaturas;
select * from profesores p join imparte i on p.dni = i.dni join asignaturas a on a.codigo = i.asignatura;

-- Y mostrar el nombre del profesor y la descripcion de la asignatura que imparte donde la descripcion tenga "bases"
select * from profesores;
select * from asignaturas;
select * from profesores p join imparte i on p.dni = i.dni join asignaturas a on a.codigo = i.asignatura where descripcion like '%BASES%';

-- 7. DNI y nombre del coordinador y el nombre de la asignatura que coordina
select * from coordinadores;
select * from asignaturas;
select dni, nombre, descripcion from coordinadores c join asignatura a on (c.asignatura = a.codigo);

-- 8. DNI del profesor y la suma de los creditos que prepara
select dni, sum(creditos) from prepara p join asignaturas a on a.codigo = p.asignatura group by dni;

-- 9. LEFT JOIN. Datos de todos los profesores, y si imparte alguna asignatura, los datos de ella
select * from profesores p LEFT JOIN imparte i ON (p.dni=i.dni);
select * from imparte i RIGHT JOIN profesores p ON (p.dni=i.dni);

-- 10. RIGHT JOIN. Datos de todos los profesores y si prepara alguna asignatura los datos de ella
select * from prepara pr right join profesores p on (pr.dni=p.dni);
select * from prepara pr left join profesores p on (pr.dni=p.dni);

-- SUBCONSULTAS

-- 1.Mostrar todos los datos de las asignaturas que tienen mas creditos que la asignatura PC
select * from asignaturas;
select * from asignaturas where creditos > (select creditos from asignaturas where codigo = "PC");

-- 2.Mostrar la descripcion de las asignaturas que tienen mas creditos que todas las demas
select * from asignaturas;
select descripcion from asignaturas where creditos = (select max(creditos) from asignaturas);
select descripcion from asignaturas where creditos >= ALL (select creditos from asignaturas);

-- 3. Nombre de las asignaturas que no son las que menos creditos tienen
select * from asignaturas where creditos > (select min(creditos) from asignaturas);
select * from asignaturas where creditos > any (select creditos from asignaturas);

-- 4. Datos de las asignaturas que se imparten
select * from asignaturas where codigo IN (select asignatura from imparte);
select * from asignaturas a join imparte i on (a.codigo=i.asignatura);

-- 5. Datos de las asignaturas que NO se imparten
select * from asignaturas where codigo NOT IN (select asignatura from imparte);

-- 6. Datos de los profesores que imparten alguna asignatura
select * from profesores where dni in(select dni from imparte);
select * from profesores p join imparte i on(p.dni=dni);
select * from profesores natural join imparte;

-- 7. Datos de los profesores que NO imparten ninguna asignatura
select * from profesores where dni not in (select dni from imparte);

-- 8. Datos de los profesores que no preparan ninguna asignatura
select * from profesores where dni not in (select dni from prepara);
select dni from prepara;

-- 9. Datos de los profesores que preparan alguna asignatura
select * from profesores where dni in (select dni from prepara);	

-- 10. Datos de los profesores que no preparan ni imparten ninguna asignatura
select * from profesores where dni not in (select dni from prepara)
	and dni not in (select dni from imparte);
    
-- 11. Tenemos profesores?
select exists (select * from profesores) as respuesta;

















