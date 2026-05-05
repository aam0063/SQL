/*5 Mostrar toda la info de cada coche dada su matricula*/

declare
    v_matricula coche.matricula%type := '&matricula1';
    v_coche coche%rowtype;
begin
    select * into v_coche
    from coche
    where matricula = v_matricula;
    dbms_output.put_line('Matricula ' || v_coche.matricula || chr(10) ||
        'Descripcion' || v_coche.id_modelo || chr(10) ||
        'precio: ' || v_coche.precio_compra);
end;

/*PROCEDIMIENTOS*/
/*Realizar un procedimiento que muestre cueantos modelos de coches hay de la marca Citroen*/
create or replace procedure contar_modelo_coche() as 
    v_marca marcas_coche.marca%type) as
    v_cantidad number;

declare
    v_marca marca_coche.marca%type := '&marca1';
begin
    select count(*) into v_cantidad
    from modelo_coche mc join marcas_coche ma
    on mc.id_marca = ma.id_marca
    where ma.marca = v_marca;
    dbms_output.put_line('La cantidad de coches de ' || v_marca || 'es' || v_cantidad);
end;

declare
    v_marca marcas_coche.marca%type :='Citroen';
begin
    contar_modelo_coche(v_marca);
end;    

/*FUNCIONES*/
/*Realizar una funcion que devuelva la suma de ventas. Pasa el dni del empleado por parametros*/
create or replace function precio_venta(v_dni vende.dni_empleado%type)
return number
as
    v_sumaprecio vende.precio := 0;
begin
    select sum(precio) into v_sumaprecio
    from vende
    where v_dni = dni_empleado;
    
    return v_sumaprecio
end;

declare
    v_dni vende.dni_empleado%type := '90774536C';
    v_suma vende.precio%type;
begin
    v_suma := precio_venta(v_dni);
    dbms_output.put_line('La suma de ventas es ' || v_suma);
end;


create or replace trigger trg_validar_precio
before insert on coche
for each row
begin
    if :new.precio_compra is null or :new.precio_compra = 0 then
        raise_application_error(-20001, 'precio de compra no válido');
    end if;
end;

create or replace trigger trg_fecha_insercion
before insert on coche
for each row
begin
    :new.fecha_insercion := sysdate;
end;

create or replace trigger trg_no_bajar_precio
before update on coche
for each row
begin
    if :new.precio_compra < :old.precio_compra then
        raise_application_error(-20002, 'no se puede bajar el precio');
    end if;
end;    

/* 6 */
declare
    v_id_modelo modelo_coche.id_modelo%type := &modelocoche;
    v_modelo modelo_coche%rowtype;
    v_marca marcas_coche.marca%type;
begin
    select m.id_modelo,m.descripcion,ma.marca
    into v_modelo.id_modelo, v_modelo.descripcion,v_marca
    from modelo_coche m join marcas_coche ma
    on(m.id_marca = ma.id_marca)
    where v_id_modelo = m.id_modelo;
    dbms_output.put_line('Modelo ID: || v_modelo_id || chr(10) ||
    'Descripcion:' || v_modelo.descripcion || chr(10) ||
    'Marca : ' ||
    
    
    
    
    
    
    
    
    
    
    
    
    