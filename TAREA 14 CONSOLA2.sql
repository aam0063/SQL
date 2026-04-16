use banco_pcxxx;

SELECT * FROM cuentas;
SELECT * FROM movimientos;

SELECT * FROM cuentas;
SELECT * FROM movimientos;

SELECT * FROM cuentas;
SELECT * FROM movimientos;

UPDATE cuentas
SET saldo = saldo + 100
WHERE id_cuenta = 1;

SELECT * FROM cuentas WHERE id_cuenta = 1;

SELECT * FROM cuentas WHERE id_cuenta = 2 LOCK IN SHARE MODE;

UPDATE cuentas
SET saldo = saldo + 50
WHERE id_cuenta = 2;

SELECT * FROM cuentas;

UPDATE cuentas SET saldo = saldo + 10 WHERE id_cuenta = 1;

SELECT * FROM cuentas;