SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historique_Adsl](
	[Historique_Adsl] [int] IDENTITY(1,1) NOT NULL,
	[Historique_Adsl_ID] [int] NOT NULL,
	[Historique_Adsl_Statut_Ancien] [int] NULL,
	[Historique_Adsl_Statut_Nouveau] [int] NULL,
	[Historique_Adsl_Identificateur_Ancien] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[Historique_Adsl_Identificateur_Nouveau] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[Historique_Adsl_Description_Ancien] [varchar](max) COLLATE Arabic_CI_AS NULL,
	[Historique_Adsl_Description_Nouveau] [varchar](max) COLLATE Arabic_CI_AS NULL,
	[Historique_Adsl_Date] [datetime] NULL,
	[Historique_Adsl_Personnel] [varchar](50) COLLATE Arabic_CI_AS NULL,
 CONSTRAINT [PK_Historique_Adsl] PRIMARY KEY CLUSTERED 
(
	[Historique_Adsl] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historique_FrameRelay](
	[Historique_Framerelay] [int] IDENTITY(1,1) NOT NULL,
	[Historique_Framerelay_ID] [int] NOT NULL,
	[Historique_Framerelay_Statut_Ancien] [int] NULL,
	[Historique_Framerelay_Statut_Nouveau] [int] NULL,
	[Historique_Framerelay_Identificateur_Ancien] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[Historique_Framerelay_Identificateur_Nouveau] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[Historique_Framerelay_Description_Ancien] [varchar](max) COLLATE Arabic_CI_AS NULL,
	[Historique_Framerelay_Description_Nouveau] [varchar](max) COLLATE Arabic_CI_AS NULL,
	[Historique_Framerelay_Date] [datetime] NULL,
	[Historique_Framerelay_Personnel] [varchar](50) COLLATE Arabic_CI_AS NULL,
 CONSTRAINT [PK_Historique_FrameRelay] PRIMARY KEY CLUSTERED 
(
	[Historique_Framerelay] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historique_Switcheur](
	[Historique_Switcheur] [int] IDENTITY(1,1) NOT NULL,
	[Historique_Switcheur_ID] [int] NOT NULL,
	[Historique_Switcheur_Statut_ancien] [int] NULL,
	[Historique_Switcheur_Statut_Nouveau] [int] NULL,
	[Historique_Switcheur_Type_Ancien] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[Historique_Switcheur_Type_Nouveau] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[Historique_Switcheur_Ip_Ancien] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[Historique_Switcheur_Ip_Nouveau] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[Historique_Switcheur_Mac_Ancien] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[Historique_Switcheur_Mac_Nouveau] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[Historique_Switcheur_Description_Ancien] [varchar](max) COLLATE Arabic_CI_AS NULL,
	[Historique_Switcheur_Description_Nouveau] [varchar](max) COLLATE Arabic_CI_AS NULL,
	[Historique_Switcheur_Date] [datetime] NULL,
	[Historique_Switcheur_Personnel] [varchar](50) COLLATE Arabic_CI_AS NULL,
 CONSTRAINT [PK_Historique_Switcheur] PRIMARY KEY CLUSTERED 
(
	[Historique_Switcheur] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historique_Routeur](
	[Historique_Routeur] [int] IDENTITY(1,1) NOT NULL,
	[Historique_Routeur_ID] [int] NOT NULL,
	[Historique_Routeur_Statut_ancien] [int] NULL,
	[Historique_Routeur_Statut_Nouveau] [int] NULL,
	[Historique_Routeur_Type_Ancien] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[Historique_Routeur_Type_Nouveau] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[Historique_Routeur_Ip_Ancien] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[Historique_Routeur_Ip_Nouveau] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[Historique_Routeur_Mac_Ancien] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[Historique_Routeur_Mac_Nouveau] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[Historique_Routeur_Description_Ancien] [varchar](max) COLLATE Arabic_CI_AS NULL,
	[Historique_Routeur_Description_Nouveau] [varchar](max) COLLATE Arabic_CI_AS NULL,
	[Historique_Routeur_Date] [datetime] NULL,
	[Historique_Routeur_Personnel] [varchar](50) COLLATE Arabic_CI_AS NULL,
 CONSTRAINT [PK_Historique_Routeur] PRIMARY KEY CLUSTERED 
(
	[Historique_Routeur] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historique_Modem](
	[Historique_Modem] [int] IDENTITY(1,1) NOT NULL,
	[Historique_Modem_ID] [int] NULL,
	[Historique_Modem_Statut_ancien] [int] NULL,
	[Historique_Modem_Statut_Nouveau] [int] NULL,
	[Historique_Modem_Type_Ancien] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[Historique_Modem_Type_Nouveau] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[Historique_Modem_Ip_Ancien] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[Historique_Modem_Ip_Nouveau] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[Historique_Modem_Mac_Ancien] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[Historique_Modem_Mac_Nouveau] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[Historique_Modem_Description_Ancien] [varchar](max) COLLATE Arabic_CI_AS NULL,
	[Historique_Modem_Description_Nouveau] [varchar](max) COLLATE Arabic_CI_AS NULL,
	[Historique_Modem_Date] [datetime] NULL,
	[Historique_Modem_Personnel] [varchar](50) COLLATE Arabic_CI_AS NULL,
 CONSTRAINT [PK_Historique_Modem] PRIMARY KEY CLUSTERED 
(
	[Historique_Modem] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historique_Liaison](
	[Historique_Liaison] [int] IDENTITY(1,1) NOT NULL,
	[Historique_Liaison_ID] [int] NOT NULL,
	[Historique_Liaison_Framerelay] [int] NULL,
	[Historique_Liaison_Adsl] [int] NULL,
	[Historique_Liaison_Description_Ancien] [varchar](max) COLLATE Arabic_CI_AS NULL,
	[Historique_Liaison_Description_Nouveau] [varchar](max) COLLATE Arabic_CI_AS NULL,
	[Historique_Liaison_Date] [datetime] NULL,
	[Historique_Liaison_Personnel] [varchar](50) COLLATE Arabic_CI_AS NULL,
 CONSTRAINT [PK_Historique_Liaison] PRIMARY KEY CLUSTERED 
(
	[Historique_Liaison] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historique_Equipements](
	[Historique_Equipement] [int] IDENTITY(1,1) NOT NULL,
	[Historique_Equipement_ID] [int] NULL,
	[Historique_Equipement_Routeur] [int] NULL,
	[Historique_Equipement_Modem] [int] NULL,
	[Historique_Equipement_Switcheur] [int] NULL,
	[Historique_Equipement_Description_Ancien] [varchar](max) COLLATE Arabic_CI_AS NULL,
	[Historique_Equipement_Description_Nouveau] [varchar](max) COLLATE Arabic_CI_AS NULL,
	[Historique_Equipement_Date] [datetime] NULL,
	[Historique_Equipement_Personnel] [varchar](50) COLLATE Arabic_CI_AS NULL,
 CONSTRAINT [PK_Historique_Equipements] PRIMARY KEY CLUSTERED 
(
	[Historique_Equipement] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historique_Agences](
	[Historique_ID] [int] IDENTITY(1,1) NOT NULL,
	[Historique_Agence_ID] [int] NULL,
	[Historique_Agence_Emplacement_ancien] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[Historique_Agence_Emplacement_nouveau] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[Historique_Agence_Equipements] [int] NULL,
	[Historique_Agence_Liaisons] [int] NULL,
	[Historique_Agence_Description_Ancien] [varchar](max) COLLATE Arabic_CI_AS NULL,
	[Historique_Agence_Description_Nouveau] [varchar](max) COLLATE Arabic_CI_AS NULL,
	[Historique_Agence_Date] [datetime] NULL,
	[Historique_Personnel] [varchar](50) COLLATE Arabic_CI_AS NULL,
 CONSTRAINT [PK_Historiques_Agences] PRIMARY KEY CLUSTERED 
(
	[Historique_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
ALTER TABLE [dbo].[Historique_Liaison]  WITH CHECK ADD  CONSTRAINT [FK_Historique_Liaison_Historique_Adsl] FOREIGN KEY([Historique_Liaison_Adsl])
REFERENCES [dbo].[Historique_Adsl] ([Historique_Adsl])
GO
ALTER TABLE [dbo].[Historique_Liaison] CHECK CONSTRAINT [FK_Historique_Liaison_Historique_Adsl]
GO
ALTER TABLE [dbo].[Historique_Liaison]  WITH CHECK ADD  CONSTRAINT [FK_Historique_Liaison_Historique_FrameRelay] FOREIGN KEY([Historique_Liaison_Framerelay])
REFERENCES [dbo].[Historique_FrameRelay] ([Historique_Framerelay])
GO
ALTER TABLE [dbo].[Historique_Liaison] CHECK CONSTRAINT [FK_Historique_Liaison_Historique_FrameRelay]
GO
ALTER TABLE [dbo].[Historique_Equipements]  WITH CHECK ADD  CONSTRAINT [FK_Historique_Equipements_Historique_Modem] FOREIGN KEY([Historique_Equipement_Modem])
REFERENCES [dbo].[Historique_Modem] ([Historique_Modem])
GO
ALTER TABLE [dbo].[Historique_Equipements] CHECK CONSTRAINT [FK_Historique_Equipements_Historique_Modem]
GO
ALTER TABLE [dbo].[Historique_Equipements]  WITH CHECK ADD  CONSTRAINT [FK_Historique_Equipements_Historique_Routeur] FOREIGN KEY([Historique_Equipement_Routeur])
REFERENCES [dbo].[Historique_Routeur] ([Historique_Routeur])
GO
ALTER TABLE [dbo].[Historique_Equipements] CHECK CONSTRAINT [FK_Historique_Equipements_Historique_Routeur]
GO
ALTER TABLE [dbo].[Historique_Equipements]  WITH CHECK ADD  CONSTRAINT [FK_Historique_Equipements_Historique_Switcheur] FOREIGN KEY([Historique_Equipement_Switcheur])
REFERENCES [dbo].[Historique_Switcheur] ([Historique_Switcheur])
GO
ALTER TABLE [dbo].[Historique_Equipements] CHECK CONSTRAINT [FK_Historique_Equipements_Historique_Switcheur]
GO
ALTER TABLE [dbo].[Historique_Agences]  WITH CHECK ADD  CONSTRAINT [FK_Historique_Agences_Historique_Equipements] FOREIGN KEY([Historique_Agence_Equipements])
REFERENCES [dbo].[Historique_Equipements] ([Historique_Equipement])
GO
ALTER TABLE [dbo].[Historique_Agences] CHECK CONSTRAINT [FK_Historique_Agences_Historique_Equipements]
GO
ALTER TABLE [dbo].[Historique_Agences]  WITH CHECK ADD  CONSTRAINT [FK_Historique_Agences_Historique_Liaison] FOREIGN KEY([Historique_Agence_Liaisons])
REFERENCES [dbo].[Historique_Liaison] ([Historique_Liaison])
GO
ALTER TABLE [dbo].[Historique_Agences] CHECK CONSTRAINT [FK_Historique_Agences_Historique_Liaison]
GO
