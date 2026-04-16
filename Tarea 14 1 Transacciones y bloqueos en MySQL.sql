DROP DATABASE IF EXISTS banco_pcxxx;
CREATE DATABASE banco_pcxxx;
USE banco_pcxxx;

CREATE TABLE cuentas (
id_cuenta INT PRIMARY KEY,
titular VARCHAR(100) NOT NULL,
saldo DECIMAL(10,2) NOT NULL
);

CREATE TABLE movimientos (
id_mov INT AUTO_INCREMENT PRIMARY KEY,
id_cuenta INT NOT NULL,
tipo VARCHAR(30) NOT NULL,
importe DECIMAL(10,2) NOT NULL,
fecha_mov TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (id_cuenta) REFERENCES cuentas(id_cuenta)
);

INSERT INTO cuentas VALUES
(1, 'PCxxx', 1000.00),
(2, 'Daniel', 1000.00),
(3, 'Carlos', 1500.00);

SELECT * FROM cuentas;

START TRANSACTION;

UPDATE cuentas
SET saldo = saldo - 200
WHERE id_cuenta = 1;

UPDATE cuentas
SET saldo = saldo + 200
WHERE id_cuenta = 2;

INSERT INTO movimientos (id_cuenta, tipo, importe)
VALUES (1, 'transferencia_salida', 200.00);

INSERT INTO movimientos (id_cuenta, tipo, importe)
VALUES (2, 'transferencia_entrada', 200.00);

SELECT * FROM cuentas;
SELECT * FROM movimientos;

COMMIT;

START TRANSACTION;

UPDATE cuentas SET saldo = saldo - 300 WHERE id_cuenta = 1;
UPDATE cuentas SET saldo = saldo + 300 WHERE id_cuenta = 2;

INSERT INTO movimientos (id_cuenta, tipo, importe)
VALUES (1, 'transferencia_salida', 300.00);

INSERT INTO movimientos (id_cuenta, tipo, importe)
VALUES (2, 'transferencia_entrada', 300.00);

SAVEPOINT sp1;

UPDATE cuentas
SET saldo = saldo - 20
WHERE id_cuenta = 1;

INSERT INTO movimientos (id_cuenta, tipo, importe)
VALUES (1, 'comision', 20.00);

SELECT * FROM cuentas;
SELECT * FROM movimientos;

ROLLBACK TO SAVEPOINT sp1;

SELECT * FROM cuentas;
SELECT * FROM movimientos;

COMMIT;

START TRANSACTION;

SELECT * FROM cuentas WHERE id_cuenta = 1 FOR UPDATE;

COMMIT;

START TRANSACTION;

SELECT * FROM cuentas WHERE id_cuenta = 2 LOCK IN SHARE MODE;

COMMIT;

LOCK TABLES cuentas WRITE;

UNLOCK TABLES;

LOCK TABLES cuentas READ;