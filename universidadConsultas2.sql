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
select g.nombre, sum(a.creditos) as suma_creditos from grado g join
 asignatura a on (g.id = a.id_grado) group by g.nombre;

-- 14. Asignaturas que pertenecen al mismo grado que “Bases de Datos”
SELECT nombre
FROM asignatura 
WHERE id_grado = (
    SELECT id_grado
    FROM asignatura
    WHERE nombre = 'Bases de Datos'
);

-- 15. Nombre de las asignaturas que no son las que menos créditos tienen
select nombre from asignatura where creditos > (select min(creditos) from asignatura); 
select nombre from asignatura where creditos not in (select min(creditos) from asignatura);

-- 16. Nombre de las asignaturas que no son las que más créditos tienen
select nombre from asignatura where creditos < (select max(creditos) from asignatura);

-- Show the number of students enrolled in each course (curso_escolar), along 
-- with the course start and end year.

select count(al.id_alumno), cu.anyo_inicio, cu.anyo_fin from alumno_se_matricula_asignatura al 
join curso_escolar cu on (al.id_curso_escolar = cu.id) group by cu.id;

--Show how many subjects each professor teaches per semester (cuatrimestre), 
--along with the professor’s name and surnames.

select count(a.id) as asignaturas_por_semestre, pro.nombre, pro.apellido1, pro.apellido2 from persona p 
join profesor pro on (p.id = pro.id_profesor) natural join asignatura a GROUP BY a.cuatrimestre;

--Show the number of students enrolled in each subject, including subjects with no students
SELECT a.nombre, COUNT(al.id_alumno) AS num_alumnos
FROM asignatura a
LEFT JOIN alumno_se_matricula_asignatura al ON a.id = al.id_asignatura
GROUP BY a.nombre;

-- 1. Mostrar el nombre de las asignaturas y el nombre del grado al que pertenecen.
    select a.nombre, g.nombre from asignatura a join grado g on (a.id_grado = g.id);

-- 2. Mostrar el nombre y apellidos de los profesores junto con el nombre de su departamento.
    select per.nombre, per.apellido1, per.apellido2, d.nombre from profesor pro join
    persona per on (per.id = pro.id_profesor) join departamento d on (pro.id_departamento = d.id);

-- 3. Mostrar las asignaturas que tienen profesor asignado.
    select a.nombre from profesor pro natural join
    asignatura a;

-- 4. Mostrar los alumnos que están matriculados en alguna asignatura.
    select per.nombre from alumno_se_matricula_asignatura al join 
    persona per on (al.id_alumno = per.id);

-- 5. Mostrar las asignaturas que pertenecen al mismo grado que “Bases de Datos”.
    select nombre from asignatura where id_grado = 
    (select id_grado from asignatura where nombre = 'Bases de datos');

-- 6. Mostrar los profesores que imparten al menos una asignatura.
    select nombre from persona where id in
    (select id_profesor from asignatura); 

-- 7. Mostrar los grados que tienen asignaturas asociadas.
    select g.nombre from grado join asignatura a on (g.id = a.id_grado);

-- 8. Mostrar las asignaturas que tienen más créditos que la media.
    select nombre from asignatura where creditos >
    (select avg(creditos) from asignatura);

-- 9. Mostrar cuántas asignaturas imparte cada profesor.
    select per.nombre, pro.id_profesor, count(a.id) from profesor pro natural join
    asignatura a join persona per on (pro.id_profesor = per.id) group by pro.id_profesor;

-- 10. Mostrar los alumnos que se han matriculado en más de una asignatura.
    select per.nombre from alumno_se_matricula_asignatura al join
     persona per on (al.id_alumno = per.id)
      group by al.id_alumno having count(al.id_asignatura) > 1;

-- 1. Listar los nombres de los alumnos que no están matriculados en ninguna asignatura
    SELECT nombre 
    FROM persona 
    WHERE tipo = 'alumno' 
  AND id NOT IN (
    SELECT id_alumno 
    FROM alumno_se_matricula_asignatura
  );

-- 2. Mostrar los profesores que no tienen ninguna asignatura asignada
    select nombre from persona where id not in 
    (select id_profesor from asignatura); 

-- 3. Mostrar los grados que no tienen asignaturas de más de 6 créditos
    select nombre from grado where id not in
    (select id_grado from asignatura where creditos > 6); 

-- 4. Listar los alumnos que están matriculados en todas las asignaturas del primer curso
    SELECT nombre 
    FROM persona 
    WHERE tipo = 'alumno' 
    AND id NOT IN (
    SELECT id_alumno 
    FROM alumno_se_matricula_asignatura 
    WHERE id_asignatura NOT IN (
      SELECT id 
      FROM asignatura 
      WHERE curso = 1
    )
  );


-- 5. Mostrar los profesores que imparten asignaturas en más de un cuatrimestre

    SELECT nombre 
    FROM persona 
    WHERE tipo = 'profesor' 
    AND id IN (
    SELECT id_profesor 
    FROM asignatura 
    GROUP BY id_profesor 
    HAVING COUNT(DISTINCT cuatrimestre) > 1
  );