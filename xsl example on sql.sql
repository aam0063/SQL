-- Crear usuario para que se conecte desde el mismo equipo de la BBDD
create user 'usuario_prueba'@'localhost' identified by '123456';

-- Crear usuario para que se conecte desde cualquier parte
create user 'usuario_prueba'@'%' identified by '123456';

-- Crear usuario para que se conecte desde una direccion
create user 'usuario_prueba'@'192.168.20.105' identified by '123456';



