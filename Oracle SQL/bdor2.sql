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