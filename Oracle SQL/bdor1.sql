drop type Alumno;
drop type Persona;
drop type Direccion;

create type Direccion as object (
    calle varchar2(50),
    ciudad varchar2(20),
    codigo_postal number(5)
);

create or replace type Persona as object (
    nombre varchar2(50),
    apelleidos varchar2(100),
    domicilio Direccion,
    fecha_nac date,
    member function nombreCompleto return varchar2
)not final;

create or replace type body Persona as

    member function nombreCompleto return varchar2 is
    begin
        return nombre || ' ' || apellidos;
    end;
end;

create or replace type Alumno under Persona (
    matricula varchar2(20),
    calificacion number
);

create or replace type Profesor under Persona(
    asignatura varchar2(50),
    salario number,
    member procedure aumentarSalario (cantidad number)
);

