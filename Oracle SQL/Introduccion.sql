--  1. MOSTRAR 'HOLA MUNDO' POR PANTALLA

DECLARE
BEGIN
    dbms_output.PUT_LINE('Hola Mundo');
END;
/

--  2. EJEMPLO 2

DECLARE
    numero NUMBER := 5;
BEGIN
    numero := numero * 2;
    dbms_output.PUT_LINE('El resultado es: ' || numero);
END;
/

--  3. DECLARAR UNA VARIABLE NUMERICA Y MOSTRAR SI ES MAYOR O MENOR QUE 10

DECLARE
    numero NUMBER := 9;
BEGIN
    IF numero > 10 THEN 
        dbms_output.PUT_LINE('Es mayor que 10');
    ELSE 
        dbms_output.PUT_LINE('Es menor que 10');
    END IF;
END;
/

--  4. MOSTRAR LOS NÚMEROS DEL 1 AL 10 CON WHILE

DECLARE 
    numero NUMBER := 1;
BEGIN 
    WHILE numero <= 10 LOOP
        dbms_output.PUT_LINE(numero);
        numero := numero + 1;
    END LOOP;
END;
/
    
--  5. MOSTRAR LOS NÚMEROS DEL 1 AL 10 CON FOR
DECLARE
BEGIN
    FOR i IN 1..10 LOOP
    dbms_output.PUT_LINE(i);
    END LOOP;
END;
/

DECLARE
BEGIN
    FOR i IN REVERSE 1..10 LOOP
    dbms_output.PUT_LINE(i);
    END LOOP;
END;
/
    
    
--  6. DECLARAR VARIABLE NÚMERICA NOTA Y MOSTRAR CON CASI SI APROBADO O NO

DECLARE 
    nota NUMBER := 8;
BEGIN
    IF nota >= 5 THEN
        dbms_output.PUT_LINE('Aprobado');
    ELSE
        dbms_output.PUT_LINE('Suspendo');
    END IF;
END;
/

DECLARE
    nota NUMBER(3, 1); -- 3 DIGITOS, 1 DECIMAL
BEGIN 
    nota := 4.9;
    CASE
        WHEN nota < 5 THEN
            dbms_output.PUT_LINE('NO APTO');
        WHEN nota >= 5 THEN
            dbms_output.PUT_LINE('APTO');
        ELSE
            dbms_output.PUT_LINE('Nota Erronea');
    END CASE;
END;


--  7. EXCEPCIÓN ZERO_DIVISE

DECLARE
    prueba NUMBER := 5;
    resultado NUMBER;
BEGIN 
    resultado := prueba / 0; -- ESTO DEBE CAUSAR EXCEPCIÓN
    dbms_output.PUT_LINE('El resultado es ' || resultado);
EXCEPTION
    WHEN zero_divide THEN
        dbms_output.PUT_LINE('Error en la operación' || SQLCODE); -- Para que te diga de que tipo es el error
    WHEN OTHERS THEN
        dbms_output.PUT_LINE('Cualquier otro error');
END;
/


--  8. EXCEPCIÓN PERSONALIZADA CON RAISE
    
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
/
    
    