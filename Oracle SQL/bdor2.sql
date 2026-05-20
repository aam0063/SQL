
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

create or replace type body Profesor AS 
    member procedure aumentarSalario (cantidad number)
    begin
        self.salario := self.salario + cantidad;
    end;
    
    create table Alumnos of alumno;
    create table profesores of profesor;
































drop type moto cascade;
drop type CocheElectrico cascade;
drop type Vehiculo cascade;    
    
create or replace type Vehiculo as object (
    matricula varchar2(10),
    marca varchar2(50),
    modelo varchar2(50),
    anio number(4),
    member function CalcularAntiguedad return number
)not final;

create or replace type body Vehiculo as
    member function CalcularAntiguedad return number is
    begin
        return extract(YEAR from sysdate) - anio;
    end;
end;

create or replace type CocheElectrico under Vehiculo(
    autonnomia number,
    member procedure aumentarAutonomia(incremento number)
);

create or replace type body CocheElectrico as
    member procedure aumentarAutonomia(incremento number) is
    begin
        self.autonomia := self.autonomia + incremento;
    end;
    
create or replace type moto under vehiculo(
    cilindrada number;
);

create table CocheElectricos of CocheElectrico;
create table Motos of Moto;

declare
    ce1 CocheElectrico;
begin
    ce1 := CocheElectrico('ELEC123','Tesla','Model S',2022,600);
    ce1.aumentarAutonomia(100);
    insert into CochesElectricos values(ce1);
    dbms_output.put_line('Autonomia actualizada del coche ' || ce1.matricula || 'es'
    ce1.autonomia || ' kms');
    
declare
    ce1 cocheElectrico;
begin
    select value(c) into ce1 from CochesElectricos c where matricula ='ELEC123';
    dbms_output.put_line('Antiguedad del vehiculo' || ce1.calcularAntiguedad || 'años');
    ce1.aumentarAutonomia(200);
    update CochesElectricos cochee set value(cochee) = ce1 WHERE cochee.matricula = 'ELEC123';
end;

