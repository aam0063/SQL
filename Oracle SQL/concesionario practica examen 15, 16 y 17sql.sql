-- 1 Mostrar el nombre de la marca dado su id.
declare
    v_id marcas_coche.id_marca%type := &id_marca1;
    v_marca marcas_coche.marca%type;
begin
    select marca into v_marca from marcas_coche where id_marca = v_id;
dbms_output.put_line('La marca con ID ' || v_id || ' es ' || v_marca);
end;

-- 2 Mostrar el nombre y tel�fono de un cliente dado su dni. (al tratarse de un varchar2 ten�is que poner el dni entre comillas simples)
declare
    v_dni cliente.dni%type := &dni1;
    v_nombre cliente.nombre%type;
    v_telef cliente.telef%type;
begin
    select nombre, telef into v_nombre, v_telef from cliente where dni = v_dni;
    dbms_output.put_line(v_nombre || ' junto a su teleftono ' || v_telef || ' su dni es ' || v_dni);
end;
-- 3 Igual que le anterior pero capturando una excepcion en caso de que no existan datos(no_data_found)
declare
    v_dni cliente.dni%type := &dni2;
    v_nombre cliente.nombre%type;
    v_telef cliente.telef%type;
begin
    select nombre, telef into v_nombre, v_telef from cliente where dni = v_dni;
    dbms_output.put_line(v_nombre || ' junto a su telefono ' || v_telef || ' su dni es ' || v_dni);
    
exception 
    when no_data_found then
    dbms_output.put_line('No hay datos'); -- SALDR� EN EL EXAM�N
end;

-- 4 Mostrar el nombre y tel�fono de un cliente dado su dni. (lo mismo que el ejercicio anterior pero ahora utilizando %rowtype)
declare
    
    v_cliente cliente%rowtype;
    v_dni cliente.dni%type := &dni1;
    
begin 
    selet * into v_cliente from cliente where dni
    dbms_output.put_line('Datos cliente: ' || v_cliente.nombre || ' - ' || v_cliente);
    
exception
    when no_data_found then
    dbms_output.put_line('No hay datos'); -- SALDR� EN EL EXAM�N
end;
-- 5 Mostrar toda la informaci�n de un coche dada la matr�cula (MATRICULA, ID_MODELO, PRECIO_COMPRA)
DECLARE
    v_coche CONCESIONARIO.COCHE%ROWTYPE;
    v_matricula coche.matricula%type := '&matricula';
BEGIN
    SELECT * INTO v_coche FROM CONCESIONARIO.COCHE WHERE MATRICULA = v_matricula;

    DBMS_OUTPUT.PUT_LINE('Matr�cula: ' || v_coche.MATRICULA);
    DBMS_OUTPUT.PUT_LINE('ID Modelo: ' || v_coche.ID_MODELO);
    DBMS_OUTPUT.PUT_LINE('Precio compra: ' || v_coche.PRECIO_COMPRA);
END;
/
-- 6 Mostrar toda la informaci�n del modelo de un coche dado un id, incluida el nombre de la marca.
declare
    v_id_modelo modelo_coche.id_modelo%type := &modelo1;
    v_modelo modelo_coche%rowtype;
    v_marca marcas_coche.marca%type;
begin
    select m.id_modelo, m.descripcion, ma.marca into v_modelo.id_modelo,
    v_modelo.descripcion, v_marca from modelo_coche m join marcas_coche ma on (m.id_marca = ma.id_marca)
    where v_id_modelo = m.id_modelo;
    
    dbms_output.put_line('Modelo ID: ' || v_id_modelo || chr(10) || 'Descripcion: ' || v_modelo.descripcion || chr(10)
    || ' Marca: ' || v_marca);
end;









/
-- 7 Mostrar la suma de ventas. Pasa el dni del empleado por par�metro.
    
-- 8 Mostrar cuantos modelos de coches hay de la marca 'Citroen'.

-- PROCEDIMIENTOS

-- 1* Realizar un procedimiento que muestre cuantos modelos de coches hay de la marca Citr�en
create or replace procedure 
contar_modelo_coche(v_marca marcas_coche.marca%type) as

    v_cantidad number;
