use banco;
select * from cuentas;

update cuentas set saldo = saldo +100 where id = 1;

savepoint sp1;
update cuentas set saldo = saldo -100 where id = 1;

rollback to sp1;
update cuentas set saldo = saldo - 100 where id = 1;

rollback to sp1;
select * from cuentas;

