alter session set "_ORACLE_SCRIPT" = true;

drop user curso cascade;

create user curso identified by "Med@c"
default tablespace users
temporary tablespace temp
quota 100M on users;

grant connect, resource to curso;

