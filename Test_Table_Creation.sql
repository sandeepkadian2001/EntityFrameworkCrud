USE [TestDb]
GO

/****** Object:  Table [dbo].[tblLevel]    Script Date: 09/01/2022 22:37:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblLevel](
	[LevelId] [int] IDENTITY(1,1) NOT NULL,
	[LevelType] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblLevel] PRIMARY KEY CLUSTERED 
(
	[LevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[Employees]    Script Date: 09/01/2022 22:37:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[LevelId] [int] NOT NULL,
	[Address] [varchar](250) NULL,
	[Designation] [varchar](50) NULL,
	[Salary] [decimal](18, 0) NOT NULL,
	[JoiningDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Employees] ADD  DEFAULT (getdate()) FOR [JoiningDate]
GO

ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_tblLevel] FOREIGN KEY([LevelId])
REFERENCES [dbo].[tblLevel] ([LevelId])
GO

ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_tblLevel]
GO