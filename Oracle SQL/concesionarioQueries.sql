/* BLOQUE ANONIMO */
-- 1
declare
    v_id marcas_coche.id_marca%type := &id_marca1;
    v_marca marcas_coche.marca%type;
begin
    select marca into v_marca from marcas_coche
    where id_marca = v_id;
    dbms_output.put_line('La marca con id ' || v_id || 'es' || v_marca);
end;

-- 2
declare
    v_dni cliente.dni%type := &dni1;
    v_nombre cliente.nombre%type;
    v_telefono cliente.telef%type;
begin
    select nombre, telef into v_nombre,v_telefono from cliente 
    where dni= v_dni;
    dbms_output.put_line('Datos cliente: ' || v_nombre || " - " || v_telefono);
end;

-- 3
declare
    v_dni cliente.dni%type := &dni1;
    v_nombre cliente.nombre%type;
    v_telefono cliente.telef%type;
begin
    select nombre, telef into v_nombre,v_telefono from cliente 
    where dni= v_dni;
    dbms_output.put_line('Datos cliente: ' || v_nombre || " - " || v_telefono);
exception
    when no_data_found then
        dbms_output.put_line('No hay datows' || sqlerrm);
end;

-- 4
