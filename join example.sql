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