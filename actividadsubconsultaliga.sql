use liga;

select * from equipo;
select * from jugador;
select * from partido;

-- 1. Datos del jugador mas alto de la liga
select * from jugador where altura = (select max(altura) from jugador);
select * from jugador where altura >= ALL (select altura from jugador);

-- 2. Datos de todos los jugadores que pertenecen al Caja Laboral
select j.* from jugador j join equipo e on j.equipo=e.id_equipo where e.nombre = "Caja Laboral";

-- 3. Suma de las alturas de los jugadores que sean del CAI Zaragoza o del real madrid
select * from jugador;
select * from equipo;
select sum(altura) from jugador j join equipo e on j.equipo=e.id_equipo where e.nombre = "CAI Zaragoza" or e.nombre = "Real Madrid";

-- 4. Datos de los jugarores que miden mas que todos los jugadores del Caja Laboral
select * from jugador;
select * from equipo;
select j.* from jugador j join equipo e on j.equipo = e.id_equipo where j.altura > (select j.altura from jugador j join equipo e on j.equipo = e.id_equipo where e.nombre =
"Caja Laboral" order by j.altura desc limit 1);

select max(altura) from jugador j join equipo e on j.equipo=e.id_equipo where e.nombre="Caja Laboral";

-- 5. Datos de los jugadores mejor pagado y peor pagado de la liga
select * from jugador;
select * from equipo;
select * from jugador where salario = (select max(salario) from jugador) or salario = (select min(salario) from jugador);

-- 6. Datos del jugador más antiguo, es decir, el que lleva más tiempo dado de alta en un equipo.
select * from jugador where fecha_alta = (select min(fecha_alta) from jugador);

-- 7. Datos de los equipos que tienen más de tres jugadores registrados.
select * from jugador;
select * from equipo;
select e.* from equipo e join jugador j on j.equipo=e.id_equipo where jugador > 3;













