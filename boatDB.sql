USE [master]
GO
/****** Object:  Database [BoatManagement9]    Script Date: 10/26/2022 4:57:03 PM ******/
CREATE DATABASE [BoatManagement9]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BoatManagement9', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\BoatManagement9.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BoatManagement9_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\BoatManagement9_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BoatManagement9] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BoatManagement9].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BoatManagement9] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BoatManagement9] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BoatManagement9] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BoatManagement9] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BoatManagement9] SET ARITHABORT OFF 
GO
ALTER DATABASE [BoatManagement9] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BoatManagement9] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BoatManagement9] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BoatManagement9] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BoatManagement9] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BoatManagement9] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BoatManagement9] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BoatManagement9] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BoatManagement9] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BoatManagement9] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BoatManagement9] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BoatManagement9] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BoatManagement9] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BoatManagement9] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BoatManagement9] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BoatManagement9] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BoatManagement9] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BoatManagement9] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BoatManagement9] SET  MULTI_USER 
GO
ALTER DATABASE [BoatManagement9] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BoatManagement9] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BoatManagement9] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BoatManagement9] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BoatManagement9] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BoatManagement9] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BoatManagement9] SET QUERY_STORE = OFF
GO
USE [BoatManagement9]
GO
/****** Object:  Table [dbo].[boats]    Script Date: 10/26/2022 4:57:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[boats](
	[bid] [int] NOT NULL,
	[bname] [varchar](50) NULL,
	[color] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[bid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reserves]    Script Date: 10/26/2022 4:57:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reserves](
	[sid] [int] NOT NULL,
	[bid] [int] NOT NULL,
	[day] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[sid] ASC,
	[bid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sailors]    Script Date: 10/26/2022 4:57:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sailors](
	[sid] [int] NOT NULL,
	[sname] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[rating] [int] NULL,
	[age] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[boats] ([bid], [bname], [color]) VALUES (1, N'boat1', N'red')
INSERT [dbo].[boats] ([bid], [bname], [color]) VALUES (2, N'boat2', N'green')
INSERT [dbo].[boats] ([bid], [bname], [color]) VALUES (3, N'boat3', N'orange')
INSERT [dbo].[boats] ([bid], [bname], [color]) VALUES (4, N'boat4', N'blue')
GO
INSERT [dbo].[sailors] ([sid], [sname], [password], [rating], [age]) VALUES (1, N'sailor1', N'1234', 3, 22)
INSERT [dbo].[sailors] ([sid], [sname], [password], [rating], [age]) VALUES (2, N'sailor2', N'1234', 4, 23)
INSERT [dbo].[sailors] ([sid], [sname], [password], [rating], [age]) VALUES (3, N'sailor3', N'1234', 5, 24)
INSERT [dbo].[sailors] ([sid], [sname], [password], [rating], [age]) VALUES (4, N'sailor4', N'1234', 5, 24)
GO
ALTER TABLE [dbo].[sailors] ADD  DEFAULT ((15)) FOR [age]
GO
ALTER TABLE [dbo].[reserves]  WITH CHECK ADD FOREIGN KEY([bid])
REFERENCES [dbo].[boats] ([bid])
GO
ALTER TABLE [dbo].[reserves]  WITH CHECK ADD FOREIGN KEY([sid])
REFERENCES [dbo].[sailors] ([sid])
GO
ALTER TABLE [dbo].[sailors]  WITH CHECK ADD CHECK  (([rating]>=(1) AND [rating]<=(10)))
GO
USE [master]
GO
ALTER DATABASE [BoatManagement9] SET  READ_WRITE 
GO
