alter session set "_ORACLE_SCRIPT" = true;

drop user concesionario cascade;
create user concesionario identified by "Med@c"
default tablespace users 
temporary tablespace temp
quota 100m on users;

grant connect, resource to concesionario;