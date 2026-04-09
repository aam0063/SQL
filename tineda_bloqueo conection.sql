use tienda_bloqueo;

select * from productos;

update productos set stock = stock - 1 where id = 1;

update productos set stock = stock - 1 where id = 1;


select * from productos where id = 1 lock in share mode;

update prodcutos set stock = stock - 1 where id = 1;