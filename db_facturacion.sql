USE [master]
GO
/****** Object:  Database [Db_Facturacion]    Script Date: 17/9/2024 19:48:58 ******/
CREATE DATABASE [Db_Facturacion]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Db_Facturacion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Db_Facturacion.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Db_Facturacion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Db_Facturacion_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Db_Facturacion] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Db_Facturacion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Db_Facturacion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Db_Facturacion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Db_Facturacion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Db_Facturacion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Db_Facturacion] SET ARITHABORT OFF 
GO
ALTER DATABASE [Db_Facturacion] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Db_Facturacion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Db_Facturacion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Db_Facturacion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Db_Facturacion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Db_Facturacion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Db_Facturacion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Db_Facturacion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Db_Facturacion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Db_Facturacion] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Db_Facturacion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Db_Facturacion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Db_Facturacion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Db_Facturacion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Db_Facturacion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Db_Facturacion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Db_Facturacion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Db_Facturacion] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Db_Facturacion] SET  MULTI_USER 
GO
ALTER DATABASE [Db_Facturacion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Db_Facturacion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Db_Facturacion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Db_Facturacion] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Db_Facturacion] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Db_Facturacion]
GO
/****** Object:  Table [dbo].[Articulos]    Script Date: 17/9/2024 19:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Articulos](
	[id_articulo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[precio_unitario] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Detalles_facturas]    Script Date: 17/9/2024 19:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalles_facturas](
	[id_detalle] [int] NOT NULL,
	[nro_factura] [int] NOT NULL,
	[id_articulo] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_detalle] ASC,
	[nro_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 17/9/2024 19:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Facturas](
	[nro_factura] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[id_forma_pago] [int] NOT NULL,
	[cliente] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nro_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Formas_pagos]    Script Date: 17/9/2024 19:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Formas_pagos](
	[id_pago] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Detalles_facturas]  WITH CHECK ADD  CONSTRAINT [FK_DetallesArticulos] FOREIGN KEY([id_articulo])
REFERENCES [dbo].[Articulos] ([id_articulo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Detalles_facturas] CHECK CONSTRAINT [FK_DetallesArticulos]
GO
ALTER TABLE [dbo].[Detalles_facturas]  WITH CHECK ADD  CONSTRAINT [id_articulo] FOREIGN KEY([id_articulo])
REFERENCES [dbo].[Articulos] ([id_articulo])
GO
ALTER TABLE [dbo].[Detalles_facturas] CHECK CONSTRAINT [id_articulo]
GO
ALTER TABLE [dbo].[Detalles_facturas]  WITH CHECK ADD  CONSTRAINT [nro_factura] FOREIGN KEY([nro_factura])
REFERENCES [dbo].[Facturas] ([nro_factura])
GO
ALTER TABLE [dbo].[Detalles_facturas] CHECK CONSTRAINT [nro_factura]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [id_forma_pago] FOREIGN KEY([id_forma_pago])
REFERENCES [dbo].[Formas_pagos] ([id_pago])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [id_forma_pago]
GO
/****** Object:  StoredProcedure [dbo].[BORRAR_ARTICULOS]    Script Date: 17/9/2024 19:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BORRAR_ARTICULOS]
    @id_articulo INT
AS
BEGIN
    DELETE FROM Articulos
    WHERE id_articulo = @id_articulo;
END

GO
/****** Object:  StoredProcedure [dbo].[BORRAR_DETALLES]    Script Date: 17/9/2024 19:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BORRAR_DETALLES]
    @id_detalle INT
AS
BEGIN
    DELETE FROM Detalles_facturas
    WHERE id_detalle = @id_detalle
END

GO
/****** Object:  StoredProcedure [dbo].[BORRAR_FACTURAS]    Script Date: 17/9/2024 19:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BORRAR_FACTURAS]
    @nro_factura INT
AS
BEGIN
    DELETE FROM Facturas
    WHERE nro_factura = @nro_factura
END

GO
/****** Object:  StoredProcedure [dbo].[BORRAR_FORMAS_PAGOS]    Script Date: 17/9/2024 19:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BORRAR_FORMAS_PAGOS]
    @id_pago INT
AS
BEGIN
    DELETE FROM Formas_pagos
    WHERE id_pago = @id_pago
END


GO
/****** Object:  StoredProcedure [dbo].[GUARDAR_ARTICULOS]    Script Date: 17/9/2024 19:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GUARDAR_ARTICULOS]
@id_articulo INT,
@nombre VARCHAR (20),
@precio_unitario FLOAT

AS
BEGIN
if @id_articulo = 0
BEGIN 
INSERT INTO Articulos (nombre, precio_unitario)
VALUES (@nombre, @precio_unitario)
END
ELSE
BEGIN
UPDATE Articulos
SET nombre = @nombre, precio_unitario = @precio_unitario
WHERE id_articulo = @id_articulo
END
END


GO
/****** Object:  StoredProcedure [dbo].[GUARDAR_DETALLES]    Script Date: 17/9/2024 19:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GUARDAR_DETALLES]
    @id_detalle INT = 0,
    @nro_factura INT,
    @id_articulo INT,
    @cantidad INT
AS
BEGIN
    IF @id_detalle = 0
    BEGIN
        INSERT INTO Detalles_facturas (id_detalle, nro_factura, id_articulo, cantidad)
        VALUES (@id_detalle, @nro_factura, @id_articulo, @cantidad);

        SELECT @id_detalle = @id_detalle
    END
    ELSE
    BEGIN
        UPDATE Detalles_facturas
        SET id_detalle = @id_detalle, nro_factura = @nro_factura, id_articulo = @id_articulo, cantidad = @cantidad
        WHERE id_detalle = @id_detalle;
    END

    SELECT @id_detalle AS Id_detalle;
END

GO
/****** Object:  StoredProcedure [dbo].[GUARDAR_FACTURA]    Script Date: 17/9/2024 19:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GUARDAR_FACTURA]
@nro_factura INT,
@fecha DATETIME,
@id_forma_pago INT,
@cliente VARCHAR (20)

AS
BEGIN
if @nro_factura = 0
BEGIN 
INSERT INTO Facturas(fecha, id_forma_pago, cliente)
VALUES (@fecha, @id_forma_pago, @cliente)
END
ELSE
BEGIN
UPDATE Facturas
SET fecha = @fecha, id_forma_pago = @id_forma_pago, cliente = @cliente
WHERE nro_factura = @nro_factura
END
END


GO
/****** Object:  StoredProcedure [dbo].[GUARDAR_FORMA_PAGO]    Script Date: 17/9/2024 19:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GUARDAR_FORMA_PAGO]
@id_pago INT,
@nombre VARCHAR (20)

AS
BEGIN
if @id_pago = 0
BEGIN 
INSERT INTO Formas_pagos(nombre)
VALUES (@nombre)
END
ELSE
BEGIN
UPDATE Formas_pagos
SET nombre = @nombre
WHERE id_pago = @id_pago
END
END


GO
/****** Object:  StoredProcedure [dbo].[INSERTAR_DETALLES]    Script Date: 17/9/2024 19:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTAR_DETALLES]
@id_detalle INT,
@nro_factura INT,
@id_articulo INT,
@cantidad INT
AS
BEGIN
     INSERT INTO Detalles_facturas(id_detalle, id_articulo, cantidad) VALUES (@nro_factura, @id_articulo, @cantidad)
END


GO
/****** Object:  StoredProcedure [dbo].[INSERTAR_MAESTRO]    Script Date: 17/9/2024 19:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTAR_MAESTRO]
@cliente VARCHAR (50),
@id_pago INT,
@id INT OUTPUT
AS
BEGIN
     INSERT INTO Facturas(id_forma_pago, cliente, fecha) VALUES (@id_pago, @cliente, GETDATE());
	 SET @id = @@IDENTITY
END


GO
/****** Object:  StoredProcedure [dbo].[OBTENER_ARTICULOS_ID]    Script Date: 17/9/2024 19:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OBTENER_ARTICULOS_ID]
	@id_articulo int
AS
BEGIN
	SELECT * FROM Articulos WHERE id_articulo = @id_articulo;
END

GO
/****** Object:  StoredProcedure [dbo].[OBTENER_ARTICULOS_TODOS]    Script Date: 17/9/2024 19:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OBTENER_ARTICULOS_TODOS]
AS
BEGIN
	SELECT * FROM Articulos
END

GO
/****** Object:  StoredProcedure [dbo].[OBTENER_DETALLE_ID]    Script Date: 17/9/2024 19:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OBTENER_DETALLE_ID]
	@id_detalle int
AS
BEGIN
	SELECT * FROM Detalles_facturas WHERE id_detalle = @id_detalle;
END

GO
/****** Object:  StoredProcedure [dbo].[OBTENER_DETALLES_TODOS]    Script Date: 17/9/2024 19:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OBTENER_DETALLES_TODOS]
AS
BEGIN
	SELECT * FROM Detalles_facturas
END

GO
/****** Object:  StoredProcedure [dbo].[OBTENER_FACTURA_ID]    Script Date: 17/9/2024 19:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OBTENER_FACTURA_ID]
	@nro_factura int
AS
BEGIN
	SELECT * FROM Facturas WHERE nro_factura = @nro_factura;
END

GO
/****** Object:  StoredProcedure [dbo].[OBTENER_FACTURAS_TODAS]    Script Date: 17/9/2024 19:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OBTENER_FACTURAS_TODAS]
AS
BEGIN
	SELECT * FROM Facturas
END

GO
/****** Object:  StoredProcedure [dbo].[OBTENER_PAGO_ID]    Script Date: 17/9/2024 19:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OBTENER_PAGO_ID]
	@id_pago int
AS
BEGIN
	SELECT * FROM Formas_pagos WHERE id_pago = @id_pago;
END

GO
/****** Object:  StoredProcedure [dbo].[OBTENER_PAGOS_TODOS]    Script Date: 17/9/2024 19:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OBTENER_PAGOS_TODOS]
AS
BEGIN
	SELECT * FROM Formas_pagos
END

GO
/****** Object:  StoredProcedure [dbo].[OBTENER_PRODUCTOS_TODOS]    Script Date: 17/9/2024 19:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OBTENER_PRODUCTOS_TODOS]
AS
BEGIN
	SELECT * FROM Facturas
END

GO
USE [master]
GO
ALTER DATABASE [Db_Facturacion] SET  READ_WRITE 
GO
