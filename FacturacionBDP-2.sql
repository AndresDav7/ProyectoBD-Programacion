create view TabTempo1
as
	select nombreCl, idCliente, apellidoCl,direccionCl,telefonoCl, fechaNacCl,mailCl,fechaVenta
	from CabeceraFactura, Clientes
	where CabeceraFactura.idClienteFK = Clientes.idCliente

create view TabTempo2
as
	select idDetalle, cantidad, subTotal, formaPago,precioPr, categoriaPr,totalParcial
	from Especificacion, Factura
	where Especificacion.codigoPrFK= Factura.codigoPrFK

select * from TabTempo2

drop trigger montoSuperado_Cabecera

/*create trigger montoSuperado_Cabecera
on CabeceraFactura
for insert

where TotalPagar > 50 
as
	print 'Monto superado para la compra'
go*/
