drop database if exists cine;
create database cine;
use cine;

create user 'block_prueba'@'localhost' identified by '123456';
grant all privileges on cine.* to 'block_prueba'@'localhost';

create table sesiones (
	id int primary key,
    pelicula varchar(100),
    asientos_disponibles int
    );
    
insert into sesiones values (1, 'Torrente', 10);
    
start transaction;
select asientos_disponibles from sesiones where id = 1;
update sesiones set asientos_disponibles = asientos_disponibles - 1 where id = 1;
select asientos_disponibles from sesiones where id = 1;
commit; -- la operacion se queda guardada ya que no se puede deshacer
    
start transaction;
select asientos_disponibles from sesiones where id = 1;
update sesiones set asientos_disponibles = asientos_disponibles - 1 where id = 1;

-- falta de pago y cancelamos
rollback;  