SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adsl](
	[Adsl_ID] [int] IDENTITY(1,1) NOT NULL,
	[Adsl_Statut] [int] NOT NULL,
	[Adsl_Identificateur] [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
	[Adsl_Description] [varchar](max) COLLATE Arabic_CI_AS NULL,
 CONSTRAINT [PK_Adsl] PRIMARY KEY CLUSTERED 
(
	[Adsl_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emplacement](
	[Emplacement_ID] [int] IDENTITY(1,1) NOT NULL,
	[Emplacement_Libelle] [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
	[Emplacement_Description] [varchar](max) COLLATE Arabic_CI_AS NULL,
 CONSTRAINT [PK_Emplcament] PRIMARY KEY CLUSTERED 
(
	[Emplacement_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Framerelay](
	[Framerelay_ID] [int] IDENTITY(1,1) NOT NULL,
	[Framerelay_Statut] [int] NOT NULL,
	[Framerelay_Identificateur] [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
	[Framerelay_Description] [varchar](max) COLLATE Arabic_CI_AS NULL,
 CONSTRAINT [PK_Framerelay] PRIMARY KEY CLUSTERED 
(
	[Framerelay_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Switcheurs](
	[Switcheur_ID] [int] IDENTITY(1,1) NOT NULL,
	[Switcheur_Statut] [int] NOT NULL,
	[Switcheur_Type] [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
	[Switcheur_IPadress] [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
	[Switcheur_Macadress] [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
	[Switcheur_Description] [varchar](max) COLLATE Arabic_CI_AS NULL,
 CONSTRAINT [PK_Switcheurs] PRIMARY KEY CLUSTERED 
(
	[Switcheur_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Routeurs](
	[Routeur_ID] [int] IDENTITY(1,1) NOT NULL,
	[Routeur_Statut] [int] NOT NULL,
	[Routeur_Type] [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
	[Routeur_IPadress] [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
	[Routeur_Macadress] [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
	[Routeur_Description] [varchar](max) COLLATE Arabic_CI_AS NULL,
 CONSTRAINT [PK_Routers] PRIMARY KEY CLUSTERED 
(
	[Routeur_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respnosable_Agence](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[Prenom] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[Email] [varchar](70) COLLATE Arabic_CI_AS NULL,
	[Teléphone] [varchar](50) COLLATE Arabic_CI_AS NULL,
 CONSTRAINT [PK_Respnosable_Agence] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modems](
	[Modem_ID] [int] IDENTITY(1,1) NOT NULL,
	[Modem_Statut] [int] NOT NULL,
	[Modem_Type] [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
	[Modem_IPadress] [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
	[Modem_Macadress] [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
	[Modem_Description] [varchar](max) COLLATE Arabic_CI_AS NULL,
 CONSTRAINT [PK_Modems] PRIMARY KEY CLUSTERED 
(
	[Modem_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Liaisons](
	[Liaison_ID] [int] IDENTITY(1,1) NOT NULL,
	[Liaison_Framerelay] [int] NOT NULL,
	[Liaison_Adsl] [int] NOT NULL,
	[Liaison_Description] [varchar](max) COLLATE Arabic_CI_AS NULL,
 CONSTRAINT [PK_Liaisons] PRIMARY KEY CLUSTERED 
(
	[Liaison_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipements](
	[Equipement_ID] [int] IDENTITY(1,1) NOT NULL,
	[Equipement_Routeur] [int] NOT NULL,
	[Equipement_Modem] [int] NOT NULL,
	[Equipement_Switcheur] [int] NOT NULL,
	[Equipement_Description] [varchar](max) COLLATE Arabic_CI_AS NULL,
 CONSTRAINT [PK_Equipements] PRIMARY KEY CLUSTERED 
(
	[Equipement_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agences](
	[Agence_ID] [int] IDENTITY(1,1) NOT NULL,
	[Agence_Emplacement] [int] NOT NULL,
	[Agence_Zone] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[Adress] [varchar](max) COLLATE Arabic_CI_AS NULL,
	[Agence_Coordonnee_Responsable] [int] NULL,
	[Agence_Equipements] [int] NOT NULL,
	[Agence_Liaisons] [int] NOT NULL,
	[Agence_Descriptions] [varchar](max) COLLATE Arabic_CI_AS NULL,
 CONSTRAINT [PK_Agences] PRIMARY KEY CLUSTERED 
(
	[Agence_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
ALTER TABLE [dbo].[Liaisons]  WITH CHECK ADD  CONSTRAINT [FK_Liaisons_Adsl1] FOREIGN KEY([Liaison_Adsl])
REFERENCES [dbo].[Adsl] ([Adsl_ID])
GO
ALTER TABLE [dbo].[Liaisons] CHECK CONSTRAINT [FK_Liaisons_Adsl1]
GO
ALTER TABLE [dbo].[Liaisons]  WITH CHECK ADD  CONSTRAINT [FK_Liaisons_Framerelay1] FOREIGN KEY([Liaison_Framerelay])
REFERENCES [dbo].[Framerelay] ([Framerelay_ID])
GO
ALTER TABLE [dbo].[Liaisons] CHECK CONSTRAINT [FK_Liaisons_Framerelay1]
GO
ALTER TABLE [dbo].[Equipements]  WITH CHECK ADD  CONSTRAINT [FK_Equipements_Modems1] FOREIGN KEY([Equipement_Modem])
REFERENCES [dbo].[Modems] ([Modem_ID])
GO
ALTER TABLE [dbo].[Equipements] CHECK CONSTRAINT [FK_Equipements_Modems1]
GO
ALTER TABLE [dbo].[Equipements]  WITH CHECK ADD  CONSTRAINT [FK_Equipements_Routeurs1] FOREIGN KEY([Equipement_Routeur])
REFERENCES [dbo].[Routeurs] ([Routeur_ID])
GO
ALTER TABLE [dbo].[Equipements] CHECK CONSTRAINT [FK_Equipements_Routeurs1]
GO
ALTER TABLE [dbo].[Equipements]  WITH CHECK ADD  CONSTRAINT [FK_Equipements_Switcheurs1] FOREIGN KEY([Equipement_Switcheur])
REFERENCES [dbo].[Switcheurs] ([Switcheur_ID])
GO
ALTER TABLE [dbo].[Equipements] CHECK CONSTRAINT [FK_Equipements_Switcheurs1]
GO
ALTER TABLE [dbo].[Agences]  WITH CHECK ADD  CONSTRAINT [FK_Agences_Emplcament] FOREIGN KEY([Agence_Emplacement])
REFERENCES [dbo].[Emplacement] ([Emplacement_ID])
GO
ALTER TABLE [dbo].[Agences] CHECK CONSTRAINT [FK_Agences_Emplcament]
GO
ALTER TABLE [dbo].[Agences]  WITH CHECK ADD  CONSTRAINT [FK_Agences_Equipements1] FOREIGN KEY([Agence_Equipements])
REFERENCES [dbo].[Equipements] ([Equipement_ID])
GO
ALTER TABLE [dbo].[Agences] CHECK CONSTRAINT [FK_Agences_Equipements1]
GO
ALTER TABLE [dbo].[Agences]  WITH CHECK ADD  CONSTRAINT [FK_Agences_Liaisons1] FOREIGN KEY([Agence_Liaisons])
REFERENCES [dbo].[Liaisons] ([Liaison_ID])
GO
ALTER TABLE [dbo].[Agences] CHECK CONSTRAINT [FK_Agences_Liaisons1]
GO
ALTER TABLE [dbo].[Agences]  WITH CHECK ADD  CONSTRAINT [FK_Agences_Respnosable_Agence] FOREIGN KEY([Agence_Coordonnee_Responsable])
REFERENCES [dbo].[Respnosable_Agence] ([ID])
GO
ALTER TABLE [dbo].[Agences] CHECK CONSTRAINT [FK_Agences_Respnosable_Agence]
GO
