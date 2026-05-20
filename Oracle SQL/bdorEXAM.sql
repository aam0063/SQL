drop type Producto;
drop type ProductoElectronico;
drop type ProductoAlimentario;

create type Producto as object(
    codigo varchar2(10),
    nombre varchar2(100),
    categoria varchar2(50),
    precio number(10,2),
    member function obtenerEtiqueta return varchar2
)not final;

create type ProductoElectronico under Producto(
    garantia_meses number,
    member procedure aplicarDescuento(porcentaje number)
)not final;

create type ProductoAlimentario under Producto(
    calorias_por_100g number
);



create or replace type body Producto as

    member function obtenerEtiqueta  return varchar2 is
    begin
        return codigo || nombre || categoria; 
    end;
end;


create or replace type body ProductoElectronico as

    member function aplicarDescuento return varchar2 is
    begin
        return precio % "10"; 
    end;
end;


create table ProductosElectronicos of ProductoElectronico;
create table ProductosAlimentarios of ProductoAlimentario;


declare

begin

pe1 :=
ProductoAlimentario('Pescado','Carne',
20, 12)

pe2:= 
ProductoElectronico('ELEC','Movil',
30, 67);;


 dbms_output.put_line('descuento: ' || aplicarDescuento);
 
end;