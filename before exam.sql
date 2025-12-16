-- a6
select count(distinct(ciudad)) from equipo;

-- a7
select equipo, max(salario), min(salario), max(salario) - min(salario) as salario_dif from jugador group by equipo;

-- a8 
select equipo, avg(salario) from jugador group by equipo
having salario_medio > 1000000;