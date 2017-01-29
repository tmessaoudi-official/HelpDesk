
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 05/28/2012 19:58:21
-- Generated from EDMX file: C:\Helpdesk\Helpdesk\Entities\Agences\Agence.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Agences];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Adsl_inherits_Liaison]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Liaison_Adsl] DROP CONSTRAINT [FK_Adsl_inherits_Liaison];
GO
IF OBJECT_ID(N'[dbo].[FK_Agences_Respnosables]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Agences] DROP CONSTRAINT [FK_Agences_Respnosables];
GO
IF OBJECT_ID(N'[dbo].[FK_Agences_Zone]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Agences] DROP CONSTRAINT [FK_Agences_Zone];
GO
IF OBJECT_ID(N'[dbo].[FK_Equipement_Agences]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Equipement] DROP CONSTRAINT [FK_Equipement_Agences];
GO
IF OBJECT_ID(N'[dbo].[FK_Framerelay_inherits_Liaison]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Liaison_Framerelay] DROP CONSTRAINT [FK_Framerelay_inherits_Liaison];
GO
IF OBJECT_ID(N'[dbo].[FK_Historique_Login_Respnosables]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Historique_Login] DROP CONSTRAINT [FK_Historique_Login_Respnosables];
GO
IF OBJECT_ID(N'[dbo].[FK_Historiques_Adsls_Agences]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Historiques_Adsls] DROP CONSTRAINT [FK_Historiques_Adsls_Agences];
GO
IF OBJECT_ID(N'[dbo].[FK_Historiques_Adsls_Liaison_Adsl]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Historiques_Adsls] DROP CONSTRAINT [FK_Historiques_Adsls_Liaison_Adsl];
GO
IF OBJECT_ID(N'[dbo].[FK_Historiques_Agences_Agences]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Historiques_Agences] DROP CONSTRAINT [FK_Historiques_Agences_Agences];
GO
IF OBJECT_ID(N'[dbo].[FK_Historiques_Framerelays_Agences]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Historiques_Framerelays] DROP CONSTRAINT [FK_Historiques_Framerelays_Agences];
GO
IF OBJECT_ID(N'[dbo].[FK_Historiques_Framerelays_Liaison_Framerelay]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Historiques_Framerelays] DROP CONSTRAINT [FK_Historiques_Framerelays_Liaison_Framerelay];
GO
IF OBJECT_ID(N'[dbo].[FK_Historiques_Modems_Agences]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Historiques_Modems] DROP CONSTRAINT [FK_Historiques_Modems_Agences];
GO
IF OBJECT_ID(N'[dbo].[FK_Historiques_Modems_Equipement_Modems]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Historiques_Modems] DROP CONSTRAINT [FK_Historiques_Modems_Equipement_Modems];
GO
IF OBJECT_ID(N'[dbo].[FK_Historiques_Routeurs_Agences]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Historiques_Routeurs] DROP CONSTRAINT [FK_Historiques_Routeurs_Agences];
GO
IF OBJECT_ID(N'[dbo].[FK_Historiques_Routeurs_Equipement_Routeurs]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Historiques_Routeurs] DROP CONSTRAINT [FK_Historiques_Routeurs_Equipement_Routeurs];
GO
IF OBJECT_ID(N'[dbo].[FK_Historiques_Switcheurs_Agences]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Historiques_Switcheurs] DROP CONSTRAINT [FK_Historiques_Switcheurs_Agences];
GO
IF OBJECT_ID(N'[dbo].[FK_Historiques_Switcheurs_Equipement_Switchers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Historiques_Switcheurs] DROP CONSTRAINT [FK_Historiques_Switcheurs_Equipement_Switchers];
GO
IF OBJECT_ID(N'[dbo].[FK_Liaison_Agences]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Liaison] DROP CONSTRAINT [FK_Liaison_Agences];
GO
IF OBJECT_ID(N'[dbo].[FK_Modems_inherits_Equipement]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Equipement_Modems] DROP CONSTRAINT [FK_Modems_inherits_Equipement];
GO
IF OBJECT_ID(N'[dbo].[FK_Responsabilité_Agences]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Responsabilité] DROP CONSTRAINT [FK_Responsabilité_Agences];
GO
IF OBJECT_ID(N'[dbo].[FK_Responsabilité_Responsables]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Responsabilité] DROP CONSTRAINT [FK_Responsabilité_Responsables];
GO
IF OBJECT_ID(N'[dbo].[FK_Routeurs_inherits_Equipement]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Equipement_Routeurs] DROP CONSTRAINT [FK_Routeurs_inherits_Equipement];
GO
IF OBJECT_ID(N'[dbo].[FK_Switchers_inherits_Equipement]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Equipement_Switchers] DROP CONSTRAINT [FK_Switchers_inherits_Equipement];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Agences]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Agences];
GO
IF OBJECT_ID(N'[dbo].[Equipement]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Equipement];
GO
IF OBJECT_ID(N'[dbo].[Equipement_Modems]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Equipement_Modems];
GO
IF OBJECT_ID(N'[dbo].[Equipement_Routeurs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Equipement_Routeurs];
GO
IF OBJECT_ID(N'[dbo].[Equipement_Switchers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Equipement_Switchers];
GO
IF OBJECT_ID(N'[dbo].[Historique_Login]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Historique_Login];
GO
IF OBJECT_ID(N'[dbo].[Historiques_Adsls]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Historiques_Adsls];
GO
IF OBJECT_ID(N'[dbo].[Historiques_Agences]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Historiques_Agences];
GO
IF OBJECT_ID(N'[dbo].[Historiques_Framerelays]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Historiques_Framerelays];
GO
IF OBJECT_ID(N'[dbo].[Historiques_Modems]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Historiques_Modems];
GO
IF OBJECT_ID(N'[dbo].[Historiques_Routeurs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Historiques_Routeurs];
GO
IF OBJECT_ID(N'[dbo].[Historiques_Switcheurs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Historiques_Switcheurs];
GO
IF OBJECT_ID(N'[dbo].[Liaison]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Liaison];
GO
IF OBJECT_ID(N'[dbo].[Liaison_Adsl]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Liaison_Adsl];
GO
IF OBJECT_ID(N'[dbo].[Liaison_Framerelay]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Liaison_Framerelay];
GO
IF OBJECT_ID(N'[dbo].[Responsabilité]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Responsabilité];
GO
IF OBJECT_ID(N'[dbo].[Responsables]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Responsables];
GO
IF OBJECT_ID(N'[dbo].[Zones]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Zones];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Agences'
CREATE TABLE [dbo].[Agences] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Code] varchar(50)  NOT NULL,
    [Adresse_IP] varchar(50)  NOT NULL,
    [Nom] varchar(50)  NOT NULL,
    [Zone] int  NOT NULL,
    [Adresse] varchar(max)  NOT NULL,
    [Responsable] int  NOT NULL,
    [Descriptions] varchar(max)  NULL,
    [Equipement_Description] varchar(max)  NULL,
    [Liaison_Description] varchar(max)  NULL
);
GO

-- Creating table 'Equipement'
CREATE TABLE [dbo].[Equipement] (
    [Agence_ID] int  NOT NULL,
    [ID_Equipement] int IDENTITY(1,1) NOT NULL,
    [Etat] varchar(50)  NOT NULL,
    [Type] varchar(50)  NOT NULL,
    [Model] varchar(50)  NOT NULL,
    [Description] varchar(max)  NOT NULL
);
GO

-- Creating table 'Zones'
CREATE TABLE [dbo].[Zones] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Libelle] varchar(50)  NOT NULL,
    [Description] varchar(max)  NULL
);
GO

-- Creating table 'Liaison'
CREATE TABLE [dbo].[Liaison] (
    [ID_Liaison] int IDENTITY(1,1) NOT NULL,
    [Etat] nvarchar(max)  NOT NULL,
    [Adresse_IP] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Agence_ID] int  NOT NULL
);
GO

-- Creating table 'Historique_Login'
CREATE TABLE [dbo].[Historique_Login] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [ID_User] int  NULL,
    [Hostname] varchar(50)  NULL,
    [IPAdresse] varchar(50)  NULL,
    [Date] datetime  NULL,
    [Time] time  NULL
);
GO

-- Creating table 'Responsables'
CREATE TABLE [dbo].[Responsables] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Nom] varchar(50)  NULL,
    [Prenom] varchar(50)  NULL,
    [Email] varchar(70)  NULL,
    [Teléphone] varchar(50)  NULL,
    [Niveau] int  NULL,
    [Role] int  NULL,
    [Username] varchar(50)  NULL,
    [Password] varchar(50)  NULL
);
GO

-- Creating table 'Historiques_Adsls'
CREATE TABLE [dbo].[Historiques_Adsls] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Adsl_ID] int  NOT NULL,
    [Etat_Tunnel] varchar(50)  NOT NULL,
    [Etat_Carte] varchar(50)  NOT NULL,
    [Adresse_Tunnel] varchar(50)  NOT NULL,
    [Adresse_Carte] varchar(50)  NOT NULL,
    [Description] varchar(max)  NULL,
    [Date] datetime  NOT NULL,
    [Time] time  NOT NULL,
    [Personnel] varchar(50)  NOT NULL,
    [Agence_ID] int  NOT NULL
);
GO

-- Creating table 'Historiques_Agences'
CREATE TABLE [dbo].[Historiques_Agences] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Agence_ID] int  NOT NULL,
    [Code] varchar(50)  NOT NULL,
    [Adresse_IP] varchar(50)  NOT NULL,
    [Nom] varchar(50)  NOT NULL,
    [Zone] varchar(50)  NOT NULL,
    [Adresse] varchar(50)  NOT NULL,
    [Description] varchar(max)  NULL,
    [Equipement_Description] varchar(max)  NULL,
    [Liaison_Description] varchar(max)  NULL,
    [Date] datetime  NOT NULL,
    [Time] time  NOT NULL,
    [Personnel] varchar(50)  NOT NULL
);
GO

-- Creating table 'Historiques_Framerelays'
CREATE TABLE [dbo].[Historiques_Framerelays] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Framerelay_ID] int  NOT NULL,
    [Etat] varchar(50)  NOT NULL,
    [Adresse_IP] varchar(50)  NOT NULL,
    [Description] varchar(max)  NULL,
    [Date] datetime  NOT NULL,
    [Time] time  NOT NULL,
    [Personnel] varchar(50)  NULL,
    [Agence_ID] int  NOT NULL
);
GO

-- Creating table 'Historiques_Modems'
CREATE TABLE [dbo].[Historiques_Modems] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Modem_ID] int  NOT NULL,
    [Etat] varchar(50)  NOT NULL,
    [Type] varchar(50)  NOT NULL,
    [Model] varchar(50)  NOT NULL,
    [Description] varchar(max)  NULL,
    [Date] datetime  NOT NULL,
    [Time] time  NOT NULL,
    [Personnel] varchar(50)  NOT NULL,
    [Agence_ID] int  NOT NULL
);
GO

-- Creating table 'Historiques_Routeurs'
CREATE TABLE [dbo].[Historiques_Routeurs] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Routeur_ID] int  NOT NULL,
    [Etat] varchar(50)  NOT NULL,
    [Type] varchar(50)  NOT NULL,
    [Model] varchar(50)  NOT NULL,
    [Adresse_IP] varchar(50)  NOT NULL,
    [Adresse_MAC] varchar(50)  NOT NULL,
    [Description] varchar(max)  NULL,
    [Date] datetime  NOT NULL,
    [Time] time  NOT NULL,
    [Personnel] varchar(50)  NOT NULL,
    [Agence_ID] int  NOT NULL
);
GO

-- Creating table 'Historiques_Switcheurs'
CREATE TABLE [dbo].[Historiques_Switcheurs] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Switcheur_ID] int  NOT NULL,
    [Etat] varchar(50)  NOT NULL,
    [Type] varchar(50)  NOT NULL,
    [Model] varchar(50)  NOT NULL,
    [Adresse_IP] varchar(50)  NOT NULL,
    [Adresse_MAC] varchar(50)  NOT NULL,
    [Description] varchar(max)  NULL,
    [Date] datetime  NOT NULL,
    [Time] time  NOT NULL,
    [Personnel] varchar(50)  NOT NULL,
    [Agence_ID] int  NOT NULL
);
GO

-- Creating table 'Responsabilité'
CREATE TABLE [dbo].[Responsabilité] (
    [Agence_ID] int  NOT NULL,
    [Responsable_ID] int  NOT NULL,
    [DateDebut] datetime  NOT NULL,
    [DateFin] datetime  NULL
);
GO

-- Creating table 'Equipement_Modems'
CREATE TABLE [dbo].[Equipement_Modems] (
    [ID_Equipement] int  NOT NULL
);
GO

-- Creating table 'Equipement_Routeurs'
CREATE TABLE [dbo].[Equipement_Routeurs] (
    [Adresse_IP] varchar(50)  NOT NULL,
    [Adresse_MAC] varchar(50)  NOT NULL,
    [ID_Equipement] int  NOT NULL
);
GO

-- Creating table 'Equipement_Switchers'
CREATE TABLE [dbo].[Equipement_Switchers] (
    [Adresse_IP] varchar(50)  NOT NULL,
    [Adresse_MAC] varchar(50)  NOT NULL,
    [ID_Equipement] int  NOT NULL
);
GO

-- Creating table 'Liaison_Adsl'
CREATE TABLE [dbo].[Liaison_Adsl] (
    [Etat_Carte] nvarchar(max)  NOT NULL,
    [Adresse_Carte] nvarchar(max)  NOT NULL,
    [ID_Liaison] int  NOT NULL
);
GO

-- Creating table 'Liaison_Framerelay'
CREATE TABLE [dbo].[Liaison_Framerelay] (
    [ID_Liaison] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'Agences'
ALTER TABLE [dbo].[Agences]
ADD CONSTRAINT [PK_Agences]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID_Equipement] in table 'Equipement'
ALTER TABLE [dbo].[Equipement]
ADD CONSTRAINT [PK_Equipement]
    PRIMARY KEY CLUSTERED ([ID_Equipement] ASC);
GO

-- Creating primary key on [ID] in table 'Zones'
ALTER TABLE [dbo].[Zones]
ADD CONSTRAINT [PK_Zones]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID_Liaison] in table 'Liaison'
ALTER TABLE [dbo].[Liaison]
ADD CONSTRAINT [PK_Liaison]
    PRIMARY KEY CLUSTERED ([ID_Liaison] ASC);
GO

-- Creating primary key on [ID] in table 'Historique_Login'
ALTER TABLE [dbo].[Historique_Login]
ADD CONSTRAINT [PK_Historique_Login]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Responsables'
ALTER TABLE [dbo].[Responsables]
ADD CONSTRAINT [PK_Responsables]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Historiques_Adsls'
ALTER TABLE [dbo].[Historiques_Adsls]
ADD CONSTRAINT [PK_Historiques_Adsls]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Historiques_Agences'
ALTER TABLE [dbo].[Historiques_Agences]
ADD CONSTRAINT [PK_Historiques_Agences]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Historiques_Framerelays'
ALTER TABLE [dbo].[Historiques_Framerelays]
ADD CONSTRAINT [PK_Historiques_Framerelays]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Historiques_Modems'
ALTER TABLE [dbo].[Historiques_Modems]
ADD CONSTRAINT [PK_Historiques_Modems]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Historiques_Routeurs'
ALTER TABLE [dbo].[Historiques_Routeurs]
ADD CONSTRAINT [PK_Historiques_Routeurs]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Historiques_Switcheurs'
ALTER TABLE [dbo].[Historiques_Switcheurs]
ADD CONSTRAINT [PK_Historiques_Switcheurs]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [Agence_ID], [Responsable_ID], [DateDebut] in table 'Responsabilité'
ALTER TABLE [dbo].[Responsabilité]
ADD CONSTRAINT [PK_Responsabilité]
    PRIMARY KEY CLUSTERED ([Agence_ID], [Responsable_ID], [DateDebut] ASC);
GO

-- Creating primary key on [ID_Equipement] in table 'Equipement_Modems'
ALTER TABLE [dbo].[Equipement_Modems]
ADD CONSTRAINT [PK_Equipement_Modems]
    PRIMARY KEY CLUSTERED ([ID_Equipement] ASC);
GO

-- Creating primary key on [ID_Equipement] in table 'Equipement_Routeurs'
ALTER TABLE [dbo].[Equipement_Routeurs]
ADD CONSTRAINT [PK_Equipement_Routeurs]
    PRIMARY KEY CLUSTERED ([ID_Equipement] ASC);
GO

-- Creating primary key on [ID_Equipement] in table 'Equipement_Switchers'
ALTER TABLE [dbo].[Equipement_Switchers]
ADD CONSTRAINT [PK_Equipement_Switchers]
    PRIMARY KEY CLUSTERED ([ID_Equipement] ASC);
GO

-- Creating primary key on [ID_Liaison] in table 'Liaison_Adsl'
ALTER TABLE [dbo].[Liaison_Adsl]
ADD CONSTRAINT [PK_Liaison_Adsl]
    PRIMARY KEY CLUSTERED ([ID_Liaison] ASC);
GO

-- Creating primary key on [ID_Liaison] in table 'Liaison_Framerelay'
ALTER TABLE [dbo].[Liaison_Framerelay]
ADD CONSTRAINT [PK_Liaison_Framerelay]
    PRIMARY KEY CLUSTERED ([ID_Liaison] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Zone] in table 'Agences'
ALTER TABLE [dbo].[Agences]
ADD CONSTRAINT [FK_Agences_Zone]
    FOREIGN KEY ([Zone])
    REFERENCES [dbo].[Zones]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Agences_Zone'
CREATE INDEX [IX_FK_Agences_Zone]
ON [dbo].[Agences]
    ([Zone]);
GO

-- Creating foreign key on [Responsable] in table 'Agences'
ALTER TABLE [dbo].[Agences]
ADD CONSTRAINT [FK_Agences_Respnosables]
    FOREIGN KEY ([Responsable])
    REFERENCES [dbo].[Responsables]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Agences_Respnosables'
CREATE INDEX [IX_FK_Agences_Respnosables]
ON [dbo].[Agences]
    ([Responsable]);
GO

-- Creating foreign key on [Agence_ID] in table 'Equipement'
ALTER TABLE [dbo].[Equipement]
ADD CONSTRAINT [FK_Equipement_Agences]
    FOREIGN KEY ([Agence_ID])
    REFERENCES [dbo].[Agences]
        ([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Equipement_Agences'
CREATE INDEX [IX_FK_Equipement_Agences]
ON [dbo].[Equipement]
    ([Agence_ID]);
GO

-- Creating foreign key on [Agence_ID] in table 'Liaison'
ALTER TABLE [dbo].[Liaison]
ADD CONSTRAINT [FK_Liaison_Agences]
    FOREIGN KEY ([Agence_ID])
    REFERENCES [dbo].[Agences]
        ([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Liaison_Agences'
CREATE INDEX [IX_FK_Liaison_Agences]
ON [dbo].[Liaison]
    ([Agence_ID]);
GO

-- Creating foreign key on [ID_User] in table 'Historique_Login'
ALTER TABLE [dbo].[Historique_Login]
ADD CONSTRAINT [FK_Historique_Login_Respnosables]
    FOREIGN KEY ([ID_User])
    REFERENCES [dbo].[Responsables]
        ([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Historique_Login_Respnosables'
CREATE INDEX [IX_FK_Historique_Login_Respnosables]
ON [dbo].[Historique_Login]
    ([ID_User]);
GO

-- Creating foreign key on [Agence_ID] in table 'Historiques_Agences'
ALTER TABLE [dbo].[Historiques_Agences]
ADD CONSTRAINT [FK_Historiques_Agences_Agences]
    FOREIGN KEY ([Agence_ID])
    REFERENCES [dbo].[Agences]
        ([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Historiques_Agences_Agences'
CREATE INDEX [IX_FK_Historiques_Agences_Agences]
ON [dbo].[Historiques_Agences]
    ([Agence_ID]);
GO

-- Creating foreign key on [Modem_ID] in table 'Historiques_Modems'
ALTER TABLE [dbo].[Historiques_Modems]
ADD CONSTRAINT [FK_Historiques_Modems_Equipement_Modems]
    FOREIGN KEY ([Modem_ID])
    REFERENCES [dbo].[Equipement_Modems]
        ([ID_Equipement])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Historiques_Modems_Equipement_Modems'
CREATE INDEX [IX_FK_Historiques_Modems_Equipement_Modems]
ON [dbo].[Historiques_Modems]
    ([Modem_ID]);
GO

-- Creating foreign key on [Routeur_ID] in table 'Historiques_Routeurs'
ALTER TABLE [dbo].[Historiques_Routeurs]
ADD CONSTRAINT [FK_Historiques_Routeurs_Equipement_Routeurs]
    FOREIGN KEY ([Routeur_ID])
    REFERENCES [dbo].[Equipement_Routeurs]
        ([ID_Equipement])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Historiques_Routeurs_Equipement_Routeurs'
CREATE INDEX [IX_FK_Historiques_Routeurs_Equipement_Routeurs]
ON [dbo].[Historiques_Routeurs]
    ([Routeur_ID]);
GO

-- Creating foreign key on [Switcheur_ID] in table 'Historiques_Switcheurs'
ALTER TABLE [dbo].[Historiques_Switcheurs]
ADD CONSTRAINT [FK_Historiques_Switcheurs_Equipement_Switchers]
    FOREIGN KEY ([Switcheur_ID])
    REFERENCES [dbo].[Equipement_Switchers]
        ([ID_Equipement])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Historiques_Switcheurs_Equipement_Switchers'
CREATE INDEX [IX_FK_Historiques_Switcheurs_Equipement_Switchers]
ON [dbo].[Historiques_Switcheurs]
    ([Switcheur_ID]);
GO

-- Creating foreign key on [Adsl_ID] in table 'Historiques_Adsls'
ALTER TABLE [dbo].[Historiques_Adsls]
ADD CONSTRAINT [FK_Historiques_Adsls_Liaison_Adsl]
    FOREIGN KEY ([Adsl_ID])
    REFERENCES [dbo].[Liaison_Adsl]
        ([ID_Liaison])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Historiques_Adsls_Liaison_Adsl'
CREATE INDEX [IX_FK_Historiques_Adsls_Liaison_Adsl]
ON [dbo].[Historiques_Adsls]
    ([Adsl_ID]);
GO

-- Creating foreign key on [Framerelay_ID] in table 'Historiques_Framerelays'
ALTER TABLE [dbo].[Historiques_Framerelays]
ADD CONSTRAINT [FK_Historiques_Framerelays_Liaison_Framerelay]
    FOREIGN KEY ([Framerelay_ID])
    REFERENCES [dbo].[Liaison_Framerelay]
        ([ID_Liaison])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Historiques_Framerelays_Liaison_Framerelay'
CREATE INDEX [IX_FK_Historiques_Framerelays_Liaison_Framerelay]
ON [dbo].[Historiques_Framerelays]
    ([Framerelay_ID]);
GO

-- Creating foreign key on [Agence_ID] in table 'Historiques_Adsls'
ALTER TABLE [dbo].[Historiques_Adsls]
ADD CONSTRAINT [FK_Historiques_Adsls_Agences]
    FOREIGN KEY ([Agence_ID])
    REFERENCES [dbo].[Agences]
        ([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Historiques_Adsls_Agences'
CREATE INDEX [IX_FK_Historiques_Adsls_Agences]
ON [dbo].[Historiques_Adsls]
    ([Agence_ID]);
GO

-- Creating foreign key on [Agence_ID] in table 'Historiques_Framerelays'
ALTER TABLE [dbo].[Historiques_Framerelays]
ADD CONSTRAINT [FK_Historiques_Framerelays_Agences]
    FOREIGN KEY ([Agence_ID])
    REFERENCES [dbo].[Agences]
        ([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Historiques_Framerelays_Agences'
CREATE INDEX [IX_FK_Historiques_Framerelays_Agences]
ON [dbo].[Historiques_Framerelays]
    ([Agence_ID]);
GO

-- Creating foreign key on [Agence_ID] in table 'Historiques_Modems'
ALTER TABLE [dbo].[Historiques_Modems]
ADD CONSTRAINT [FK_Historiques_Modems_Agences]
    FOREIGN KEY ([Agence_ID])
    REFERENCES [dbo].[Agences]
        ([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Historiques_Modems_Agences'
CREATE INDEX [IX_FK_Historiques_Modems_Agences]
ON [dbo].[Historiques_Modems]
    ([Agence_ID]);
GO

-- Creating foreign key on [Agence_ID] in table 'Historiques_Routeurs'
ALTER TABLE [dbo].[Historiques_Routeurs]
ADD CONSTRAINT [FK_Historiques_Routeurs_Agences]
    FOREIGN KEY ([Agence_ID])
    REFERENCES [dbo].[Agences]
        ([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Historiques_Routeurs_Agences'
CREATE INDEX [IX_FK_Historiques_Routeurs_Agences]
ON [dbo].[Historiques_Routeurs]
    ([Agence_ID]);
GO

-- Creating foreign key on [Agence_ID] in table 'Historiques_Switcheurs'
ALTER TABLE [dbo].[Historiques_Switcheurs]
ADD CONSTRAINT [FK_Historiques_Switcheurs_Agences]
    FOREIGN KEY ([Agence_ID])
    REFERENCES [dbo].[Agences]
        ([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Historiques_Switcheurs_Agences'
CREATE INDEX [IX_FK_Historiques_Switcheurs_Agences]
ON [dbo].[Historiques_Switcheurs]
    ([Agence_ID]);
GO

-- Creating foreign key on [Agence_ID] in table 'Responsabilité'
ALTER TABLE [dbo].[Responsabilité]
ADD CONSTRAINT [FK_Responsabilité_Agences]
    FOREIGN KEY ([Agence_ID])
    REFERENCES [dbo].[Agences]
        ([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Responsable_ID] in table 'Responsabilité'
ALTER TABLE [dbo].[Responsabilité]
ADD CONSTRAINT [FK_Responsabilité_Responsables]
    FOREIGN KEY ([Responsable_ID])
    REFERENCES [dbo].[Responsables]
        ([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Responsabilité_Responsables'
CREATE INDEX [IX_FK_Responsabilité_Responsables]
ON [dbo].[Responsabilité]
    ([Responsable_ID]);
GO

-- Creating foreign key on [ID_Equipement] in table 'Equipement_Modems'
ALTER TABLE [dbo].[Equipement_Modems]
ADD CONSTRAINT [FK_Modems_inherits_Equipement]
    FOREIGN KEY ([ID_Equipement])
    REFERENCES [dbo].[Equipement]
        ([ID_Equipement])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ID_Equipement] in table 'Equipement_Routeurs'
ALTER TABLE [dbo].[Equipement_Routeurs]
ADD CONSTRAINT [FK_Routeurs_inherits_Equipement]
    FOREIGN KEY ([ID_Equipement])
    REFERENCES [dbo].[Equipement]
        ([ID_Equipement])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ID_Equipement] in table 'Equipement_Switchers'
ALTER TABLE [dbo].[Equipement_Switchers]
ADD CONSTRAINT [FK_Switchers_inherits_Equipement]
    FOREIGN KEY ([ID_Equipement])
    REFERENCES [dbo].[Equipement]
        ([ID_Equipement])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ID_Liaison] in table 'Liaison_Adsl'
ALTER TABLE [dbo].[Liaison_Adsl]
ADD CONSTRAINT [FK_Adsl_inherits_Liaison]
    FOREIGN KEY ([ID_Liaison])
    REFERENCES [dbo].[Liaison]
        ([ID_Liaison])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ID_Liaison] in table 'Liaison_Framerelay'
ALTER TABLE [dbo].[Liaison_Framerelay]
ADD CONSTRAINT [FK_Framerelay_inherits_Liaison]
    FOREIGN KEY ([ID_Liaison])
    REFERENCES [dbo].[Liaison]
        ([ID_Liaison])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------