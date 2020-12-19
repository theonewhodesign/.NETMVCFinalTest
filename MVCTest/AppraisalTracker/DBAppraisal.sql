USE [DBAppraisal]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 12/14/2020 4:55:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](20) NOT NULL,
	[Password] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appraisal]    Script Date: 12/14/2020 4:55:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appraisal](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[EmpName] [varchar](50) NOT NULL,
	[Description] [varchar](150) NOT NULL,
	[OLDSalary] [int] NOT NULL,
	[NewSalary] [int] NOT NULL,
 CONSTRAINT [PK_Appraisal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/14/2020 4:55:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmpName] [varchar](50) NOT NULL,
	[Contact] [varchar](10) NOT NULL,
	[JoinDate] [date] NOT NULL,
	[Salary] [int] NOT NULL,
	[TotalExperience] [int] NOT NULL,
	[AppraisalDate] [date] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 
GO
INSERT [dbo].[Admin] ([ID], [Username], [Password]) VALUES (1, N'Admin', N'admin')
GO
INSERT [dbo].[Admin] ([ID], [Username], [Password]) VALUES (2, N'yash', N'admin')
GO
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Appraisal] ON 
GO
INSERT [dbo].[Appraisal] ([ID], [EmployeeID], [EmpName], [Description], [OLDSalary], [NewSalary]) VALUES (1, 6, N'Sikandar Thakur', N'Cordial with a demonstrated desire to assist others in a polite and respectful manner. ', 505000, 512000)
GO
INSERT [dbo].[Appraisal] ([ID], [EmployeeID], [EmpName], [Description], [OLDSalary], [NewSalary]) VALUES (2, 3, N'Kalpesh Patil', N'Manages time effectively to complete assignments without prompting.', 400000, 403000)
GO
SET IDENTITY_INSERT [dbo].[Appraisal] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 
GO
INSERT [dbo].[Employee] ([ID], [EmpName], [Contact], [JoinDate], [Salary], [TotalExperience], [AppraisalDate]) VALUES (1, N'Pranali Yeole', N'0123456789', CAST(N'2020-11-12' AS Date), 300000, 5, CAST(N'2021-11-12' AS Date))
GO
INSERT [dbo].[Employee] ([ID], [EmpName], [Contact], [JoinDate], [Salary], [TotalExperience], [AppraisalDate]) VALUES (2, N'Yash Sonawane', N'0123456789', CAST(N'2018-11-12' AS Date), 300000, 3, CAST(N'2019-11-12' AS Date))
GO
INSERT [dbo].[Employee] ([ID], [EmpName], [Contact], [JoinDate], [Salary], [TotalExperience], [AppraisalDate]) VALUES (3, N'Kalpesh Patil', N'0123456789', CAST(N'2019-11-12' AS Date), 403000, 3, CAST(N'2020-11-12' AS Date))
GO
INSERT [dbo].[Employee] ([ID], [EmpName], [Contact], [JoinDate], [Salary], [TotalExperience], [AppraisalDate]) VALUES (5, N'Varad Kale', N'1234567890', CAST(N'2019-11-12' AS Date), 230000, 5, CAST(N'2020-11-12' AS Date))
GO
INSERT [dbo].[Employee] ([ID], [EmpName], [Contact], [JoinDate], [Salary], [TotalExperience], [AppraisalDate]) VALUES (6, N'Sikandar Thakur', N'1324564601', CAST(N'2019-12-12' AS Date), 512000, 1, CAST(N'2020-11-12' AS Date))
GO
INSERT [dbo].[Employee] ([ID], [EmpName], [Contact], [JoinDate], [Salary], [TotalExperience], [AppraisalDate]) VALUES (7, N'Bhushan Ahire', N'8550212345', CAST(N'2019-12-14' AS Date), 750000, 5, CAST(N'2019-12-14' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
ALTER TABLE [dbo].[Appraisal]  WITH CHECK ADD  CONSTRAINT [FK_Appraisal_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Appraisal] CHECK CONSTRAINT [FK_Appraisal_Employee]
GO
