/* BLOQUE ANONIMO */

-- 1. MOSTRAR EL NOMBRE DE LA MARCA DADO SU ID
DECLARE
    v_id marcas_coche.id_marca%TYPE := &id_marca1;
    v_marca marcas_coche.marca%TYPE;
BEGIN
    SELECT marca INTO v_marca FROM marcas_coche
    WHERE id_marca = v_id;
    dbms_output.put_line('La marca con ID ' || v_id || ' es ' || v_marca);
END;
/


-- 2. MOSTRAR EL NOMBRE Y TELÉFONO DE UN CLIENTE DADO SU DNI
DECLARE
    v_dni cliente.dni%TYPE := &dni1;
    v_nombre cliente.nombre%TYPE;
    v_telefono cliente.telef%TYPE;
BEGIN
    SELECT nombre, telef INTO v_nombre, v_telefono
    FROM cliente WHERE dni = v_dni;
    dbms_output.put_line('Datos clientes: ' || v_nombre || ' - ' || v_telefono);
END;
/


-- 4. MOSTRAR EL NOMBRE Y TELEFONO DE UN CLIENTE DADO SU DNI
DECLARE
    v_dni cliente.dni%TYPE := &dni1;
    v_nombre cliente%ROWTYPE;
BEGIN
    SELECT * INTO v_cliente
    FROM cliente WHERE dni = v_dni;
    dbms_output.put_line('Datos clientes: ' || v_cliente.nombre || ' - ' || v_cliente.telefono);
EXCEPTION
    WHEN no_data_found THEN 
    dbms_output.put_line('No hay datos');
END;
/


-- 5. MOSTRAR TODA LA INFORMACIÓN DE UN COCHE DADA LA MATRÍCULA
DECLARE
    v_matricula coche.matricula%TYPE := '&matricula1';
    v_coche coche%ROWTYPE;
BEGIN
    SELECT * INTO v_coche
    FROM coche WHERE matricula = v_matricula;
    dbms_output.put_line('Matricula:'  || v_coche.matricula || chr(10) || 'Id_modelo:' || v_coche.id_modelo || chr(10) || 'Precio: '|| v_coche.precio_compra);
END;
/
    

-- 6. MOSTRAR TODA LA INFORMACIÓN DEL MODELO DE UN COCHE DADO UN ID, INCLUIDA EL NOMBRE DE LA MARCA
DECLARE
    








