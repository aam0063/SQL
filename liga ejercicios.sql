use liga;

-- 1. Datos del jugador más alto de la liga.


SELECT j.*
FROM jugador j
JOIN equipo e ON j.equipo = e.id_equipo
WHERE j.altura = (SELECT MAX(altura) FROM jugador);

SELECT j.*
FROM jugador j
JOIN equipo e ON j.equipo = e.id_equipo
WHERE e.nombre = 'Caja Laboral';

SELECT SUM(j.altura) AS suma_alturas
FROM jugador j
JOIN equipo e ON j.equipo = e.id_equipo
WHERE e.nombre IN ('CAI Zaragoza', 'Real Madrid');

SELECT j.*
FROM jugador j
JOIN equipo e ON j.equipo = e.id_equipo
WHERE j.altura >
    (SELECT MAX(j2.altura)
     FROM jugador j2
     JOIN equipo e2 ON j2.equipo = e2.id_equipo
     WHERE e2.nombre = 'Caja Laboral');

SELECT j.*
FROM jugador j
WHERE j.salario = (SELECT MAX(salario) FROM jugador)
   OR j.salario = (SELECT MIN(salario) FROM jugador);

SELECT j.*
FROM jugador j
WHERE j.fecha_alta = (SELECT MIN(fecha_alta) FROM jugador);

SELECT e.*
FROM equipo e
JOIN jugador j ON e.id_equipo = j.equipo
GROUP BY e.id_equipo
HAVING COUNT(j.id_jugador) > 3;

SELECT j.nombre, e.nombre AS equipo, j.posicion
FROM jugador j
JOIN equipo e ON j.equipo = e.id_equipo;

SELECT e.nombre AS equipo, j.nombre AS capitan
FROM equipo e
JOIN jugador j ON e.id_equipo = j.equipo
WHERE j.id_capitan = j.id_jugador;

SELECT e.nombre, COUNT(p.id_partido) AS partidos_local
FROM equipo e
LEFT JOIN partido p ON e.id_equipo = p.local
GROUP BY e.id_equipo;

SELECT DISTINCT j.*
FROM jugador j
JOIN partido p ON j.equipo = p.visitante
GROUP BY j.id_jugador
HAVING COUNT(p.id_partido) >= 3;

SELECT e.nombre, MAX(j.salario) AS salario_maximo
FROM equipo e
JOIN jugador j ON e.id_equipo = j.equipo
GROUP BY e.id_equipo;

SELECT DISTINCT e.*
FROM equipo e
JOIN partido p ON e.id_equipo = p.visitante
JOIN equipo ev ON p.local = ev.id_equipo
WHERE ev.nombre = 'P.E. Valencia';
