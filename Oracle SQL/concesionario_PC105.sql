/*Ejercicio 1. Alejandro Arevalo*/
declare

    /*preguntar por la matricula*/
    v_matricula coche.matricula%type := '&matricula';
    
    v_precio_compra 
    coche.precio_compra%type;
        v_precio_venta vende.precio%type;
    v_forma_pago
    tipos_forma_pago.forma_pago%type;

begin
    select co.precio_compra, ve.precio, tf.forma_pago
    
    into v_precio_compra, v_precio_venta,
    v_forma_pago
    
    /* Unir las tablas */
    from coche co join vende ve 
    on co.matricula = ve.matricula 
    join tipos_forma_pago tf 
    on ve.id_forma_pago = tf.id_forma_pago
    where co.matricula = v_matricula;
    
    dbms_output.put_line('Matricula: '||  v_matricula);
    dbms_output.put_line('Precio compra: '||  v_precio_compra);
    dbms_output.put_line('Precio venta: '||  v_precio_venta);
    dbms_output.put_line('Forma pago: '||  v_forma_pago);
    
    exception
        when no_data_found then 
            dbms_output.put_line('no se ha vendido ningun coche con esa matricula :(');
    
    end;
    
    /
    
/*Ejercicio 2. Alejandro Arevalo*/
    
create or replace procedure puesto_empleado(v_dni empleado.dni%type) as

    v_nombre empleado.nombre%type;
    v_puesto tipos_puesto.puesto%type;
    
begin

    select em.nombre, tp.puesto
    into v_nombre, v_puesto
    from empleado em join tipos_puesto tp
    on em.id_puesto = tp.id_puesto
    where em.dni = v_dni;
    
    dbms_output.put_line('nombre: ' || v_nombre);
    dbms_output.put_line('Puesto: ' || v_puesto);
    
    exception
        when no_data_found then
            dbms_output.put_line('no se encuentra el dni');
    
end;
/
    
/*llamar al procedimiento*/

declare
    v_dni empleado.dni%type := '05678245B';
begin
    puesto_empleado(v_dni);
end;
/
    
/*Ejercicio 3. Alejandro Arevalo*/
create or replace function ContarCoches(v_precio_minimo number) return number as
    v_cantidad number;
    
begin
    select count(*) into v_cantidad
    from coche
    where precio_compra >= v_precio_minimo;
    
    return v_cantidad;
    
end;
/

declare
    v_precio_minimo number := &precio;
    v_resultado number;
    
begin
    v_resultado :=
ContarCoches(v_precio_minimio);

    dbms_output.put_line('Cantidad de coches con precio mayor or igual >=: ' || v_precio_minimo || ' ' || v_resultado);
    
end;
/

/*Ejercicio 4. Alejandro Arevalo*/

    
    

