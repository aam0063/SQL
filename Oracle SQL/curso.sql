-- 1. mostrar 'Hola mundo' por pantalla
declare
begin
    dbms_output.PUT_LINE('Hola Mundo');
end;
/
-- 2. Ejemplo 2
declare
    numero number := 5;
begin
    numero := numero*2;
    dbms_output.PUT_LINE('El resultado es: ' || numero);
end;
/
-- 3. Declarar una variable numeric y mostrar si es mayor o menos que 10
declare
    numero number := 5;
begin
    if numero > 10 then 
    dbms_output.PUT_LINE('El numero es mayor a 10');
    else
    dbms_output.PUT_LINE('El numero es menor a 10');
    end if;
end;
/
/*4. Mostrar los números del 1 al 10 con while*/
 declare v_contador number := 1;
 
 begin while v_contador <= 10 loop
    dbms_output.put_line(v_contador);
    v_contador := v_contador + 1;
 end loop;
 end;
/
/*5. Mostrar los números del 1 al 10 con for*/
begin
    for i in 1..10 loop
        dbms_output.PUT_LINE(i);
    end loop;
end;
/

/*6. Declarar variable númerica nota y mostrar con casi si aprobado o no */

declare 
    nota number := 7;

 begin case         
    when nota >= 5 then
 dbms_output.put_line('aprobado');
    else
 dbms_output.put_line('no aprobado');
 end case;
 end;
/
/*7. Excepción ZERO_DIVISE */
declare
    prueba number := 5;
    resultado number;
begin
    resultado := prueba/0; -- esto debe causar excepcion
     dbms_output.put_line('El resultado es' || resultado);
EXCEPTION
    when zero_divide then
         dbms_output.put_line('error en la operacion' || SQLERRM);
        when OTHERS then
         dbms_output.put_line('cualquier otro error');
end;

/*8. Excepción personalizada con RAISE */
DECLARE
    edad NUMBER := -1;
    edad_exception EXCEPTION;
BEGIN
    IF edad < 0 OR edad > 120 THEN
    RAISE edad_exception;
END IF;
EXCEPTION
    WHEN edad_exception THEN
        dbms_output.PUT_LINE('Error en la variable edad');
END;
