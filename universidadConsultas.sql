use universidad;

-- 1. Obtener la alumna con mayor edad.
select * from persona where fecha_nacimiento = (
select min(fecha_nacimiento) from persona where sexo='M' and tipo='alumno');
-- 2. Mostrar los datos de la asignatura cuyo id sea el mayor.
select * from asignatura where id = (select max(id) from asignatura);

-- 3. Mostrar el nombre de la asignatura y el nombre de su grado asociado.
select a.nombre, g.nombre from asignatura a join grado g on (g.id = a.id_grado);

-- 4. Mostrar el nombre de todas las asignaturas, el nombre de su grado, y el nombre y apellidos del profesor asociado (incluyendo asignaturas sin profesor si las hubiera).
select * from persona;
select * from profesor;
select * from asignatura;
select * from grado;

select p.nombre, a.nombre, g.nombre from persona p join 
profesor pr on (pr.id_profesor=p.id) join 
asignatura a on(pr.id_profesor=a.id_profesor) join 
grado g on (a.id_grado=g.id);

-- 5. Mostrar el nombre y apellidos de los profesores y el nombre de su departamento.
select * from persona p join profesor pr on (pr.id_profesor = p.id) join departamentos d on (pr.id_profesor = p.id) join departamento d on (pr.id_departamento = d.id);

-- 6. Obtener las alumnas que no sean las de mayor edad
select * from persona;

select * from persona where tipo = alumno and sexo = 'M' = (select;

-- 7. Saca todos los datos de los grados tenga o no asignadas
select * from asignatura a join grado g on (g.id = a.id_grado);
select * from asignatura a right join grado g on (g.id = a.id_grado);
select * from grado g left join asignatura a on (g.id = a.id_grado);

-- 8. Saca los datos de las asignaturas y el nombre del profesor tengan o no 
select * from asignatura a
	left join profesor p on(a.id_profesor=p.id_profesor);