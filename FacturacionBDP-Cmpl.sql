USE [FacturacionBDP]
GO
/****** Object:  Table [dbo].[CabeceraFactura]    Script Date: 2/3/2019 9:44:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CabeceraFactura](
	[idCabecera] [numeric](4, 0) NOT NULL,
	[fechaVenta] [date] NOT NULL,
	[TotalFactura] [numeric](5, 0) NOT NULL,
	[Descuento] [numeric](4, 0) NOT NULL,
	[TotalPagar] [numeric](4, 0) NOT NULL,
	[idClienteFK] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCabecera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 2/3/2019 9:44:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[nombreCl] [varchar](20) NOT NULL,
	[idCliente] [varchar](10) NOT NULL,
	[apellidoCl] [varchar](20) NOT NULL,
	[direccionCl] [varchar](40) NOT NULL,
	[telefonoCl] [varchar](10) NOT NULL,
	[fechaNacCl] [date] NOT NULL,
	[mailCl] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Clientes__885457EE8AEF8D53] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TabTempo1]    Script Date: 2/3/2019 9:44:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[TabTempo1]
as
	select nombreCl, idCliente, apellidoCl,direccionCl,telefonoCl, fechaNacCl,mailCl,fechaVenta
	from CabeceraFactura, Clientes
	where CabeceraFactura.idClienteFK = Clientes.idCliente
GO
/****** Object:  Table [dbo].[Especificacion]    Script Date: 2/3/2019 9:44:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especificacion](
	[precioPr] [numeric](3, 0) NOT NULL,
	[cantidadVendida] [numeric](3, 0) NOT NULL,
	[totalParcial] [numeric](3, 0) NOT NULL,
	[categoriaPr] [varchar](15) NOT NULL,
	[codigoPrFK] [numeric](3, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 2/3/2019 9:44:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[idDetalle] [numeric](4, 0) NOT NULL,
	[cantidad] [numeric](4, 0) NOT NULL,
	[subTotal] [numeric](8, 0) NOT NULL,
	[formaPago] [varchar](40) NOT NULL,
	[idCabeceraFK] [numeric](4, 0) NULL,
	[codigoPrFK] [numeric](3, 0) NULL,
 CONSTRAINT [PK__Factura__49CAE2FBC6744600] PRIMARY KEY CLUSTERED 
(
	[idDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TabTempo2]    Script Date: 2/3/2019 9:44:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[TabTempo2]
as
	select idDetalle, cantidad, subTotal, formaPago,precioPr, categoriaPr,totalParcial
	from Especificacion, Factura
	where Especificacion.codigoPrFK= Factura.codigoPrFK
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 2/3/2019 9:44:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[codigoPr] [numeric](3, 0) NOT NULL,
	[nombrePr] [varchar](40) NOT NULL,
	[precioPr] [numeric](2, 0) NOT NULL,
	[stockPr] [numeric](4, 0) NOT NULL,
	[categoriaPr] [varchar](15) NOT NULL,
 CONSTRAINT [PK__Producto__261071A10FD23DDA] PRIMARY KEY CLUSTERED 
(
	[codigoPr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CabeceraFactura] ([idCabecera], [fechaVenta], [TotalFactura], [Descuento], [TotalPagar], [idClienteFK]) VALUES (CAST(1 AS Numeric(4, 0)), CAST(N'2018-02-02' AS Date), CAST(6 AS Numeric(5, 0)), CAST(0 AS Numeric(4, 0)), CAST(6 AS Numeric(4, 0)), N'1724057276')
INSERT [dbo].[CabeceraFactura] ([idCabecera], [fechaVenta], [TotalFactura], [Descuento], [TotalPagar], [idClienteFK]) VALUES (CAST(2 AS Numeric(4, 0)), CAST(N'2018-10-01' AS Date), CAST(12 AS Numeric(5, 0)), CAST(0 AS Numeric(4, 0)), CAST(12 AS Numeric(4, 0)), N'1715487375')
INSERT [dbo].[CabeceraFactura] ([idCabecera], [fechaVenta], [TotalFactura], [Descuento], [TotalPagar], [idClienteFK]) VALUES (CAST(3 AS Numeric(4, 0)), CAST(N'2018-02-02' AS Date), CAST(16 AS Numeric(5, 0)), CAST(0 AS Numeric(4, 0)), CAST(16 AS Numeric(4, 0)), N'1724057276')
INSERT [dbo].[CabeceraFactura] ([idCabecera], [fechaVenta], [TotalFactura], [Descuento], [TotalPagar], [idClienteFK]) VALUES (CAST(4 AS Numeric(4, 0)), CAST(N'2017-10-10' AS Date), CAST(10 AS Numeric(5, 0)), CAST(0 AS Numeric(4, 0)), CAST(10 AS Numeric(4, 0)), N'1345097385')
INSERT [dbo].[CabeceraFactura] ([idCabecera], [fechaVenta], [TotalFactura], [Descuento], [TotalPagar], [idClienteFK]) VALUES (CAST(5 AS Numeric(4, 0)), CAST(N'2017-06-20' AS Date), CAST(2 AS Numeric(5, 0)), CAST(0 AS Numeric(4, 0)), CAST(2 AS Numeric(4, 0)), N'1715437573')
INSERT [dbo].[CabeceraFactura] ([idCabecera], [fechaVenta], [TotalFactura], [Descuento], [TotalPagar], [idClienteFK]) VALUES (CAST(6 AS Numeric(4, 0)), CAST(N'2017-05-26' AS Date), CAST(12 AS Numeric(5, 0)), CAST(0 AS Numeric(4, 0)), CAST(12 AS Numeric(4, 0)), N'1723450978')
INSERT [dbo].[CabeceraFactura] ([idCabecera], [fechaVenta], [TotalFactura], [Descuento], [TotalPagar], [idClienteFK]) VALUES (CAST(7 AS Numeric(4, 0)), CAST(N'2018-01-01' AS Date), CAST(20 AS Numeric(5, 0)), CAST(0 AS Numeric(4, 0)), CAST(20 AS Numeric(4, 0)), N'1723450978')
INSERT [dbo].[CabeceraFactura] ([idCabecera], [fechaVenta], [TotalFactura], [Descuento], [TotalPagar], [idClienteFK]) VALUES (CAST(8 AS Numeric(4, 0)), CAST(N'2019-01-02' AS Date), CAST(15 AS Numeric(5, 0)), CAST(0 AS Numeric(4, 0)), CAST(15 AS Numeric(4, 0)), N'1724057276')
INSERT [dbo].[CabeceraFactura] ([idCabecera], [fechaVenta], [TotalFactura], [Descuento], [TotalPagar], [idClienteFK]) VALUES (CAST(9 AS Numeric(4, 0)), CAST(N'2019-01-03' AS Date), CAST(12 AS Numeric(5, 0)), CAST(0 AS Numeric(4, 0)), CAST(12 AS Numeric(4, 0)), N'1724057276')
INSERT [dbo].[CabeceraFactura] ([idCabecera], [fechaVenta], [TotalFactura], [Descuento], [TotalPagar], [idClienteFK]) VALUES (CAST(10 AS Numeric(4, 0)), CAST(N'0201-01-04' AS Date), CAST(6 AS Numeric(5, 0)), CAST(0 AS Numeric(4, 0)), CAST(6 AS Numeric(4, 0)), N'1724057276')
INSERT [dbo].[CabeceraFactura] ([idCabecera], [fechaVenta], [TotalFactura], [Descuento], [TotalPagar], [idClienteFK]) VALUES (CAST(11 AS Numeric(4, 0)), CAST(N'2019-01-05' AS Date), CAST(2 AS Numeric(5, 0)), CAST(0 AS Numeric(4, 0)), CAST(2 AS Numeric(4, 0)), N'1745789310')
INSERT [dbo].[CabeceraFactura] ([idCabecera], [fechaVenta], [TotalFactura], [Descuento], [TotalPagar], [idClienteFK]) VALUES (CAST(12 AS Numeric(4, 0)), CAST(N'2019-01-06' AS Date), CAST(23 AS Numeric(5, 0)), CAST(0 AS Numeric(4, 0)), CAST(23 AS Numeric(4, 0)), N'1745789310')
INSERT [dbo].[CabeceraFactura] ([idCabecera], [fechaVenta], [TotalFactura], [Descuento], [TotalPagar], [idClienteFK]) VALUES (CAST(13 AS Numeric(4, 0)), CAST(N'2019-01-31' AS Date), CAST(20 AS Numeric(5, 0)), CAST(0 AS Numeric(4, 0)), CAST(20 AS Numeric(4, 0)), N'1745789310')
INSERT [dbo].[CabeceraFactura] ([idCabecera], [fechaVenta], [TotalFactura], [Descuento], [TotalPagar], [idClienteFK]) VALUES (CAST(14 AS Numeric(4, 0)), CAST(N'2019-02-02' AS Date), CAST(4 AS Numeric(5, 0)), CAST(0 AS Numeric(4, 0)), CAST(4 AS Numeric(4, 0)), N'1912678390')
INSERT [dbo].[CabeceraFactura] ([idCabecera], [fechaVenta], [TotalFactura], [Descuento], [TotalPagar], [idClienteFK]) VALUES (CAST(15 AS Numeric(4, 0)), CAST(N'2019-06-04' AS Date), CAST(3 AS Numeric(5, 0)), CAST(0 AS Numeric(4, 0)), CAST(3 AS Numeric(4, 0)), N'1912678390')
INSERT [dbo].[CabeceraFactura] ([idCabecera], [fechaVenta], [TotalFactura], [Descuento], [TotalPagar], [idClienteFK]) VALUES (CAST(16 AS Numeric(4, 0)), CAST(N'2019-02-01' AS Date), CAST(6 AS Numeric(5, 0)), CAST(0 AS Numeric(4, 0)), CAST(6 AS Numeric(4, 0)), N'1736459091')
INSERT [dbo].[CabeceraFactura] ([idCabecera], [fechaVenta], [TotalFactura], [Descuento], [TotalPagar], [idClienteFK]) VALUES (CAST(17 AS Numeric(4, 0)), CAST(N'2019-04-04' AS Date), CAST(25 AS Numeric(5, 0)), CAST(0 AS Numeric(4, 0)), CAST(25 AS Numeric(4, 0)), N'1736459091')
INSERT [dbo].[CabeceraFactura] ([idCabecera], [fechaVenta], [TotalFactura], [Descuento], [TotalPagar], [idClienteFK]) VALUES (CAST(18 AS Numeric(4, 0)), CAST(N'2019-03-31' AS Date), CAST(23 AS Numeric(5, 0)), CAST(0 AS Numeric(4, 0)), CAST(23 AS Numeric(4, 0)), N'1736459091')
INSERT [dbo].[CabeceraFactura] ([idCabecera], [fechaVenta], [TotalFactura], [Descuento], [TotalPagar], [idClienteFK]) VALUES (CAST(19 AS Numeric(4, 0)), CAST(N'2018-12-26' AS Date), CAST(30 AS Numeric(5, 0)), CAST(0 AS Numeric(4, 0)), CAST(30 AS Numeric(4, 0)), N'1765439087')
INSERT [dbo].[CabeceraFactura] ([idCabecera], [fechaVenta], [TotalFactura], [Descuento], [TotalPagar], [idClienteFK]) VALUES (CAST(20 AS Numeric(4, 0)), CAST(N'2018-11-22' AS Date), CAST(35 AS Numeric(5, 0)), CAST(0 AS Numeric(4, 0)), CAST(35 AS Numeric(4, 0)), N'1765439087')
INSERT [dbo].[CabeceraFactura] ([idCabecera], [fechaVenta], [TotalFactura], [Descuento], [TotalPagar], [idClienteFK]) VALUES (CAST(21 AS Numeric(4, 0)), CAST(N'2018-11-23' AS Date), CAST(9 AS Numeric(5, 0)), CAST(0 AS Numeric(4, 0)), CAST(9 AS Numeric(4, 0)), N'1765439087')
INSERT [dbo].[Clientes] ([nombreCl], [idCliente], [apellidoCl], [direccionCl], [telefonoCl], [fechaNacCl], [mailCl]) VALUES (N'Fabricio', N'1345097385', N'Barrazueta', N'Solanda', N'0225983843', CAST(N'1980-06-06' AS Date), N'fabricio.barrazueta@outlook.es')
INSERT [dbo].[Clientes] ([nombreCl], [idCliente], [apellidoCl], [direccionCl], [telefonoCl], [fechaNacCl], [mailCl]) VALUES (N'Esteban', N'1715437573', N'Salazar', N'Santa Maria', N'0981758433', CAST(N'1989-11-11' AS Date), N'esteban.paredes@outloo.ec')
INSERT [dbo].[Clientes] ([nombreCl], [idCliente], [apellidoCl], [direccionCl], [telefonoCl], [fechaNacCl], [mailCl]) VALUES (N'Andres', N'1715487375', N'Alvear', N'Recreo', N'0995476965', CAST(N'1996-12-12' AS Date), N'andres.alvear@outlook.ec')
INSERT [dbo].[Clientes] ([nombreCl], [idCliente], [apellidoCl], [direccionCl], [telefonoCl], [fechaNacCl], [mailCl]) VALUES (N'Gabriel', N'1716455490', N'Salgado', N'Mena 2', N'0984564450', CAST(N'1991-12-12' AS Date), N'gabriel.salgado@outlook.ec')
INSERT [dbo].[Clientes] ([nombreCl], [idCliente], [apellidoCl], [direccionCl], [telefonoCl], [fechaNacCl], [mailCl]) VALUES (N'Juan', N'1723450978', N'Perez', N'Cotocollado', N'0993145665', CAST(N'1996-03-24' AS Date), N'juan.perez@outlook.ec')
INSERT [dbo].[Clientes] ([nombreCl], [idCliente], [apellidoCl], [direccionCl], [telefonoCl], [fechaNacCl], [mailCl]) VALUES (N'Karla', N'1724057276', N'Chinacalle', N'San Carlos', N'0984048999', CAST(N'1998-08-03' AS Date), N'gabriel.salgado@outlook.ec')
INSERT [dbo].[Clientes] ([nombreCl], [idCliente], [apellidoCl], [direccionCl], [telefonoCl], [fechaNacCl], [mailCl]) VALUES (N'Aurora', N'1736459091', N'Cruz', N'Vicentina', N'0949455614', CAST(N'1970-09-22' AS Date), N'aurora.paredes@outlook.es')
INSERT [dbo].[Clientes] ([nombreCl], [idCliente], [apellidoCl], [direccionCl], [telefonoCl], [fechaNacCl], [mailCl]) VALUES (N'Cyntia', N'1745789310', N'Paredes', N'Calderon', N'0984567112', CAST(N'2000-01-07' AS Date), N'cyntia.paredes@outlook.ec')
INSERT [dbo].[Clientes] ([nombreCl], [idCliente], [apellidoCl], [direccionCl], [telefonoCl], [fechaNacCl], [mailCl]) VALUES (N'Xavier', N'1765439087', N'Caizapanta', N'Quicentro Sur', N'0966387922', CAST(N'1960-01-22' AS Date), N'xavier.caizapanta@outlook.ec')
INSERT [dbo].[Clientes] ([nombreCl], [idCliente], [apellidoCl], [direccionCl], [telefonoCl], [fechaNacCl], [mailCl]) VALUES (N'Analy', N'1912678390', N'Paredes', N'Carcelen', N'0979370819', CAST(N'1996-12-26' AS Date), N'analy.paredes@outlook.ec')
INSERT [dbo].[Especificacion] ([precioPr], [cantidadVendida], [totalParcial], [categoriaPr], [codigoPrFK]) VALUES (CAST(4 AS Numeric(3, 0)), CAST(3 AS Numeric(3, 0)), CAST(12 AS Numeric(3, 0)), N'entrada', CAST(2 AS Numeric(3, 0)))
INSERT [dbo].[Especificacion] ([precioPr], [cantidadVendida], [totalParcial], [categoriaPr], [codigoPrFK]) VALUES (CAST(2 AS Numeric(3, 0)), CAST(8 AS Numeric(3, 0)), CAST(16 AS Numeric(3, 0)), N'entrada', CAST(3 AS Numeric(3, 0)))
INSERT [dbo].[Especificacion] ([precioPr], [cantidadVendida], [totalParcial], [categoriaPr], [codigoPrFK]) VALUES (CAST(2 AS Numeric(3, 0)), CAST(3 AS Numeric(3, 0)), CAST(6 AS Numeric(3, 0)), N'entrada', CAST(5 AS Numeric(3, 0)))
INSERT [dbo].[Especificacion] ([precioPr], [cantidadVendida], [totalParcial], [categoriaPr], [codigoPrFK]) VALUES (CAST(5 AS Numeric(3, 0)), CAST(2 AS Numeric(3, 0)), CAST(10 AS Numeric(3, 0)), N'sopas', CAST(4 AS Numeric(3, 0)))
INSERT [dbo].[Especificacion] ([precioPr], [cantidadVendida], [totalParcial], [categoriaPr], [codigoPrFK]) VALUES (CAST(2 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)), CAST(2 AS Numeric(3, 0)), N'bebidas', CAST(9 AS Numeric(3, 0)))
INSERT [dbo].[Especificacion] ([precioPr], [cantidadVendida], [totalParcial], [categoriaPr], [codigoPrFK]) VALUES (CAST(5 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)), CAST(5 AS Numeric(3, 0)), N'sopas', CAST(4 AS Numeric(3, 0)))
INSERT [dbo].[Especificacion] ([precioPr], [cantidadVendida], [totalParcial], [categoriaPr], [codigoPrFK]) VALUES (CAST(1 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)), N'bebidas', NULL)
INSERT [dbo].[Especificacion] ([precioPr], [cantidadVendida], [totalParcial], [categoriaPr], [codigoPrFK]) VALUES (CAST(1 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)), N'bebidas', NULL)
INSERT [dbo].[Especificacion] ([precioPr], [cantidadVendida], [totalParcial], [categoriaPr], [codigoPrFK]) VALUES (CAST(2 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)), CAST(2 AS Numeric(3, 0)), N'postres', CAST(3 AS Numeric(3, 0)))
INSERT [dbo].[Especificacion] ([precioPr], [cantidadVendida], [totalParcial], [categoriaPr], [codigoPrFK]) VALUES (CAST(3 AS Numeric(3, 0)), CAST(3 AS Numeric(3, 0)), CAST(9 AS Numeric(3, 0)), N'postres', CAST(10 AS Numeric(3, 0)))
INSERT [dbo].[Factura] ([idDetalle], [cantidad], [subTotal], [formaPago], [idCabeceraFK], [codigoPrFK]) VALUES (CAST(10 AS Numeric(4, 0)), CAST(3 AS Numeric(4, 0)), CAST(6 AS Numeric(8, 0)), N'Efectivo', CAST(1 AS Numeric(4, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Factura] ([idDetalle], [cantidad], [subTotal], [formaPago], [idCabeceraFK], [codigoPrFK]) VALUES (CAST(11 AS Numeric(4, 0)), CAST(3 AS Numeric(4, 0)), CAST(12 AS Numeric(8, 0)), N'Tarjeta de credito', CAST(2 AS Numeric(4, 0)), CAST(2 AS Numeric(3, 0)))
INSERT [dbo].[Factura] ([idDetalle], [cantidad], [subTotal], [formaPago], [idCabeceraFK], [codigoPrFK]) VALUES (CAST(12 AS Numeric(4, 0)), CAST(8 AS Numeric(4, 0)), CAST(16 AS Numeric(8, 0)), N'Tarjeta de debito', CAST(3 AS Numeric(4, 0)), CAST(3 AS Numeric(3, 0)))
INSERT [dbo].[Factura] ([idDetalle], [cantidad], [subTotal], [formaPago], [idCabeceraFK], [codigoPrFK]) VALUES (CAST(13 AS Numeric(4, 0)), CAST(2 AS Numeric(4, 0)), CAST(10 AS Numeric(8, 0)), N'Efectivo', CAST(4 AS Numeric(4, 0)), CAST(5 AS Numeric(3, 0)))
INSERT [dbo].[Factura] ([idDetalle], [cantidad], [subTotal], [formaPago], [idCabeceraFK], [codigoPrFK]) VALUES (CAST(14 AS Numeric(4, 0)), CAST(1 AS Numeric(4, 0)), CAST(5 AS Numeric(8, 0)), N'Efectivo', CAST(1 AS Numeric(4, 0)), CAST(6 AS Numeric(3, 0)))
INSERT [dbo].[Factura] ([idDetalle], [cantidad], [subTotal], [formaPago], [idCabeceraFK], [codigoPrFK]) VALUES (CAST(15 AS Numeric(4, 0)), CAST(3 AS Numeric(4, 0)), CAST(9 AS Numeric(8, 0)), N'Efectivo', CAST(21 AS Numeric(4, 0)), CAST(10 AS Numeric(3, 0)))
INSERT [dbo].[Productos] ([codigoPr], [nombrePr], [precioPr], [stockPr], [categoriaPr]) VALUES (CAST(1 AS Numeric(3, 0)), N'tacos', CAST(2 AS Numeric(2, 0)), CAST(150 AS Numeric(4, 0)), N'entrada')
INSERT [dbo].[Productos] ([codigoPr], [nombrePr], [precioPr], [stockPr], [categoriaPr]) VALUES (CAST(2 AS Numeric(3, 0)), N'burritos', CAST(4 AS Numeric(2, 0)), CAST(20 AS Numeric(4, 0)), N'entrada')
INSERT [dbo].[Productos] ([codigoPr], [nombrePr], [precioPr], [stockPr], [categoriaPr]) VALUES (CAST(3 AS Numeric(3, 0)), N'enchiladas', CAST(2 AS Numeric(2, 0)), CAST(150 AS Numeric(4, 0)), N'entrada')
INSERT [dbo].[Productos] ([codigoPr], [nombrePr], [precioPr], [stockPr], [categoriaPr]) VALUES (CAST(4 AS Numeric(3, 0)), N'pozole', CAST(5 AS Numeric(2, 0)), CAST(10 AS Numeric(4, 0)), N'sopas')
INSERT [dbo].[Productos] ([codigoPr], [nombrePr], [precioPr], [stockPr], [categoriaPr]) VALUES (CAST(5 AS Numeric(3, 0)), N'te', CAST(2 AS Numeric(2, 0)), CAST(40 AS Numeric(4, 0)), N'bebidas')
INSERT [dbo].[Productos] ([codigoPr], [nombrePr], [precioPr], [stockPr], [categoriaPr]) VALUES (CAST(6 AS Numeric(3, 0)), N'sopa de tortilla', CAST(5 AS Numeric(2, 0)), CAST(8 AS Numeric(4, 0)), N'sopas')
INSERT [dbo].[Productos] ([codigoPr], [nombrePr], [precioPr], [stockPr], [categoriaPr]) VALUES (CAST(7 AS Numeric(3, 0)), N'jugo de naranja', CAST(1 AS Numeric(2, 0)), CAST(10 AS Numeric(4, 0)), N'bebidas')
INSERT [dbo].[Productos] ([codigoPr], [nombrePr], [precioPr], [stockPr], [categoriaPr]) VALUES (CAST(8 AS Numeric(3, 0)), N'agua', CAST(1 AS Numeric(2, 0)), CAST(25 AS Numeric(4, 0)), N'bebidas')
INSERT [dbo].[Productos] ([codigoPr], [nombrePr], [precioPr], [stockPr], [categoriaPr]) VALUES (CAST(9 AS Numeric(3, 0)), N'pastel de platano', CAST(2 AS Numeric(2, 0)), CAST(10 AS Numeric(4, 0)), N'postres')
INSERT [dbo].[Productos] ([codigoPr], [nombrePr], [precioPr], [stockPr], [categoriaPr]) VALUES (CAST(10 AS Numeric(3, 0)), N'torta de manzana', CAST(3 AS Numeric(2, 0)), CAST(10 AS Numeric(4, 0)), N'postres')
ALTER TABLE [dbo].[CabeceraFactura]  WITH CHECK ADD  CONSTRAINT [Clientes_CabeceraFactura] FOREIGN KEY([idClienteFK])
REFERENCES [dbo].[Clientes] ([idCliente])
GO
ALTER TABLE [dbo].[CabeceraFactura] CHECK CONSTRAINT [Clientes_CabeceraFactura]
GO
ALTER TABLE [dbo].[Especificacion]  WITH CHECK ADD  CONSTRAINT [Producto_Especificacion] FOREIGN KEY([codigoPrFK])
REFERENCES [dbo].[Productos] ([codigoPr])
GO
ALTER TABLE [dbo].[Especificacion] CHECK CONSTRAINT [Producto_Especificacion]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [CabeceraFactura_Factura] FOREIGN KEY([idCabeceraFK])
REFERENCES [dbo].[CabeceraFactura] ([idCabecera])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [CabeceraFactura_Factura]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [Producto_Factura] FOREIGN KEY([codigoPrFK])
REFERENCES [dbo].[Productos] ([codigoPr])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [Producto_Factura]
GO
