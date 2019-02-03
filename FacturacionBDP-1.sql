create table Clientes(
nombreCl varchar(20) NOT NULL,
idCliente varchar(10) PRIMARY KEY NOT NULL,
apellidoCl varchar(20) NOT NULL,
direccionCl varchar(40) NOT NULL,
telefonoCl varchar(10) NOT NULL,
fechaNacCl date NOT NULL,
mailCl varchar(10) NOT NULL 
) 

create table Productos(
codigoPr numeric(3,0) PRIMARY KEY NOT NULL,
nombrePr varchar(15) NOT NULL,
precioPr  numeric(2,0) NOT NULL,
stockPr numeric(4,0) NOT NULL,
categoriaPr varchar(15) NOT NULL,
)

create table Factura(
idDetalle numeric(4,0) PRIMARY KEY NOT NULL,
cantidad numeric (4,0) NOT NULL,
subTotal numeric (8,0) NOT NULL,
formaPago varchar(15) NOT NULL
)

create table Especificacion(
precioPr numeric(3,0) NOT NULL,
cantidadVendida numeric(3,0) NOT NULL,
totalParcial  numeric(3,0) NOT NULL
)

create table CabeceraFactura(
idCabecera  numeric(4,0) PRIMARY KEY NOT NULL,
fechaVenta date NOT NULL,
TotalFactura numeric(5,0) NOT NULL,
Descuento numeric(4,0) NOT NULL,
TotalPagar numeric(4,0) NOT NULL
)

alter table Factura
add idCabeceraFK numeric(4,0) constraint CabeceraFactura_Factura FOREIGN KEY 
	references CabeceraFactura (idCabecera)

alter table Factura
add codigoPrFK numeric(3,0) constraint Producto_Factura FOREIGN KEY 
	references Productos (codigoPr)

alter table Factura
add codigoPrFK numeric(3,0) constraint Producto_Factura FOREIGN KEY 
	references Productos (codigoPr)

alter table CabeceraFactura
add idClienteFK varchar(10) constraint Producto_CabeceraFactura FOREIGN KEY 
	references  Clientes (idCliente)

alter table Especificacion
add codigoPrFK numeric(3,0) constraint Producto_Especificacion FOREIGN KEY 
	references Productos (codigoPr)

alter table Especificacion
add categoriaPr varchar(15) NOT NULL


insert into Productos
	values(001,'tacos',2,150,'entrada' )

insert into Productos
	values(002,'burritos',4,20,'entrada' )

insert into Productos
	values(003,'enchiladas',2,150,'entrada' )


insert into Clientes
	values('Andres','1715487375','Alvear','Recreo','0995476965','12/12/96','andres.alvear@outlook.ec' )

insert into Clientes
	values('Gabriel','1716455490','Salgado','Mena 2','0984564450','12/12/91','gabriel.salgado@outlook.ec' )

insert into Clientes
	values('Karla','1724057276','Chinacalle','San Carlos','0984048999','08/03/98','gabriel.salgado@outlook.ec' )

insert into Especificacion
	values(2,3,6,'entrada')

insert into Especificacion
	values(4,3,12,'entrada')

	insert into Especificacion
	values(2,8,16,'entrada')

insert into CabeceraFactura
	values (0001,'02/02/2018',6,0,6,'1724057276')

insert into CabeceraFactura
	values (0002,'10/01/2018',12,0,12,'1715487375')

insert into CabeceraFactura
	values (0003,'02/02/2018',16,0,16,'1724057276')

insert into Factura
	values (0010,3, 6, 'Efectivo', 0001,001 )

insert into Factura
	values (0011,3, 12, 'Tarjeta de credito', 0002,002 )

insert into Factura
	values (0012,8, 16, 'Tarjeta de debito', 0003,003 )



