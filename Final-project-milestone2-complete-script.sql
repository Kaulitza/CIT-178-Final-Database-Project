USE [master]
GO
/****** Object:  Database [Final Project]    Script Date: 10/7/2019 3:04:32 PM ******/
CREATE DATABASE [Final Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Final Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Final Project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Final Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Final Project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Final Project] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Final Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Final Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Final Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Final Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Final Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Final Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [Final Project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Final Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Final Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Final Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Final Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Final Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Final Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Final Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Final Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Final Project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Final Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Final Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Final Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Final Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Final Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Final Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Final Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Final Project] SET RECOVERY FULL 
GO
ALTER DATABASE [Final Project] SET  MULTI_USER 
GO
ALTER DATABASE [Final Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Final Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Final Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Final Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Final Project] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Final Project', N'ON'
GO
ALTER DATABASE [Final Project] SET QUERY_STORE = OFF
GO
USE [Final Project]
GO
/****** Object:  Table [dbo].[Contractors]    Script Date: 10/7/2019 3:04:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contractors](
	[ContractorID] [int] NOT NULL,
	[ContractorName] [varchar](30) NOT NULL,
	[ContractoCompany] [varchar](30) NOT NULL,
	[ContractorCountry] [varchar](30) NOT NULL,
	[ContractorEmail] [varchar](50) NOT NULL,
	[ContractorZip] [varchar](12) NOT NULL,
	[ContractorBank] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Contractors] PRIMARY KEY CLUSTERED 
(
	[ContractorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Costs]    Script Date: 10/7/2019 3:04:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Costs](
	[CostID] [int] NOT NULL,
	[Value] [decimal](18, 0) NOT NULL,
	[Language] [varchar](20) NOT NULL,
	[QualityID] [int] NOT NULL,
 CONSTRAINT [PK_Costs] PRIMARY KEY CLUSTERED 
(
	[CostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 10/7/2019 3:04:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[CustomerID] [int] NOT NULL,
	[CustomerName] [varchar](30) NOT NULL,
	[CustomerAddress] [varbinary](50) NOT NULL,
	[CustomerCountry] [varchar](30) NOT NULL,
	[CustomerZip] [varchar](12) NOT NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Files]    Script Date: 10/7/2019 3:04:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Files](
	[FileName] [varchar](50) NOT NULL,
	[FileLength] [time](7) NOT NULL,
	[FileLanguage] [varchar](30) NOT NULL,
	[FileDeadline] [date] NOT NULL,
	[FileRequirements] [varchar](50) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ContractorID] [int] NOT NULL,
	[CostID] [int] NOT NULL,
 CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED 
(
	[FileName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 10/7/2019 3:04:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceID] [varchar](30) NOT NULL,
	[InvoicePaid] [varchar](3) NOT NULL,
	[InvoiceTotal] [money] NOT NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 10/7/2019 3:04:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[OrderID] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[ContractorID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order on Invoice]    Script Date: 10/7/2019 3:04:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order on Invoice](
	[OrderID] [int] NOT NULL,
	[InvoiceID] [varchar](30) NOT NULL,
	[Cost] [money] NOT NULL,
 CONSTRAINT [PK_Order on Invoice] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostalCode]    Script Date: 10/7/2019 3:04:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostalCode](
	[ZipCode] [varchar](12) NOT NULL,
	[City] [varchar](30) NOT NULL,
	[StateProvince] [varchar](30) NOT NULL,
	[Country] [varchar](30) NOT NULL,
	[TimeZone] [varchar](12) NULL,
 CONSTRAINT [PK_PostalCode] PRIMARY KEY CLUSTERED 
(
	[ZipCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Qualities]    Script Date: 10/7/2019 3:04:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Qualities](
	[QualityID] [int] NOT NULL,
	[Quality] [varchar](12) NOT NULL,
 CONSTRAINT [PK_Qualities] PRIMARY KEY CLUSTERED 
(
	[QualityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contractors]  WITH CHECK ADD  CONSTRAINT [FK_Contractors_PostalCode] FOREIGN KEY([ContractorZip])
REFERENCES [dbo].[PostalCode] ([ZipCode])
GO
ALTER TABLE [dbo].[Contractors] CHECK CONSTRAINT [FK_Contractors_PostalCode]
GO
ALTER TABLE [dbo].[Costs]  WITH CHECK ADD  CONSTRAINT [FK_Costs_Qualities] FOREIGN KEY([QualityID])
REFERENCES [dbo].[Qualities] ([QualityID])
GO
ALTER TABLE [dbo].[Costs] CHECK CONSTRAINT [FK_Costs_Qualities]
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [FK_customer_PostalCode] FOREIGN KEY([CustomerZip])
REFERENCES [dbo].[PostalCode] ([ZipCode])
GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [FK_customer_PostalCode]
GO
ALTER TABLE [dbo].[Files]  WITH CHECK ADD  CONSTRAINT [FK_Files_Contractors] FOREIGN KEY([ContractorID])
REFERENCES [dbo].[Contractors] ([ContractorID])
GO
ALTER TABLE [dbo].[Files] CHECK CONSTRAINT [FK_Files_Contractors]
GO
ALTER TABLE [dbo].[Files]  WITH CHECK ADD  CONSTRAINT [FK_Files_Costs] FOREIGN KEY([CostID])
REFERENCES [dbo].[Costs] ([CostID])
GO
ALTER TABLE [dbo].[Files] CHECK CONSTRAINT [FK_Files_Costs]
GO
ALTER TABLE [dbo].[Files]  WITH CHECK ADD  CONSTRAINT [FK_Files_customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Files] CHECK CONSTRAINT [FK_Files_customer]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_Contractors] FOREIGN KEY([ContractorID])
REFERENCES [dbo].[Contractors] ([ContractorID])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_Contractors]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_Contractors1] FOREIGN KEY([ContractorID])
REFERENCES [dbo].[Contractors] ([ContractorID])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_Contractors1]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[customer] ([CustomerID])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_customer]
GO
ALTER TABLE [dbo].[Order on Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Order on Invoice_Invoice] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoice] ([InvoiceID])
GO
ALTER TABLE [dbo].[Order on Invoice] CHECK CONSTRAINT [FK_Order on Invoice_Invoice]
GO
ALTER TABLE [dbo].[Order on Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Order on Invoice_Orders] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoice] ([InvoiceID])
GO
ALTER TABLE [dbo].[Order on Invoice] CHECK CONSTRAINT [FK_Order on Invoice_Orders]
GO
ALTER TABLE [dbo].[Costs]  WITH CHECK ADD  CONSTRAINT [CK_Values] CHECK  (([Value]>=(1) AND [Value]<=(1.2)))
GO
ALTER TABLE [dbo].[Costs] CHECK CONSTRAINT [CK_Values]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [CK_InvoicePaid] CHECK  (([InvoicePaid]='yes' OR [InvoicePaid]='no'))
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [CK_InvoicePaid]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ensures value is between 1 and 1.2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Costs', @level2type=N'CONSTRAINT',@level2name=N'CK_Values'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ensures InvoicePaid cannot have another value than yes or no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Invoice', @level2type=N'CONSTRAINT',@level2name=N'CK_InvoicePaid'
GO
USE [master]
GO
ALTER DATABASE [Final Project] SET  READ_WRITE 
GO
