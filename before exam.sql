-- a6
select count(distinct(ciudad)) from equipo;

-- a7
select equipo, max(salario), min(salario), max(salario) - min(salario) as salario_dif from jugador group by equipo;

-- a8 
select equipo, avg(salario) from jugador group by equipo
having salario_medio > 1000000;

-- 9 numero de jugadores por equipo
select equipo, count(*) as numero_jugadores
from jugadores group by equipo;

-- 10 altura media por equipo
select equipo, avg(altura) as altura_media from jugador group by equipo;

-- 11 salario total por equipo
select equipo, sum(salario) from jugador group by equipo;

-- 12 Equipos con una altura media superior a 2 metros
select equipos avg(altura) as altura_superior from jugador group by equipo having altura_superior >2;

-- 13 
select equipo, max(altura) as altura_maxima from jugador group by equipo;