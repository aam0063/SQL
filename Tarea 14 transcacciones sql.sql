DROP DATABASE IF EXISTS banco_pcxxx;
CREATE DATABASE banco_pcxxx;
USE banco_pcxxx;

CREATE TABLE cuentas (
id_cuenta INT PRIMARY KEY,
titular VARCHAR(100) NOT NULL,
saldo DECIMAL(10,2) NOT NULL
) ;

CREATE TABLE movimientos (
id_mov INT AUTO_INCREMENT PRIMARY KEY,
id_cuenta INT NOT NULL,
tipo VARCHAR(30) NOT NULL,
importe DECIMAL(10,2) NOT NULL,
fecha_mov TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (id_cuenta) REFERENCES cuentas(id_cuenta)
) ;

INSERT INTO cuentas (id_cuenta, titular, saldo) VALUES
(1, 'PCxxx', 1000.00),
(2, 'Daniel', 1000.00),
(3, 'Carlos', 1500.00);

SELECT * FROM cuentas;
