USE [master]
GO
/****** Object:  Database [WebApp]    Script Date: 5/19/2018 1:09:05 PM ******/
CREATE DATABASE [WebApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\WebApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\WebApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebApp] SET RECOVERY FULL 
GO
ALTER DATABASE [WebApp] SET  MULTI_USER 
GO
ALTER DATABASE [WebApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebApp] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebApp', N'ON'
GO
ALTER DATABASE [WebApp] SET QUERY_STORE = OFF
GO
USE [WebApp]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [WebApp]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 5/19/2018 1:09:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[CompId] [int] IDENTITY(1,1) NOT NULL,
	[CompImg] [varbinary](max) NULL,
	[CompName] [varchar](50) NULL,
	[CompRep] [varchar](50) NULL,
	[CompDOE] [date] NULL,
	[CompAddr] [varchar](50) NULL,
	[CompCat] [varchar](50) NULL,
	[CompEmail] [varchar](50) NULL,
	[CompCont] [varchar](50) NULL,
	[CompDesc] [varchar](max) NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[CompId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAccounts]    Script Date: 5/19/2018 1:09:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccounts](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[UserEmail] [varchar](50) NOT NULL,
	[UserPassword] [varchar](50) NOT NULL,
	[UserRole] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserAccounts] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [WebApp] SET  READ_WRITE 
GO
