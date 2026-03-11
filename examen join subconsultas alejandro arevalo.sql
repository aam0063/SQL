use universidad;

-- Alejandro Arevalo Merlo

-- 1. 
select nif, fecha_nacimiento from persona where fecha_nacimiento < 
(select fecha_nacimiento from persona where nif = '79503962T');

-- 2.
select d.nombre, count(pro.id_profesor) as N_profesores from profesor pro join
departamento d on (pro.id_departamento = d.id) group by d.nombre;

-- 3.
select nombre from asignatura where curso = (select max(curso) from asignatura);

-- 4.
select cu.id, cu.anyo_inicio, cu.anyo_fin, count(al.id_alumno)  as N_matriculas from alumno_se_matricula_asignatura al
right join curso_escolar cu on (al.id_curso_escolar = cu.id) group by cu.id;

-- 5.
select a.nombre, per.nombre, per.apellido1, per.apellido2 from alumno_se_matricula_asignatura al
join persona per on (al.id_alumno = per.id) join asignatura a on (al.id_asignatura = a.id);

-- 6.
select g.nombre, count(a.id) as N_asignaturas from asignatura a join 
grado g on (a.id_grado = g.id) group by g.nombre;

-- 7.
select g.nombre, sum(a.creditos) as suma_creditos from grado g left join
asignatura a on (g.id = a.id_grado) group by g.nombre;

-- 8.
select pro.id_departamento, count(per.sexo) as mujeres from profesor pro join
persona per on (pro.id_profesor = per.id) where sexo = 'M' group by pro.id_profesor;

-- 9.
select per.nombre, per.apellido1, per.apellido2, sum(a.creditos) as suma_creditos
from alumno_se_matricula_asignatura al join asignatura a on (al.id_asignatura = a.id) join
persona per on (al.id_alumno = per.id) group by per.id;

-- 10.
select id, anyo_inicio, anyo_fin from curso_escolar where anyo_inicio = 
(select max(anyo_inicio) from curso_escolar);

