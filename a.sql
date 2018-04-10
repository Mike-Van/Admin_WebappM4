USE [WebApp]
GO

/****** Object:  Table [dbo].[Companies]    Script Date: 4/9/2018 8:12:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
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

SET ANSI_PADDING OFF
GO