begin 
    select count(*) into v_cantidad
    from modelo_coche mc join marcas_coche ma
    on mc.id_marca = ma.id_marca
    where ma.marca = v_marca;
    dbms_output.put_line('La cantidad de coches de ' || v_marca || ' es ' || v_cantidad);
    
end;

-- 2.- Crea un procedimiento que reciba como par�metro la matr�cula de un coche vendido. 
-- El procedimiento debe mostrar por pantalla el nombre del cliente que compr� el coche, 
-- el nombre del empleado que realiz� la venta, 
-- el precio de venta (debe manejar  NO_DATA_FOUND).

create or replace procedure matricula_vendido(v_matricula vende.matricula%type) as
    v_cliente cliente.nombre%type;
    v_empleado empleado.nombre%type;
    v_precio vende.precio%type;
    
begin
    select cl.nombre, em.nombre, ve.precio into v_cliente, v_empleado, v_precio from vende ve join cliente cl 
    on ve.dni_cliente = cl.dni join empleado em on ve.dni_empleado = em.dni where ve.matricula = v_matricula;

    dbms_output.put_line('Nombre cliente: ' || v_cliente || chr(10) || 
    'Nombre empleado: '|| v_empleado || chr(10) || 'Precio: ' || v_precio);
    
exception
    when no_data_found then
        dbms_output.put_line('No hay datos');

end;

begin
    matricula_vendido('7894AAA');
end;


    

-- 3.- Mostrar si un empleado tiene ventas o no.
create or replace procedure tiene_ventas(v_dni vende.dni_empleado%type) as

     v_cuenta number;

begin
   select count(*) into v_precio
    from vende
end;

-- FUNCIONES
-- 1.- Realizar una funci�n que devuelva la suma de ventas. Pasa el dni del empleado por par�metros
create or replace function precio_venta(v_dni dni_vende.dni_empleado%type)
return number 
as
    v_sumaprecio vende.precio%type := 0;
begin
    select sum(precio) into v_sumaprecio from vende 
    where v_dni = dni_empleado;
    
    return v_sumaprecio;
    
end;



-- 2.- Funci�n que devuelve el n�mero de coches vendidos por un empleado

create or replace function comprobar_empleado_vende(v_dni_empleado vende.dni_empleado%type)
return number as
    v_cantidad number;
    
    
begin
    select count(matricula) into v_cantidad
    from vende where dni_empleado = v_matricula;
    return v_cantidad;
end;

declare
    v_dni_empleado vende.dni_empleado%type := '05678245B';
    v_resultado number;

begin
    v_resultado := comprobar_empleado_vende(v_dni_empleado);
    dbms_output.put_line('El dni del empleado es: ' || v_dni_empleado || ' ha vendido: ' 
    
-- DISPARADORES 
-- 1.- Crear un trigger que verifique el precio de compra de un coche antes de insertarlo en la tabla coche. 
-- Si el precio es nulo o cero, el trigger debe evitar la inserci�n y lanzar una excepci�n.

create or replace trigger check_precio_compra
before insert on coche
for each row

begin
    if :new.precio_compra is null or :new.precio_compra <= 0 then
    
    RAISE_APPLICATION_ERROR(-20001, 'El precio_compra no es correcto');
    end if;
    
    -- Esto es como un break en programaci�n
end;

insert into coche(matricula, id_modelo, precio_compra) values 
('1234AA', 1, -1);

-- 2.- Crear un trigger que autom�ticamente inserte la fecha actual en la columna fecha_insercion cada vez que se a�ade un nuevo registro en la tabla coche.
alter table coche add fecha_insercion date;

create or replace trigger trg_coche_insercion
before insert on coche
for each row
begin 
    :new.fecha_insercion := sysdate;
end;

insert into coche (matricula, id_modelo, precio_compra) values ('1234BB', 1, -1);
    

-- 3.- Crear un trigger que impida actualizar el precio de compra de un coche si el nuevo precio es menor que el precio anterior.

create or replace trigger trg_no_bajar_precio
before update of precio_compra on coche
for each row

begin 
    if :new.precio_compra < :old.precio_compra then
    RAISE_APPLICATION_ERROR(-20003, 'El precio_compra no es correcto');
    
    end if;

end;

update coche set precio_compra = 5000 where matricula = '3345GVF';

