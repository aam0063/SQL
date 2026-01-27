-- 1. Obtener la alumna con mayor edad.
select * from persona where fecha_nacimiento = (select min(fecha_nacimiento) from persona where tipo = 'alumno' and sexo = 'M');

-- 2. Mostrar los datos de la asignatura cuyo id sea el mayor.
select * from asignatura where id = (select max(id) from asignatura);

-- 3. Mostrar el nombre de la asignatura y el nombre de su grado asociado.
select a.nombre, g.nombre from asignatura a join grado g on (a.id_grado = g.id); 

-- 4. Mostrar el nombre de todas las asignaturas, el nombre de su grado, y el nombre y apellidos del profesor que las imparte.
select a.nombre, g.nombre, per.nombre, per.apellido1, per.apellido2 from grado g 
join asignatura a on (g.id = a.id_grado)
natural join profesor p
join persona per on (p.id_profesor = per.id);

-- 5. Mostrar el nombre y apellidos de los profesores junto con el nombre de su departamento.
select per.nombre, per.apellido1, per.apellido2, d.nombre from persona per 
join profesor pro on (per.id = pro.id_profesor) 
join departamento d on (pro.id_departamento = d.id); 

-- 6. Obtener el número de asignaturas que imparte cada profesor, mostrando su nombre y apellidos.
select count(a.id) as num_asignaturas, pro.nombre, pro.apellido1, pro.apellido2 from asignatura a natural 
join profesor pro 
join persona p on (pro.id_profesor = p.id) GROUP BY p.id;

-- 7. Mostrar los datos de todos los grados, tengan o no asignaturas asociadas.
select * from grado g left join asignatura a on (g.id = a.id_grado);

-- 8. Mostrar los datos de todas las asignaturas, tengan o no profesor asignado.
select * from asignatura a natural left join profesor p;

-- 9. Datos de los profesores que imparten alguna asignatura
SELECT p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS num_asignaturas
FROM persona p
JOIN profesor pro ON p.id = pro.id_profesor
JOIN asignatura a ON a.id_profesor = pro.id_profesor
GROUP BY p.id;

-- 10. Cantidad de créditos que imparte cada profesor según su nif.
select pro.nombre, p.nif, sum(a.creditos) from asignatura a natural join
 profesor pro join
  p persona on (pro.id_profesor = p.id) group by p.nif;

-- 11. Mostrar datos de las asignaturas que tienen más créditos que todas las demás.
select * from asignatura where creditos = (select max(creditos) from asignatura);  

-- 12. Mostrar datos de las asignaturas con menos créditos
select * from asignatura where creditos = (select min(creditos) from asignatura);

-- 13. Muestra por cada grado la suma de sus créditos.


-- 14. Asignaturas que pertenecen al mismo grado que “Bases de Datos”

-- 15. Nombre de las asignaturas que no son las que menos créditos tienen

-- 16. Nombre de las asignaturas que no son las que más créditos tienen

-- Show the number of students enrolled in each course (curso_escolar), along 
-- with the course start and end year.

select count(al.id_alumno), cu.anyo_inicio, cu.anyo_fin from alumno_se_matricula_asignatura al 
join curso_escolar cu on (al.id_curso_escolar = cu.id) group by cu.id;

--Show how many subjects each professor teaches per semester (cuatrimestre), 
--along with the professor’s name and surnames.

select count(a.id) as asignaturas_por_semestre, pro.nombre, pro.apellido1, pro.apellido2 from persona p 
join profesor pro on (p.id = pro.id_profesor) natural join asignatura a GROUP BY a.cuatrimestre;