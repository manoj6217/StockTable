USE [master]
GO
/****** Object:  Database [StocksUpdateDB]    Script Date: 26-03-2023 09:56:02 PM ******/
CREATE DATABASE [StocksUpdateDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StocksUpdateDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS2019\MSSQL\DATA\StocksUpdateDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StocksUpdateDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS2019\MSSQL\DATA\StocksUpdateDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StocksUpdateDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StocksUpdateDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StocksUpdateDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StocksUpdateDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StocksUpdateDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StocksUpdateDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StocksUpdateDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [StocksUpdateDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StocksUpdateDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StocksUpdateDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StocksUpdateDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StocksUpdateDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StocksUpdateDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StocksUpdateDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StocksUpdateDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StocksUpdateDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [StocksUpdateDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StocksUpdateDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StocksUpdateDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StocksUpdateDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StocksUpdateDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StocksUpdateDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StocksUpdateDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StocksUpdateDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StocksUpdateDB] SET  MULTI_USER 
GO
ALTER DATABASE [StocksUpdateDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StocksUpdateDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StocksUpdateDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StocksUpdateDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [StocksUpdateDB]
GO
/****** Object:  User [saa]    Script Date: 26-03-2023 09:56:02 PM ******/
CREATE USER [saa] FOR LOGIN [saa] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [saa]
GO
/****** Object:  Table [dbo].[Mst_Stocks]    Script Date: 26-03-2023 09:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mst_Stocks](
	[StockId] [int] IDENTITY(1,1) NOT NULL,
	[StockSymbol] [varchar](4) NULL,
	[Price] [decimal](18, 4) NULL,
	[Change] [decimal](18, 4) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__Mst_Stoc__2C83A9C2C5672F26] PRIMARY KEY CLUSTERED 
(
	[StockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Mst_Stocks] ON 

INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (339, N'CSCO', CAST(22.7669 AS Decimal(18, 4)), CAST(0.0669 AS Decimal(18, 4)), CAST(N'2023-03-26T20:38:57.300' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (340, N'AAPL', CAST(58.9590 AS Decimal(18, 4)), CAST(4.0590 AS Decimal(18, 4)), CAST(N'2023-03-26T20:38:57.653' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (341, N'YHOO', CAST(41.1060 AS Decimal(18, 4)), CAST(1.2060 AS Decimal(18, 4)), CAST(N'2023-03-26T20:38:57.657' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (342, N'GOOG', CAST(62.9610 AS Decimal(18, 4)), CAST(7.0610 AS Decimal(18, 4)), CAST(N'2023-03-26T20:38:57.663' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (343, N'YHOO', CAST(41.0244 AS Decimal(18, 4)), CAST(1.1244 AS Decimal(18, 4)), CAST(N'2023-03-26T20:38:58.403' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (344, N'DELL', CAST(20.5392 AS Decimal(18, 4)), CAST(2.6392 AS Decimal(18, 4)), CAST(N'2023-03-26T20:38:58.417' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (345, N'INTC', CAST(24.4424 AS Decimal(18, 4)), CAST(-0.4575 AS Decimal(18, 4)), CAST(N'2023-03-26T20:38:59.383' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (346, N'CSCO', CAST(23.3716 AS Decimal(18, 4)), CAST(0.6716 AS Decimal(18, 4)), CAST(N'2023-03-26T20:38:59.400' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (347, N'YHOO', CAST(40.1227 AS Decimal(18, 4)), CAST(0.2227 AS Decimal(18, 4)), CAST(N'2023-03-26T20:38:59.407' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (348, N'ORCL', CAST(38.4720 AS Decimal(18, 4)), CAST(0.5720 AS Decimal(18, 4)), CAST(N'2023-03-26T20:38:59.883' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (349, N'YHOO', CAST(40.7184 AS Decimal(18, 4)), CAST(0.8184 AS Decimal(18, 4)), CAST(N'2023-03-26T20:38:59.897' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (350, N'MSFT', CAST(38.1321 AS Decimal(18, 4)), CAST(1.6321 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:00.447' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (351, N'AAPL', CAST(58.2719 AS Decimal(18, 4)), CAST(3.3719 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:00.883' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (352, N'YHOO', CAST(40.7959 AS Decimal(18, 4)), CAST(0.8959 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:00.900' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (353, N'ORCL', CAST(38.4987 AS Decimal(18, 4)), CAST(0.5987 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:01.473' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (354, N'LVLT', CAST(31.4741 AS Decimal(18, 4)), CAST(-1.4258 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:01.487' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (355, N'MSFT', CAST(37.9613 AS Decimal(18, 4)), CAST(1.4613 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:02.883' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (356, N'ORCL', CAST(38.0947 AS Decimal(18, 4)), CAST(0.1947 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:02.907' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (357, N'LVLT', CAST(31.5792 AS Decimal(18, 4)), CAST(-1.3207 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:02.917' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (358, N'LVLT', CAST(32.0283 AS Decimal(18, 4)), CAST(-0.8716 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:03.883' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (359, N'INTC', CAST(24.6213 AS Decimal(18, 4)), CAST(-0.2786 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:04.440' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (360, N'AAPL', CAST(59.7930 AS Decimal(18, 4)), CAST(4.8930 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:04.457' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (361, N'HOKU', CAST(109.4720 AS Decimal(18, 4)), CAST(-11.7280 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:04.463' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (362, N'AAPL', CAST(58.1309 AS Decimal(18, 4)), CAST(3.2309 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:04.887' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (363, N'AAPL', CAST(59.5287 AS Decimal(18, 4)), CAST(4.6287 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:06.897' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (364, N'LVLT', CAST(32.3468 AS Decimal(18, 4)), CAST(-0.5531 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:06.953' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (365, N'GOOG', CAST(63.9293 AS Decimal(18, 4)), CAST(8.0293 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:07.383' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (366, N'HOKU', CAST(110.8250 AS Decimal(18, 4)), CAST(-10.3750 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:08.437' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (367, N'SIRI', CAST(30.6577 AS Decimal(18, 4)), CAST(-0.0422 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:08.947' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (368, N'ORCL', CAST(38.0452 AS Decimal(18, 4)), CAST(0.1452 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:08.957' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (369, N'CSCO', CAST(22.6175 AS Decimal(18, 4)), CAST(-0.0824 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:09.970' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (370, N'SIRI', CAST(30.5257 AS Decimal(18, 4)), CAST(-0.1742 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:09.987' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (371, N'INTC', CAST(24.5393 AS Decimal(18, 4)), CAST(-0.3606 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:10.387' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (372, N'AMAT', CAST(17.8635 AS Decimal(18, 4)), CAST(0.3635 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:10.397' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (373, N'INTC', CAST(24.7257 AS Decimal(18, 4)), CAST(-0.1742 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:10.893' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (374, N'LVLT', CAST(32.0347 AS Decimal(18, 4)), CAST(-0.8652 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:10.907' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (375, N'YHOO', CAST(40.9876 AS Decimal(18, 4)), CAST(1.0876 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:11.390' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (376, N'CSCO', CAST(22.8819 AS Decimal(18, 4)), CAST(0.1819 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:11.883' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (377, N'HOKU', CAST(111.1440 AS Decimal(18, 4)), CAST(-10.0560 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:11.893' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (378, N'AMAT', CAST(17.6628 AS Decimal(18, 4)), CAST(0.1628 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:12.427' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (379, N'SIRI', CAST(30.7100 AS Decimal(18, 4)), CAST(0.0100 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:12.887' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (380, N'AAPL', CAST(57.6493 AS Decimal(18, 4)), CAST(2.7493 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:12.900' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (381, N'LVLT', CAST(31.5760 AS Decimal(18, 4)), CAST(-1.3239 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:12.913' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (382, N'ORCL', CAST(37.6526 AS Decimal(18, 4)), CAST(-0.2473 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:13.450' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (383, N'SIRI', CAST(30.3414 AS Decimal(18, 4)), CAST(-0.3585 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:13.883' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (384, N'INTC', CAST(24.7257 AS Decimal(18, 4)), CAST(-0.1742 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:14.987' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (385, N'AMAT', CAST(17.8424 AS Decimal(18, 4)), CAST(0.3424 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:15.033' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (386, N'YHOO', CAST(41.3181 AS Decimal(18, 4)), CAST(1.4181 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:15.043' AS DateTime))
INSERT [dbo].[Mst_Stocks] ([StockId], [StockSymbol], [Price], [Change], [UpdatedDate]) VALUES (387, N'LVLT', CAST(31.6270 AS Decimal(18, 4)), CAST(-1.2729 AS Decimal(18, 4)), CAST(N'2023-03-26T20:39:15.390' AS DateTime))
SET IDENTITY_INSERT [dbo].[Mst_Stocks] OFF
GO
USE [master]
GO
ALTER DATABASE [StocksUpdateDB] SET  READ_WRITE 
GO
