USE [Gradovi]
GO
/****** Object:  Table [dbo].[Adrese]    Script Date: 30.1.2023. 16:28:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adrese](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](200) NOT NULL,
	[KucniBroj] [nvarchar](10) NOT NULL,
	[Kat] [nvarchar](10) NULL,
	[IdGrada] [int] NULL,
 CONSTRAINT [PK_Adrese] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drzave]    Script Date: 30.1.2023. 16:28:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drzave](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](200) NOT NULL,
	[Kratica] [nvarchar](3) NOT NULL,
	[NazivEngleski] [nvarchar](200) NULL,
	[NazivKineski] [nvarchar](50) NULL,
 CONSTRAINT [PK_Drzave] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gradovi]    Script Date: 30.1.2023. 16:28:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gradovi](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](1000) NOT NULL,
	[PostanskiBroj] [nvarchar](5) NOT NULL,
	[IdDrzave] [int] NOT NULL,
 CONSTRAINT [PK_Gradovi] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Adrese] ON 
GO
INSERT [dbo].[Adrese] ([Id], [Naziv], [KucniBroj], [Kat], [IdGrada]) VALUES (2, N'Dolac', N'5', NULL, 4)
GO
INSERT [dbo].[Adrese] ([Id], [Naziv], [KucniBroj], [Kat], [IdGrada]) VALUES (3, N'Dolac', N'5', NULL, 5)
GO
INSERT [dbo].[Adrese] ([Id], [Naziv], [KucniBroj], [Kat], [IdGrada]) VALUES (4, N'Dolac', N'5', NULL, 6)
GO
INSERT [dbo].[Adrese] ([Id], [Naziv], [KucniBroj], [Kat], [IdGrada]) VALUES (5, N'Trg ', N'2', NULL, NULL)
GO
INSERT [dbo].[Adrese] ([Id], [Naziv], [KucniBroj], [Kat], [IdGrada]) VALUES (6, N'Trg', N'7', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Adrese] OFF
GO
SET IDENTITY_INSERT [dbo].[Drzave] ON 
GO
INSERT [dbo].[Drzave] ([Id], [Naziv], [Kratica], [NazivEngleski], [NazivKineski]) VALUES (1, N'Hrvatska', N'HR', N'Croatia', NULL)
GO
INSERT [dbo].[Drzave] ([Id], [Naziv], [Kratica], [NazivEngleski], [NazivKineski]) VALUES (2, N'Slovenija', N'SLO', N'Slovenia', NULL)
GO
INSERT [dbo].[Drzave] ([Id], [Naziv], [Kratica], [NazivEngleski], [NazivKineski]) VALUES (3, N'Italija', N'IT', NULL, NULL)
GO
INSERT [dbo].[Drzave] ([Id], [Naziv], [Kratica], [NazivEngleski], [NazivKineski]) VALUES (5, N'Francuska', N'FR', NULL, NULL)
GO
INSERT [dbo].[Drzave] ([Id], [Naziv], [Kratica], [NazivEngleski], [NazivKineski]) VALUES (6, N'Engleska', N'EN', NULL, NULL)
GO
INSERT [dbo].[Drzave] ([Id], [Naziv], [Kratica], [NazivEngleski], [NazivKineski]) VALUES (8, N'Austria', N'AU', NULL, NULL)
GO
INSERT [dbo].[Drzave] ([Id], [Naziv], [Kratica], [NazivEngleski], [NazivKineski]) VALUES (9, N'Kina', N'CH', N'China', NULL)
GO
INSERT [dbo].[Drzave] ([Id], [Naziv], [Kratica], [NazivEngleski], [NazivKineski]) VALUES (10, N'Njemačka', N'DE', N'', N'')
GO
SET IDENTITY_INSERT [dbo].[Drzave] OFF
GO
SET IDENTITY_INSERT [dbo].[Gradovi] ON 
GO
INSERT [dbo].[Gradovi] ([Id], [Naziv], [PostanskiBroj], [IdDrzave]) VALUES (4, N'Rijeka', N'51000', 1)
GO
INSERT [dbo].[Gradovi] ([Id], [Naziv], [PostanskiBroj], [IdDrzave]) VALUES (5, N'Zagreb', N'10000', 1)
GO
INSERT [dbo].[Gradovi] ([Id], [Naziv], [PostanskiBroj], [IdDrzave]) VALUES (6, N'Pula', N'52000', 1)
GO
INSERT [dbo].[Gradovi] ([Id], [Naziv], [PostanskiBroj], [IdDrzave]) VALUES (7, N'Ljubljana', N'1000', 2)
GO
INSERT [dbo].[Gradovi] ([Id], [Naziv], [PostanskiBroj], [IdDrzave]) VALUES (8, N'London', N'500', 6)
GO
INSERT [dbo].[Gradovi] ([Id], [Naziv], [PostanskiBroj], [IdDrzave]) VALUES (9, N'Šangaj', N'1000', 9)
GO
INSERT [dbo].[Gradovi] ([Id], [Naziv], [PostanskiBroj], [IdDrzave]) VALUES (11, N'Liverpool', N'2000', 6)
GO
SET IDENTITY_INSERT [dbo].[Gradovi] OFF
GO
ALTER TABLE [dbo].[Adrese]  WITH CHECK ADD  CONSTRAINT [FK_Adrese_Gradovi] FOREIGN KEY([IdGrada])
REFERENCES [dbo].[Gradovi] ([Id])
GO
ALTER TABLE [dbo].[Adrese] CHECK CONSTRAINT [FK_Adrese_Gradovi]
GO
ALTER TABLE [dbo].[Gradovi]  WITH CHECK ADD  CONSTRAINT [FK_Gradovi_Drzave] FOREIGN KEY([IdDrzave])
REFERENCES [dbo].[Drzave] ([Id])
GO
ALTER TABLE [dbo].[Gradovi] CHECK CONSTRAINT [FK_Gradovi_Drzave]
GO
