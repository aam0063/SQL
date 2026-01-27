use universidad;

-- 1. Obtener la alumna con mayor edad.
select * from persona where fecha_nacimiento = (
select min(fecha_nacimiento) from persona where sexo='M' and tipo='alumno');

-- 2. Mostrar los datos de la asignatura cuyo id sea el mayor.
select * from asignatura where id = (select max(id) from asignatura);

-- 3. Mostrar el nombre de la asignatura y el nombre de su grado asociado.
select a.nombre, g.nombre from asignatura a join grado g on (a.id_grado = g.id);
select * from asignatura;
select * from grado;
select nombre from asignatura;

-- 4. Mostrar el nombre de todas las asignaturas, el nombre de su grado, y el nombre y apellidos del profesor asociado (incluyendo asignaturas sin profesor si las hubiera).
select * from persona;
select * from profesor;
select * from asignatura;
select * from grado;
select a.nombre, g.nombre, pe.nombre, pe.apellido1, pe.apellido2 from asignatura a left join
 profesor pro on (a.id_profesor = pro.id_profesor) join
 persona pe on (pro.id_profesor = pe.id) join grado g on(g.id = a.id_grado);

select p.nombre, a.nombre, g.nombre from persona p join 
profesor pr on (pr.id_profesor=p.id) join 
asignatura a on(pr.id_profesor=a.id_profesor) join 
grado g on (a.id_grado=g.id);

-- 5. Mostrar el nombre y apellidos de los profesores y el nombre de su departamento.
select * from profesor;
select * from persona;
select * from departamento;
select * from ;
select pro.nombre, pro.apellido1, pro.apellido2, d.nombre from pro profesor join d departamento on (pro.id_departamento = d.id) join p persona on (d.id_profesor = p.id);



select * from persona p join profesor pr on (pr.id_profesor = p.id) join departamentos d on (pr.id_profesor = p.id) join departamento d on (pr.id_departamento = d.id);

-- 6. Obtener las alumnas que no sean las de mayor edad
select * from persona;

-- select * from persona where tipo = alumno and sexo = 'M' = (select

-- 7. Saca todos los datos de los grados tenga o no asignadas
select * from asignatura a join grado g on (g.id = a.id_grado);
select * from asignatura a right join grado g on (g.id = a.id_grado);
select * from grado g left join asignatura a on (g.id = a.id_grado);

-- 8. Saca los datos de las asignaturas y el nombre del profesor tengan o no 
select * from asignatura a
	left join profesor p on(a.id_profesor=p.id_profesor);
    
-- 9. Datos de los profesores que imparten alguna asignatura
select pe.nombre, pe.apellido1, pe.apellido2
from persona pe
join profesor pr on pe.id = pr.id_profesor
join asignatura a on pr.id_profesor = a.id_profesor
group by pe.nombre, pe.apeliido1, pe.apellido2;

-- 9.1 Datos de los profesores que imparten alguna asignatura
select * from persona where id IN (select id_profesor from asignatura);

-- 10. Cantidad de creditos que imparte cada profesor segun su nif
select p.nif, sum(creditos) from persona p join profesor pr on(p.id = pr.id_profesor)
join asignatura a on(pr.id_profesor = a.id_profesor)
group by p.nif;

-- 11. Mostrar datos de las asignaturas que tienen mas creditos que todas las demas
select * from asignaturas where creditos = (select max(creditos) from asignatura);

-- 12. Mostrar datos de las asignaturas con menos creditos
select * from asignaturas where creditos = (select min(creditos) from asignatura);

-- 13. Muestra por cada grado la suma de sus creditos
select * from grado;
select g.nombre, sum(creditos) as total_creditos from asignatura a join grado g on (g.id = a.id_grado) group by g.nombre;

-- 14. Asignaturas que pertenecen al mismo grado que "Bases de datos"
select * from asignatura where id_grado = 
(select id_grado from asignatura where nombre = 'Base de datos');

-- 15. Nombre de las asignaturas que no son las que menos creditos tienen
select nombre from asignatura where creditos not in (select min(creditos) from asignatura);

select * from asignatura where creditos > any (select creditos from asignatura);

-- 16. Nombre de las asignaturas que no son las que mas creditos tienen
select nombre from asignatura where creditos not in (select max(creditos) from asignatura);