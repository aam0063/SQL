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

