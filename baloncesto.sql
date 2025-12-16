-- --------------------------------------------------------
-- Host:                         bbdd.dlsi.ua.es
-- Versión del servidor:         5.1.66-0+squeeze1 - (Debian)
-- SO del servidor:              debian-linux-gnu
-- HeidiSQL Versión:             7.0.0.4320
-- --------------------------------------------------------
-- Alejandro Arevalo.
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
Drop database if exists liga;
CREATE DATABASE `liga` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `liga`;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipo` (
  `id_equipo` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `web` varchar(250) DEFAULT 'sin web oficial',
  `puntos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_equipo`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (1,'Regal Barcelona','Barcelona','http://www.fcbarcelona.com/web/index_idiomes.html',10),(2,'Real Madrid','Madrid','http://www.realmadrid.com/cs/Satellite/es/1193040472450/SubhomeEquipo/Baloncesto.htm',9),(3,'P.E. Valencia','Valencia','http://www.valenciabasket.com/',11),(4,'Caja Laboral','Vitoria','http://www.baskonia.com/prehomes/prehomes.asp?id_prehome=69',22),(5,'Gran Canaria','Las Palmas','http://www.acb.com/club.php?id=CLA',14),(6,'CAI Zaragoza','Zaragoza','http://basketzaragoza.net/',23);
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;

--
-- Table structure for table `jugador`
--

DROP TABLE IF EXISTS `jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jugador` (
  `id_jugador` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `posicion` varchar(45) DEFAULT NULL,
  `id_capitan` int(11) DEFAULT NULL,
  `fecha_alta` datetime DEFAULT NULL,
  `salario` int(11) DEFAULT NULL,
  `equipo` int(11) DEFAULT NULL,
  `altura` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`id_jugador`),
  KEY `fequipo` (`equipo`),
  CONSTRAINT `fequipo` FOREIGN KEY (`equipo`) REFERENCES `equipo` (`id_equipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugador`
--

/*!40000 ALTER TABLE `jugador` DISABLE KEYS */;
INSERT INTO `jugador` VALUES (1,'Juan Carlos','Navarro','escolta',1,'2010-01-10 00:00:00',130000,1,'1.96'),(2,'Felipe','Reyes','Pivot',2,'2009-02-20 00:00:00',132000,2,'2.04'),(3,'Victor','Claver','Alero',3,'2009-03-08 00:00:00',99000,3,'2.08'),(4,'Rafa ','Martinez','ala-pivot',4,'2010-11-11 00:00:00',51000,3,'1.91'),(5,'Fernando','San Emeterio','Alero',6,'2008-09-22 00:00:00',60000,4,'1.99'),(6,'Mirza','Teletovic','Pivot',6,'2010-05-13 00:00:00',77000,4,'2.06'),(7,'Sergio ','Llull','Escolta',2,'2011-10-29 00:00:00',100000,2,'1.90'),(8,'Victor ','Sada','Base',1,'2012-01-01 00:00:00',80000,1,'1.92'),(9,'Carlos','Suarez','Alero',2,'2011-02-19 00:00:00',66000,2,'2.03'),(10,'Xavi ','Rey','Pivot',14,'2008-10-12 00:00:00',104500,5,'2.09'),(11,'Carlos ','Cabezas','Base',13,'2012-01-21 00:00:00',105000,6,'1.86'),(12,'Pablo ','Aguilar','Alero',13,'2011-06-14 00:00:00',51700,6,'2.03'),(13,'Rafa','Hettsheimeir','Pivot',13,'2008-04-15 00:00:00',58300,6,'2.08'),(14,'Sitapha','Savané','Pivot',14,'2011-07-27 00:00:00',66000,5,'2.01'),(15,'anonimo','anonimo','Ala-pivot',2,'2012-01-01 00:00:00',4000,3,'2.00'),(22,'j1',NULL,NULL,NULL,NULL,NULL,2,'2.00'),(23,'j2',NULL,NULL,NULL,NULL,NULL,2,NULL);
/*!40000 ALTER TABLE `jugador` ENABLE KEYS */;

--
-- Table structure for table `partido`
--

DROP TABLE IF EXISTS `partido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partido` (
  `id_partido` int(11) NOT NULL AUTO_INCREMENT,
  `local` int(11) NOT NULL,
  `visitante` int(11) NOT NULL,
  `resultado` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `arbitro` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_partido`),
  KEY `flocal` (`local`),
  KEY `fvisitante` (`visitante`),
  CONSTRAINT `flocal` FOREIGN KEY (`local`) REFERENCES `equipo` (`id_equipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fvisitante` FOREIGN KEY (`visitante`) REFERENCES `equipo` (`id_equipo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partido`
--

/*!40000 ALTER TABLE `partido` DISABLE KEYS */;
INSERT INTO `partido` VALUES (1,1,2,'100-100','2011-10-10','4\r'),(2,2,3,'90-91','2011-11-17','5\r'),(3,3,4,'88-77','2011-11-23','6\r'),(4,1,6,'66-78','2011-11-30','6\r'),(5,2,4,'90-90','2012-01-12','7\r'),(6,4,5,'79-83','2012-01-19','3\r'),(7,3,6,'91-88','2012-02-22','3\r'),(8,5,4,'90-66','2012-04-27','2\r'),(9,6,5,'110-70','2012-05-30','1'),(10,3,5,'88-77','2011-09-01','2');
/*!40000 ALTER TABLE `partido` ENABLE KEYS */;


-- Consultas:
-- TERCERA RELACION

-- Mostrar los datos de los partidos jugados en el mes de febrero.
SELECT * FROM partido WHERE EXTRACT(month FROM fecha) = 2;

-- Mostrar el nombre y apellido de cada jugador en una sola columna llamada “Nombre Completo”, en MAYÚSCULAS.
SELECT UPPER(nombre || ' ' || apellido) AS "Nombre Completo" FROM jugador;

-- Mostrar los enlaces de las webs de los equipos que NO contengan “www”.
SELECT web FROM equipo WHERE web NOT LIKE '%www%';

-- Mostrar los datos de los equipos cuya web incluya la palabra “basket”.
SELECT * FROM equipo WHERE web LIKE '%basket%';

-- Mostrar los enlaces de las webs de los equipos pero sin “http://”.
SELECT REPLACE(web, 'http://', '') FROM equipo;

-- Consulta que devuelva esta frase: “El jugador con nombre y apellidos: Juan Carlos Navarro juega en la posición: escolta”.
SELECT 'El jugador con nombre y apellidos: ' || nombre || ' ' || apellido || ' juega en la posición: ' || posicion FROM jugador WHERE nombre = 'Juan Carlos' AND apellido = 'Navarro';

-- Datos de los equipos cuyo nombre tenga 12 caracteres o menos.
SELECT * FROM equipo WHERE LENGTH(nombre) <= 12;

-- Datos de los jugadores que fueron dados de alta en 2008 o 2011.
SELECT * FROM jugador WHERE EXTRACT(year FROM fecha_alta) IN (2008, 2011);

-- Mostrar un listado de las páginas web de los equipos pero cambiando “http://” por “https://”.
SELECT REPLACE(web, 'http://', 'https://') FROM equipo;

-- Mostrar el nombre del jugador y su nombre invertido.
SELECT nombre, REVERSE(nombre) FROM jugador;

-- Mostrar el nombre de los equipos rellenado por la izquierda hasta 20 caracteres con ‘*’.
SELECT LPAD(nombre, 20, '*') FROM equipo;

-- Mostrar el apellido de los jugadores y sus 3 primeras letras.
SELECT apellido, SUBSTR(apellido, 1, 3) AS Tres_Primeras_Letras FROM jugador;

-- Mostrar la posición en la que aparece la letra ‘a’ en el nombre del equipo.
SELECT nombre, INSTR(nombre, 'a') AS Posicion_a FROM equipo;

-- Mostrar el nombre del jugador y un campo que indique: “Veterano” si fue dado de alta antes de 2010; “Moderno” si fue dado de alta a partir de 2010 (usar CASE).
SELECT nombre, apellido, CASE WHEN fecha_alta < '2010-01-01 00:00:00' THEN 'Veterano' ELSE 'Moderno' END AS Estatus_Jugador FROM jugador;

-- Mostrar los jugadores cuyo apellido termina en “ez”.
SELECT nombre, apellido FROM jugador WHERE apellido LIKE '%ez';

-- Mostrar los equipos ordenados por la longitud de su nombre.
SELECT nombre, LENGTH(nombre) AS Longitud_Nombre FROM equipo ORDER BY LENGTH(nombre);

-- Mostrar el nombre del jugador completamente en minúsculas.
SELECT LOWER(nombre) FROM jugador;

-- Mostrar el nombre del jugador y las 2 primeras letras de su apellido.
SELECT nombre, SUBSTR(apellido, 1, 2) AS Iniciales_Apellido FROM jugador;

-- Mostrar el nombre del jugador y el año en el que fue dado de alta.
SELECT nombre, EXTRACT(year FROM fecha_alta) AS Año_Alta FROM jugador;

-- Mostrar nombre y apellido en una sola columna separados por un guion.
SELECT nombre || '-' || apellido AS Nombre_Completo_Guion FROM jugador;